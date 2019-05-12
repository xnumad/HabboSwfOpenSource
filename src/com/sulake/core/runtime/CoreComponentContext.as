package com.sulake.core.runtime
{
    import com.sulake.core.utils.LibraryLoaderQueue;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.core.Core;
    import flash.utils.getTimer;
    import flash.events.Event;
    import com.sulake.core.utils.profiler.ProfilerViewer;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.utils.PurgeTrigger;
    import com.sulake.core.utils.LibraryLoader;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.net.URLRequest;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import com.sulake.core.runtime.events.LibraryProgressEvent;
    import flash.utils.getQualifiedClassName;

    public final class CoreComponentContext extends ComponentContext implements ICore 
    {
        private static const NUM_UPDATE_RECEIVER_LEVELS:uint = 3;
        private static const CONFIG_XML_NODE_ASSET_LIBRARIES:String = "asset-libraries";
        private static const CONFIG_XML_NODE_ASSET_LIBRARY:String = "library";
        private static const CONFIG_XML_NODE_SERVICE_LIBRARIES:String = "service-libraries";
        private static const CONFIG_XML_NODE_SERVICE_LIBRARY:String = "library";
        private static const CONFIG_XML_NODE_COMPONENT_LIBRARIES:String = "component-libraries";
        private static const CONFIG_XML_NODE_COMPONENT_LIBRARY:String = "library";

        private var _libraryLoaderQueue:LibraryLoaderQueue;
        private var _loadingEventDelegate:IEventDispatcher;
        private var _numberOfFilesInConfig:uint;
        private var _frameUpdateMethod:Function;
        private var _profiler:Profiler;
        private var _errorReporter:ICoreErrorLogger;
        private var _updateReceiversByPriority:Array;
        private var _framesSkippedByPriority:Array;
        private var _lastUpdateTimeMs:uint;
        private var _flags:uint = 0;
        private var _hibernationLevel:int = -1;
        private var _hibernationUpdateFrequency:uint;

        public function CoreComponentContext(displayContainer:DisplayObjectContainer, errorLogger:ICoreErrorLogger, flags:uint)
        {
            super(this, Component.COMPONENT_FLAG_CONTEXT, new AssetLibraryCollection("_core_assets"));
            this._flags = flags;
            _debug = ((flags & Core.CORE_SETUP_DEBUG) == Core.CORE_SETUP_DEBUG);
            this._updateReceiversByPriority = new Array();
            this._framesSkippedByPriority = new Array();
            _displayObjectContainer = displayContainer;
            this._errorReporter = errorLogger;
            for (var level:uint = 0; level < CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS; level++ )
            {
                this._updateReceiversByPriority.push(new Array());
                this._framesSkippedByPriority.push(0);
            }
            this._lastUpdateTimeMs = getTimer();
            attachComponent(this, [new IIDCore()]);
            _displayObjectContainer.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            switch ((flags & Core.CORE_SETUP_FRAME_UPDATE_MASK))
            {
                case Core.CORE_SETUP_FRAME_UPDATE_SIMPLE:
                    debug("Core; using simple frame update handler");
                    this._frameUpdateMethod = this.simpleFrameUpdateHandler;
                    return;
                case Core.CORE_SETUP_FRAME_UPDATE_COMPLEX:
                    debug("Core; using complex frame update handler");
                    this._frameUpdateMethod = this.complexFrameUpdateHandler;
                    return;
                case Core.CORE_SETUP_FRAME_UPDATE_PROFILER:
                    debug("Core; using profiler frame update handler");
                    this._frameUpdateMethod = this.profilerFrameUpdateHandler;
                    this._profiler = new Profiler(this);
                    attachComponent(this._profiler, [new IIDProfiler()]);
                    _displayObjectContainer.addChild(new ProfilerViewer(this._profiler));
                    return;
                case Core.CORE_SETUP_FRAME_UPDATE_EXPERIMENT:
                    debug("Core; using experimental frame update handler");
                    this._frameUpdateMethod = this.experimentalFrameUpdateHandler;
                    return;
                case Core.CORE_SETUP_DEBUG:
                    debug("Core; using debug frame update handler");
                    this._frameUpdateMethod = this.debugFrameUpdateHandler;
                    return;
            }
        }

        public function getNumberOfFilesPending():uint
        {
            return this._libraryLoaderQueue.length;
        }

        public function getNumberOfFilesLoaded():uint
        {
            return this._numberOfFilesInConfig - this.getNumberOfFilesPending();
        }

        public function initialize():void
        {
            if (this.hasLockedComponents())
            {
                events.addEventListener(COMPONENT_EVENT_UNLOCKED, this.unlockEventHandler);
            }
            else
            {
                this.doInitialize();
            }
        }

        private function unlockEventHandler(k:Event):void
        {
            if (!this.hasLockedComponents())
            {
                events.removeEventListener(COMPONENT_EVENT_UNLOCKED, this.unlockEventHandler);
                this.doInitialize();
            }
        }

        private function doInitialize():void
        {
            events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
            PurgeTrigger.start();
        }

        public function hasLockedComponents():Boolean
        {
            var k:Component;
            if (_components != null)
            {
                for each (k in _components)
                {
                    if (k.locked)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        override public function dispose():void
        {
            var k:uint;
            var _local_2:Array;
            var _local_3:*;
            var _local_4:uint;
            if (!disposed)
            {
                debug("Disposing core");
                PurgeTrigger.stop();
                try
                {
                    _local_4 = 0;
                    while (_local_4 < CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS)
                    {
                        _local_2 = (this._updateReceiversByPriority[_local_4] as Array);
                        k = _local_2.length;
                        while (k-- > 0)
                        {
                            _local_3 = _local_2.pop();
                            if ((_local_3 is UpdateDelegate))
                            {
                                UpdateDelegate(_local_3).dispose();
                            }
                        }
                        _local_4++;
                    }
                }
                catch(e:Error)
                {
                }
                if (_displayObjectContainer)
                {
                    _displayObjectContainer.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
                    _displayObjectContainer = null;
                }
                if (this._libraryLoaderQueue != null)
                {
                    this._libraryLoaderQueue.dispose();
                    this._libraryLoaderQueue = null;
                }
                super.dispose();
            }
        }

        override public function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            super.error(k, _arg_2, _arg_3, _arg_4);
            this._errorReporter.logError(k, _arg_2, _arg_3, _arg_4);
            if (_arg_2)
            {
                this.dispose();
            }
        }

        public function readConfigDocument(k:XML, _arg_2:IEventDispatcher=null):void
        {
            var _local_3:XML;
            var _local_4:XMLList;
            var _local_5:XML;
            var _local_6:String;
            var _local_7:LibraryLoader;
            var _local_8:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
            debug("Parsing config document");
            this._loadingEventDelegate = _arg_2;
            if (this._libraryLoaderQueue == null)
            {
                this._libraryLoaderQueue = new LibraryLoaderQueue(_debug);
            }
            _local_3 = k.child(CONFIG_XML_NODE_ASSET_LIBRARIES)[0];
            if (_local_3 != null)
            {
                _local_4 = _local_3.child(CONFIG_XML_NODE_ASSET_LIBRARY);
                for each (_local_5 in _local_4)
                {
                    _local_6 = _local_5.attribute("url").toString();
                    _local_7 = new LibraryLoader(_local_8, true, _debug);
                    assets.loadFromFile(_local_7, true);
                    _local_7.load(new URLRequest(_local_6));
                    this._libraryLoaderQueue.push(_local_7);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.updateLoadingProcess);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.errorInLoadingProcess);
                    this._numberOfFilesInConfig++;
                }
            }
            _local_3 = k.child(CONFIG_XML_NODE_SERVICE_LIBRARIES)[0];
            if (_local_3 != null)
            {
                _local_4 = _local_3.child(CONFIG_XML_NODE_SERVICE_LIBRARY);
                for each (_local_5 in _local_4)
                {
                    _local_6 = _local_5.attribute("url").toString();
                    _local_7 = new LibraryLoader(_local_8, true, _debug);
                    _local_7.load(new URLRequest(_local_6));
                    this._libraryLoaderQueue.push(_local_7);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.updateLoadingProcess);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.errorInLoadingProcess);
                    this._numberOfFilesInConfig++;
                }
            }
            _local_3 = k.child(CONFIG_XML_NODE_COMPONENT_LIBRARIES)[0];
            if (_local_3 != null)
            {
                _local_4 = _local_3.child(CONFIG_XML_NODE_COMPONENT_LIBRARY);
                for each (_local_5 in _local_4)
                {
                    _local_6 = _local_5.attribute("url").toString();
                    _local_7 = new LibraryLoader(_local_8, true, _debug);
                    _local_7.load(new URLRequest(_local_6));
                    this._libraryLoaderQueue.push(_local_7);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.updateLoadingProcess);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.errorInLoadingProcess);
                    this._numberOfFilesInConfig++;
                }
            }
            if (!disposed)
            {
                this.updateLoadingProcess();
            }
        }

        private function errorInLoadingProcess(k:LibraryLoaderEvent=null):void
        {
            var _local_2:LibraryLoader = LibraryLoader(k.target);
            this.error(((((((((('Failed to download library "' + _local_2.url) + '" HTTP status ') + k.status) + " bytes loaded ") + k.bytesLoaded) + "/") + k.bytesTotal) + " : ") + _local_2.getLastErrorMessage()), true, Core.ERROR_CATEGORY_DOWNLOAD_LIBRARY);
            if (!disposed)
            {
                this.updateLoadingProcess(k);
            }
        }

        private function finalizeLoadingEventDelegate():void
        {
            if (this._loadingEventDelegate != null)
            {
                this._loadingEventDelegate.dispatchEvent(new Event(Event.COMPLETE));
                this._loadingEventDelegate = null;
            }
        }

        private function updateLoadingProgress(k:LibraryLoaderEvent=null):void
        {
            var _local_2:LibraryLoader;
            if (this._loadingEventDelegate != null)
            {
                _local_2 = (k.target as LibraryLoader);
                this._loadingEventDelegate.dispatchEvent(new LibraryProgressEvent(_local_2.url, k.bytesLoaded, k.bytesTotal, _local_2.elapsedTime));
            }
        }

        private function updateLoadingProcess(k:LibraryLoaderEvent=null):void
        {
            var _local_2:LibraryLoader;
            var _local_3:String;
            if (k != null)
            {
                if (((k.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE) || (k.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)))
                {
                    _local_2 = (k.target as LibraryLoader);
                    _local_2.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.updateLoadingProcess);
                    _local_2.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.errorInLoadingProcess);
                    _local_2.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS, this.updateLoadingProgress);
                    _local_3 = _local_2.url;
                    debug(((('Loading library "' + _local_3) + '" ') + ((k.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE) ? ("ready") : ("failed\n" + _local_2.getLastErrorMessage()))));
                    _local_2.dispose();
                    if (!disposed)
                    {
                        if (this._loadingEventDelegate != null)
                        {
                            this._loadingEventDelegate.dispatchEvent(new LibraryProgressEvent(_local_2.url, (this._numberOfFilesInConfig - this._libraryLoaderQueue.length), this._numberOfFilesInConfig, _local_2.elapsedTime));
                        }
                    }
                }
            }
            if (!disposed)
            {
                if (this._libraryLoaderQueue.length == 0)
                {
                    this.finalizeLoadingEventDelegate();
                    debug("All libraries loaded, Core is now running");
                }
            }
        }

        override public function registerUpdateReceiver(k:IUpdateReceiver, _arg_2:uint):void
        {
            this.removeUpdateReceiver(k);
            _arg_2 = ((_arg_2 >= CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS) ? (CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS - 1) : _arg_2);
            var _local_3:int = ((this._profiler) ? Core.CORE_SETUP_FRAME_UPDATE_PROFILER : (this._flags & Core.CORE_SETUP_FRAME_UPDATE_MASK));
            if (_local_3 == Core.CORE_SETUP_FRAME_UPDATE_EXPERIMENT)
            {
                this._updateReceiversByPriority[_arg_2].push(new UpdateDelegate(k, this, _arg_2));
            }
            else
            {
                this._updateReceiversByPriority[_arg_2].push(k);
            }
        }

        override public function removeUpdateReceiver(k:IUpdateReceiver):void
        {
            var _local_2:int;
            var _local_3:Array;
            var _local_6:UpdateDelegate;
            if (disposed)
            {
                return;
            }
            var _local_4:int = ((this._profiler) ? Core.CORE_SETUP_FRAME_UPDATE_PROFILER : (this._flags & Core.CORE_SETUP_FRAME_UPDATE_MASK));
            var _local_5:uint;
            while (_local_5 < CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS)
            {
                _local_3 = (this._updateReceiversByPriority[_local_5] as Array);
                if (_local_4 == Core.CORE_SETUP_FRAME_UPDATE_EXPERIMENT)
                {
                    for each (_local_6 in _local_3)
                    {
                        if (_local_6.receiver == k)
                        {
                            _local_6.dispose();
                            return;
                        }
                    }
                }
                else
                {
                    _local_2 = _local_3.indexOf(k);
                    if (_local_2 > -1)
                    {
                        _local_3[_local_2] = null;
                        return;
                    }
                }
                _local_5++;
            }
        }

        public function hibernate(hibernationLevel:int, duration:int=1):void
        {
            if (!this.hibernating)
            {
                PurgeTrigger.stop();
                this._hibernationLevel = hibernationLevel;
                this._hibernationUpdateFrequency = (1000 / duration);
            }
        }

        public function resume():void
        {
            if (this.hibernating)
            {
                PurgeTrigger.start();
                this._hibernationLevel = -1;
            }
        }

        private function get hibernating():Boolean
        {
            return this._hibernationLevel > -1;
        }

        private function get maxPriority():uint
        {
            return (this.hibernating) ? (this._hibernationLevel + 1) : CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS;
        }

        private function onEnterFrame(k:Event):void
        {
            var _local_2:uint = getTimer();
            var _local_3:uint = (_local_2 - this._lastUpdateTimeMs);
            if (((!(this.hibernating)) || (_local_3 > this._hibernationUpdateFrequency)))
            {
                this._frameUpdateMethod(_local_2, _local_3);
                this._lastUpdateTimeMs = _local_2;
            }
        }

        private function simpleFrameUpdateHandler(msCurrentTime:uint, msSinceLastUpdate:uint):void
        {
            var priority:uint;
            var receivers:Array;
            var receiver:IUpdateReceiver;
            var length:uint;
            var index:uint;
            priority = 0;
            while (priority < this.maxPriority)
            {
                this._framesSkippedByPriority[priority] = 0;
                receivers = this._updateReceiversByPriority[priority];
                index = 0;
                length = receivers.length;
                while (index != length)
                {
                    receiver = IUpdateReceiver(receivers[index]);
                    if (((receiver == null) || (receiver.disposed)))
                    {
                        receivers.splice(index, 1);
                        length--;
                    }
                    else
                    {
                        try
                        {
                            receiver.update(msSinceLastUpdate);
                        }
                        catch(e:Error)
                        {
                            Logger.log(e.getStackTrace());
                            error(((('Error in update receiver "' + getQualifiedClassName(receiver)) + '": ') + e.message + " | " + e.getStackTrace()), true, e.errorID, e);
                            return;
                        }
                        index++;
                    }
                }
                priority++;
            }
        }

        private function complexFrameUpdateHandler(msCurrentTime:uint, msSinceLastUpdate:uint):void
        {
            var priority:uint;
            var receivers:Array;
            var receiver:IUpdateReceiver;
            var length:uint;
            var index:uint;
            var skip:Boolean;
            var t:uint;
            var proceed:Boolean = true;
            var maxTimePerFrame:uint = (1000 / _displayObjectContainer.stage.frameRate);
            priority = 0;
            while (priority < this.maxPriority)
            {
                t = getTimer();
                skip = false;
                if ((t - msCurrentTime) > maxTimePerFrame)
                {
                    if (this._framesSkippedByPriority[priority] < priority)
                    {
                        this._framesSkippedByPriority[priority]++;
                        skip = true;
                    }
                }
                if (!skip)
                {
                    this._framesSkippedByPriority[priority] = 0;
                    receivers = this._updateReceiversByPriority[priority];
                    index = 0;
                    length = receivers.length;
                    while (((!(index == length)) && (proceed)))
                    {
                        receiver = IUpdateReceiver(receivers[index]);
                        if (((receiver == null) || (receiver.disposed)))
                        {
                            receivers.splice(index, 1);
                            length--;
                        }
                        else
                        {
                            try
                            {
                                receiver.update(msSinceLastUpdate);
                            }
                            catch(e:Error)
                            {
                                Logger.log(e.getStackTrace());
                                error(((('Error in update receiver "' + getQualifiedClassName(receiver)) + '": ') + e.message  + " | " + e.getStackTrace()), true, e.errorID, e);
                                proceed = false;
                            }
                            index++;
                        }
                    }
                }
                priority++;
            }
        }

        private function profilerFrameUpdateHandler(msCurrentTime:uint, msSinceLastUpdate:uint):void
        {
            var priority:uint;
            var receivers:Array;
            var receiver:IUpdateReceiver;
            var length:uint;
            var index:uint;
            this._profiler.start();
            priority = 0;
            while (priority < this.maxPriority)
            {
                this._framesSkippedByPriority[priority] = 0;
                receivers = this._updateReceiversByPriority[priority];
                index = 0;
                length = receivers.length;
                while (index != length)
                {
                    receiver = IUpdateReceiver(receivers[index]);
                    if (((receiver == null) || (receiver.disposed)))
                    {
                        receivers.splice(index, 1);
                        length--;
                    }
                    else
                    {
                        try
                        {
                            this._profiler.update(receiver, msSinceLastUpdate);
                        }
                        catch(e:Error)
                        {
                            error(((('Error in update receiver "' + getQualifiedClassName(receiver)) + '": ') + e.message + " | " + e.getStackTrace()), true, e.errorID, e);
                            return;
                        }
                        index++;
                    }
                }
                priority++;
            }
            this._profiler.stop();
        }

        private function experimentalFrameUpdateHandler(k:uint, _arg_2:uint):void
        {
            var _local_4:Array;
            var _local_5:int;
            var _local_3:int;
            while (_local_3 < CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS)
            {
                _local_4 = this._updateReceiversByPriority[_local_3];
                _local_5 = (_local_4.length - 1);
                while (_local_5 > -1)
                {
                    if (_local_4[_local_5].disposed)
                    {
                        _local_4.splice(_local_5, 1);
                    }
                    _local_5--;
                }
                _local_3++;
            }
        }

        private function debugFrameUpdateHandler(k:uint, _arg_2:uint):void
        {
            var _local_3:uint;
            var _local_4:Array;
            var _local_5:IUpdateReceiver;
            var _local_6:uint;
            var _local_7:uint;
            _local_3 = 0;
            while (_local_3 < this.maxPriority)
            {
                this._framesSkippedByPriority[_local_3] = 0;
                _local_4 = this._updateReceiversByPriority[_local_3];
                _local_7 = 0;
                _local_6 = _local_4.length;
                while (_local_7 != _local_6)
                {
                    _local_5 = IUpdateReceiver(_local_4[_local_7]);
                    if (((_local_5 == null) || (_local_5.disposed)))
                    {
                        _local_4.splice(_local_7, 1);
                        _local_6--;
                    }
                    else
                    {
                        _local_5.update(_arg_2);
                        _local_7++;
                    }
                }
                _local_3++;
            }
        }

        public function setProfilerMode(k:Boolean):void
        {
            var _local_2:int;
            var _local_3:Array;
            var _local_4:Object;
            var _local_5:int;
            if (k)
            {
                this._frameUpdateMethod = this.profilerFrameUpdateHandler;
                if (((!(this._profiler)) || (this._profiler.disposed)))
                {
                    this._profiler = new Profiler(this);
                }
                attachComponent(this._profiler, [new IIDProfiler()]);
                _local_2 = 0;
                while (_local_2 < CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS)
                {
                    _local_3 = this._updateReceiversByPriority[_local_2];
                    _local_5 = (_local_3.length - 1);
                    while (_local_5 > -1)
                    {
                        _local_4 = _local_3[_local_5];
                        if ((_local_4 is UpdateDelegate))
                        {
                            _local_3[_local_5] = UpdateDelegate(_local_4).receiver;
                            UpdateDelegate(_local_4).dispose();
                        }
                        _local_5--;
                    }
                    _local_2++;
                }
            }
            else
            {
                detachComponent(this._profiler);
                switch ((this._flags & Core.CORE_SETUP_FRAME_UPDATE_MASK))
                {
                    case Core.CORE_SETUP_FRAME_UPDATE_SIMPLE:
                        this._frameUpdateMethod = this.simpleFrameUpdateHandler;
                        return;
                    case Core.CORE_SETUP_FRAME_UPDATE_COMPLEX:
                        this._frameUpdateMethod = this.complexFrameUpdateHandler;
                        return;
                    case Core.CORE_SETUP_FRAME_UPDATE_EXPERIMENT:
                        this._frameUpdateMethod = this.experimentalFrameUpdateHandler;
                        _local_2 = 0;
                        while (_local_2 < CoreComponentContext.NUM_UPDATE_RECEIVER_LEVELS)
                        {
                            _local_3 = this._updateReceiversByPriority[_local_2];
                            _local_5 = (_local_3.length - 1);
                            while (_local_5 > -1)
                            {
                                _local_4 = _local_3[_local_5];
                                if ((_local_4 is IUpdateReceiver))
                                {
                                    _local_3[_local_5] = new UpdateDelegate(IUpdateReceiver(_local_4), this, _local_2);
                                }
                                _local_5--;
                            }
                            _local_2++;
                        }
                        return;
                    default:
                        this._frameUpdateMethod = this.debugFrameUpdateHandler;
                }
            }
        }
    }
}
import com.sulake.core.runtime.IDisposable;
import com.sulake.core.runtime.IUpdateReceiver;
import com.sulake.core.runtime.IContext;
import flash.events.Event;
import flash.utils.getTimer;
import flash.utils.getQualifiedClassName;

class UpdateDelegate implements IDisposable 
{

    private var _receiver:IUpdateReceiver;
    private var _context:IContext;
    private var _priority:int;
    private var _lastUpdateTimeMs:uint;
    private var _framesSkipped:uint = 0;

    public function UpdateDelegate(receiver:IUpdateReceiver, context:IContext, priority:int)
    {
        if (((context) && (receiver)))
        {
            this._receiver = receiver;
            this._context = context;
            this._priority = priority;
            context.displayObjectContainer.stage.addEventListener(((this._priority == 0) ? Event.EXIT_FRAME : Event.ENTER_FRAME), this.onFrameUpdate);
            this._lastUpdateTimeMs = getTimer();
        }
    }

    public function get priority():int
    {
        return this._priority;
    }

    public function get receiver():IUpdateReceiver
    {
        return this._receiver;
    }

    public function get disposed():Boolean
    {
        return (this._receiver) ? this._receiver.disposed : true;
    }

    public function dispose():void
    {
        if (this._receiver)
        {
            this._receiver = null;
            this._context.displayObjectContainer.stage.removeEventListener(((this._priority == 0) ? Event.EXIT_FRAME : Event.ENTER_FRAME), this.onFrameUpdate);
            this._context = null;
        }
    }

    private function onFrameUpdate(_mbslot_1:Event):void
    {
        var _mbslot_2:uint;
        var _mbslot_3:uint;
        if (!this.disposed)
        {
            _mbslot_2 = getTimer();
            _mbslot_3 = (_mbslot_2 - this._lastUpdateTimeMs);
            this._lastUpdateTimeMs = _mbslot_2;
            if (((this._priority > 0) && (this._framesSkipped < this._priority)))
            {
                if (_mbslot_3 > (1000 / this._context.displayObjectContainer.stage.frameRate))
                {
                    this._framesSkipped++;
                    return;
                }
            }
            this._framesSkipped = 0;
            try
            {
                this._receiver.update(_mbslot_3);
            }
            catch(e:Error)
            {
                _context.error(((('Error in update receiver "' + getQualifiedClassName(_receiver)) + '": ') + e.message + " | " + e.getStackTrace()), true, e.errorID, e);
            }
        }
    }


}
