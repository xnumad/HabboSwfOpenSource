package com.sulake.core.window
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.utils.IEventQueue;
    import com.sulake.core.window.utils.IEventProcessor;
    import com.sulake.core.window.graphics.IWindowRenderer;
    import flash.display.Stage;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.window.utils.EventProcessorState;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.window.services.IInternalWindowServices;
    import com.sulake.core.window.utils.IWindowParser;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.core.window.components.SubstituteParentController;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.window.services.ServiceManager;
    import com.sulake.core.window.utils.WindowParser;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.DesktopController;
    import flash.events.Event;
    import com.sulake.core.window.utils.MouseEventQueue;
    import com.sulake.core.window.utils.MouseEventProcessor;
    import com.sulake.core.window.utils.tablet.TabletEventQueue;
    import com.sulake.core.window.utils.tablet.TabletEventProcessor;
    import com.sulake.core.window.graphics.IGraphicContextHost;
    import flash.display.DisplayObject;
    import com.sulake.core.localization.ILocalizable;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.enum.WindowState;
    import __AS3__.vec.*;

    public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver 
    {
        public static const INPUT_MODE_MOUSE:uint = 0;
        public static const INPUT_MODE_TOUCH:uint = 1;
        public static const ERROR_UNKNOWN:int = 0;
        public static const ERROR_INVALID_WINDOW:int = 1;
        public static const ERROR_WINDOW_NOT_FOUND:int = 2;
        public static const ERROR_WINDOW_ALREADY_EXISTS:int = 3;
        public static const ERROR_UNKNOWN_WINDOW_TYPE:int = 4;
        public static const ERROR_DURING_EVENT_HANDLING:int = 5;
        public static var inputEventQueue:IEventQueue;
        private static var inputEventProcessor:IEventProcessor;
        private static var inputModeFlag:uint = INPUT_MODE_MOUSE;//0
        private static var _renderer:IWindowRenderer;
        private static var stage:Stage;

        public var inputEventTrackers:Vector.<IInputEventTracker>;
        private var _linkEventTrackers:Vector.<ILinkEventTracker>;
        private var _eventProcessorState:EventProcessorState;
        protected var _localization:ICoreLocalizationManager;
        protected var _rootDisplayObject:DisplayObjectContainer;
        protected var _throwErrors:Boolean = true;
        protected var _lastError:Error;
        protected var _lastErrorCode:int = -1;
        protected var _windowServices:IInternalWindowServices;
        protected var _windowParser:IWindowParser;
        protected var _windowFactory:IWindowFactory;
        protected var _widgetFactory:IWidgetFactory;
        protected var _resourceManager:IResourceManager;
        protected var _desktopWindow:IDesktopWindow;
        protected var _substituteParent:SubstituteParentController;
        private var _disposed:Boolean = false;
        private var _updating:Boolean = false;
        private var _rendering:Boolean = false;
        private var _name:String;
        private var _configurationManager:IHabboConfigurationManager;

        public function WindowContext(k:String, _arg_2:IWindowRenderer, _arg_3:IWindowFactory, _arg_4:IWidgetFactory, _arg_5:IResourceManager, _arg_6:ICoreLocalizationManager, _arg_7:IHabboConfigurationManager, _arg_8:DisplayObjectContainer, _arg_9:Rectangle, _arg_10:Vector.<ILinkEventTracker>)
        {
            this._name = k;
            _renderer = _arg_2;
            this._localization = _arg_6;
            this._configurationManager = _arg_7;
            this._rootDisplayObject = _arg_8;
            this._windowServices = new ServiceManager(this, _arg_8);
            this._windowFactory = _arg_3;
            this._widgetFactory = _arg_4;
            this._resourceManager = _arg_5;
            this._windowParser = new WindowParser(this);
            this.inputEventTrackers = new Vector.<IInputEventTracker>(0);
            this._linkEventTrackers = _arg_10;
            if (!stage)
            {
                if ((this._rootDisplayObject is Stage))
                {
                    stage = (this._rootDisplayObject as Stage);
                }
                else
                {
                    if (this._rootDisplayObject.stage)
                    {
                        stage = this._rootDisplayObject.stage;
                    }
                }
            }
            Classes.init();
            if (_arg_9 == null)
            {
                _arg_9 = new Rectangle(0, 0, 800, 600);
            }
            this._desktopWindow = new DesktopController(("_CONTEXT_DESKTOP_" + this._name), this, _arg_9);
            this._desktopWindow.limits.maxWidth = _arg_9.width;
            this._desktopWindow.limits.maxHeight = _arg_9.height;
            this._rootDisplayObject.addChild(this._desktopWindow.getDisplayObject());
            this._rootDisplayObject.doubleClickEnabled = true;
            this._rootDisplayObject.addEventListener(Event.RESIZE, this.stageResizedHandler);
            this._eventProcessorState = new EventProcessorState(_renderer, this._desktopWindow, this._desktopWindow, null, this.inputEventTrackers);
            inputMode = INPUT_MODE_MOUSE;
            this._substituteParent = new SubstituteParentController(this);
        }

        public static function get inputMode():uint
        {
            return inputModeFlag;
        }

        public static function set inputMode(k:uint):void
        {
            if (inputEventQueue)
            {
                if ((inputEventQueue is IDisposable))
                {
                    IDisposable(inputEventQueue).dispose();
                }
            }
            if (inputEventProcessor)
            {
                if ((inputEventProcessor is IDisposable))
                {
                    IDisposable(inputEventProcessor).dispose();
                }
            }
            switch (k)
            {
                case INPUT_MODE_MOUSE:
                    inputEventQueue = new MouseEventQueue(stage);
                    inputEventProcessor = new MouseEventProcessor();
                    try
                    {
                    }
                    catch(e:Error)
                    {
                    }
                    return;
                case INPUT_MODE_TOUCH:
                    inputEventQueue = new TabletEventQueue(stage);
                    inputEventProcessor = new TabletEventProcessor();
                    try
                    {
                    }
                    catch(e:Error)
                    {
                    }
                    return;
                default:
                    inputMode = INPUT_MODE_MOUSE;
                    throw (new Error(("Unknown input mode " + k)));
            }
        }


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                this._rootDisplayObject.removeEventListener(Event.RESIZE, this.stageResizedHandler);
                this._rootDisplayObject.removeChild((IGraphicContextHost(this._desktopWindow).getGraphicContext(true) as DisplayObject));
                this._desktopWindow.destroy();
                this._desktopWindow = null;
                this._substituteParent.destroy();
                this._substituteParent = null;
                if ((this._windowServices is IDisposable))
                {
                    IDisposable(this._windowServices).dispose();
                }
                this._windowServices = null;
                this._windowParser.dispose();
                this._windowParser = null;
                _renderer = null;
                this._localization = null;
                this._rootDisplayObject = null;
                this._windowFactory = null;
                this._widgetFactory = null;
                this._resourceManager = null;
            }
        }

        public function getLastError():Error
        {
            return this._lastError;
        }

        public function getLastErrorCode():int
        {
            return this._lastErrorCode;
        }

        public function handleError(k:int, _arg_2:Error):void
        {
            this._lastError = _arg_2;
            this._lastErrorCode = k;
            if (this._throwErrors)
            {
                throw (_arg_2);
            }
        }

        public function flushError():void
        {
            this._lastError = null;
            this._lastErrorCode = -1;
        }

        public function getWindowServices():IInternalWindowServices
        {
            return this._windowServices;
        }

        public function getWindowParser():IWindowParser
        {
            return this._windowParser;
        }

        public function getWindowFactory():IWindowFactory
        {
            return this._windowFactory;
        }

        public function getDesktopWindow():IDesktopWindow
        {
            return this._desktopWindow;
        }

        public function findWindowByName(k:String):IWindow
        {
            return this._desktopWindow.findChildByName(k);
        }

        public function findWindowByTag(k:String):IWindow
        {
            return this._desktopWindow.findChildByTag(k);
        }

        public function groupChildrenWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._desktopWindow.groupChildrenWithTag(k, _arg_2, _arg_3);
        }

        public function registerLocalizationListener(k:String, _arg_2:IWindow):void
        {
            this._localization.registerListener(k, (_arg_2 as ILocalizable));
        }

        public function removeLocalizationListener(k:String, _arg_2:IWindow):void
        {
            this._localization.removeListener(k, (_arg_2 as ILocalizable));
        }

        public function create(k:String, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:Rectangle, _arg_7:Function, _arg_8:IWindow, _arg_9:uint, _arg_10:Array=null, _arg_11:String="", _arg_12:Array=null):IWindow
        {
            var _local_13:IWindow;
            var _local_14:Class = Classes.getWindowClassByType(_arg_3);
            if (_local_14 == null)
            {
                this.handleError(WindowContext.ERROR_UNKNOWN_WINDOW_TYPE, new Error((('Failed to solve implementation for window "' + k) + '"!')));
                return null;
            }
            if (_arg_8 == null)
            {
                if ((_arg_5 & WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))
                {
                    _arg_8 = this._substituteParent;
                }
            }
            _local_13 = new _local_14(k, _arg_3, _arg_4, _arg_5, this, _arg_6, ((_arg_8 != null) ? _arg_8 : (this._desktopWindow)), _arg_7, _arg_10, _arg_12, _arg_9);
            _local_13.dynamicStyle = _arg_11;
            if (((_arg_2) && (_arg_2.length)))
            {
                _local_13.caption = _arg_2;
            }
            return _local_13;
        }

        public function destroy(k:IWindow):Boolean
        {
            if (k == this._desktopWindow)
            {
                this._desktopWindow = null;
            }
            if (k.state != WindowState.DISPOSED)
            {
                k.destroy();
            }
            return true;
        }

        public function invalidate(k:IWindow, _arg_2:Rectangle, _arg_3:uint):void
        {
            if (!this.disposed)
            {
                _renderer._Str_18389(k, _arg_2, _arg_3);
            }
        }

        public function update(k:uint):void
        {
			try
			{
            var _local_2:Error;
            this._updating = true;
            if (this._lastError)
            {
                _local_2 = this._lastError;
                this._lastError = null;
                throw (_local_2);
            }
            inputEventProcessor.process(this._eventProcessorState, inputEventQueue);
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("Error Updating WindowContext " + this._name + ": " + error.message + " | " + error.getStackTrace());
			}
            this._updating = false;
        }

        public function render(k:uint):void
        {
			try
			{
				this._rendering = true;
				_renderer.render();
				this._rendering = false;
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("Error Updating WindowContext " + this._name + ": " + error.message + " | " + error.getStackTrace());
			}
			this._rendering = false;
        }

        private function stageResizedHandler(k:Event):void
        {
            var _local_2:int;
            var _local_3:int;
            if (((!(this._desktopWindow == null)) && (!(this._desktopWindow.disposed))))
            {
                if ((this._rootDisplayObject is Stage))
                {
                    _local_2 = Stage(this._rootDisplayObject).stageWidth;
                    _local_3 = Stage(this._rootDisplayObject).stageHeight;
                }
                else
                {
                    _local_2 = this._rootDisplayObject.width;
                    _local_3 = this._rootDisplayObject.height;
                }
                if (((_local_2 >= 10) && (_local_3 >= 10)))
                {
                    this._desktopWindow.limits.maxWidth = _local_2;
                    this._desktopWindow.limits.maxHeight = _local_3;
                    this._desktopWindow.width = _local_2;
                    this._desktopWindow.height = _local_3;
                }
            }
        }

        public function addMouseEventTracker(k:IInputEventTracker):void
        {
            if (this.inputEventTrackers.indexOf(k) < 0)
            {
                this.inputEventTrackers.push(k);
            }
        }

        public function removeMouseEventTracker(k:IInputEventTracker):void
        {
            var _local_2:int = this.inputEventTrackers.indexOf(k);
            if (_local_2 > -1)
            {
                this.inputEventTrackers.splice(_local_2, 1);
            }
        }

        public function getResourceManager():IResourceManager
        {
            return this._resourceManager;
        }

        public function getWidgetFactory():IWidgetFactory
        {
            return this._widgetFactory;
        }

        public function get linkEventTrackers():Vector.<ILinkEventTracker>
        {
            return this._linkEventTrackers;
        }
    }
}
