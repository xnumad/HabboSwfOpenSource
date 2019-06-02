//com.sulake.core.runtime.CoreComponentContext

package com.sulake.core.runtime{
    import com.sulake.core.utils.IFileProxy;
    import com.sulake.core.utils.LibraryLoaderQueue;
    import flash.events.IEventDispatcher;
    import starling.core.Starling;
    import away3d.core.managers.Stage3DProxy;
    import away3d.containers.View3D;
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;
    import com.sulake.core.utils.LibraryLoaderEvent;

    public final class CoreComponentContext extends ComponentContext implements ICore {

        private static var _fileProxy:IFileProxy;
        private static const NUM_UPDATE_RECEIVER_LEVELS:uint;
        private static const CONFIG_XML_NODE_ASSET_LIBRARIES:String;
        private static const CONFIG_XML_NODE_ASSET_LIBRARY:String;
        private static const CONFIG_XML_NODE_SERVICE_LIBRARIES:String;
        private static const CONFIG_XML_NODE_SERVICE_LIBRARY:String;
        private static const CONFIG_XML_NODE_COMPONENT_LIBRARIES:String;
        private static const CONFIG_XML_NODE_COMPONENT_LIBRARY:String;

        private var _libraryLoaderQueue:LibraryLoaderQueue;
        private var _loadingEventDelegate:IEventDispatcher;
        private var _numberOfFilesInConfig:uint;
        private var _frameUpdateMethod:Function;
        private var _profiler:Profiler;
        private var _errorReporter:ICoreErrorReporter;
        private var _updateReceiversByPriority:Array;
        private var _framesSkippedByPriority:Array;
        private var _lastUpdateTimeMs:uint;
        private var _flags:uint;
        private var _hibernationLevel:int;
        private var _hibernationUpdateFrequency:uint;
        private var _starling:Starling;
        private var _stage3DProxy:Stage3DProxy;
        private var _view3D:View3D;
        private var _skipContext3DPresent:Boolean;
        private var _rebootOnNextFrame:Boolean;

        public function CoreComponentContext(k:DisplayObjectContainer, _arg_2:ICoreErrorReporter, _arg_3:uint);

        public function set fileProxy(k:IFileProxy):void;

        public function get fileProxy():IFileProxy;

        public function getNumberOfFilesPending():uint;

        public function getNumberOfFilesLoaded():uint;

        public function setupStarling(k:Stage3DProxy, _arg_2:Starling, _arg_3:View3D):void;

        public function initialize():void;

        private function unlockEventHandler(k:Event):void;

        private function doInitialize():void;

        public function hasLockedComponents():Boolean;

        override public function dispose():void;

        public function getView3D():View3D;

        public function getStarling():Starling;

        override public function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;

        public function readConfigDocument(k:XML, _arg_2:IEventDispatcher=null):void;

        private function errorInLoadingProcess(k:LibraryLoaderEvent=null):void;

        private function finalizeLoadingEventDelegate():void;

        private function updateLoadingProgress(k:LibraryLoaderEvent=null):void;

        private function updateLoadingProcess(k:LibraryLoaderEvent=null):void;

        override public function registerUpdateReceiver(k:IUpdateReceiver, _arg_2:uint):void;

        override public function removeUpdateReceiver(k:IUpdateReceiver):void;

        public function hibernate(k:int, _arg_2:int=1):void;

        public function resume():void;

        private function get hibernating():Boolean;

        private function get maxPriority():uint;

        private function onEnterFrame(k:Event):void;

        public function skipContext3DPresent():void;

        private function simpleFrameUpdateHandler(k:uint, _arg_2:uint):void;

        private function complexFrameUpdateHandler(k:uint, _arg_2:uint):void;

        private function profilerFrameUpdateHandler(k:uint, _arg_2:uint):void;

        private function experimentalFrameUpdateHandler(k:uint, _arg_2:uint):void;

        private function debugFrameUpdateHandler(k:uint, _arg_2:uint):void;

        public function setProfilerMode(k:Boolean):void;

        public function reboot():void;


    }
}//package com.sulake.core.runtime

import com.sulake.core.runtime.IDisposable;
import com.sulake.core.runtime.IUpdateReceiver;
import com.sulake.core.runtime.IContext;
import flash.events.Event;

class UpdateDelegate implements IDisposable {

    /*private*/ var _receiver:IUpdateReceiver;
    /*private*/ var _context:IContext;
    /*private*/ var _priority:int;
    /*private*/ var _lastUpdateTimeMs:uint;
    /*private*/ var _framesSkipped:uint;

    public function UpdateDelegate(k:IUpdateReceiver, _arg_2:IContext, _arg_3:int);

    public function get priority():int;

    public function get receiver():IUpdateReceiver;

    public function get disposed():Boolean;

    public function dispose():void;

    /*private*/ function onFrameUpdate(k:Event):void;


}

