//com.sulake.core.runtime.ComponentContext

package com.sulake.core.runtime{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.LibraryLoader;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import flash.system.ApplicationDomain;
    import com.sulake.core.runtime.events.LockEvent;

    public class ComponentContext extends Component implements IContext {

        protected var _components:Vector.<Component>;
        protected var _queuees:Vector.<ComponentInterfaceQueue>;
        protected var _loaders:Vector.<LibraryLoader>;
        protected var _debug:Boolean;
        protected var _displayObjectContainer:DisplayObjectContainer;
        private var _configuration:ICoreConfiguration;

        public function ComponentContext(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public function get root():IContext;

        public function get displayObjectContainer():DisplayObjectContainer;

        override public function purge():void;

        public function debug(k:String):void;

        public function getLastDebugMessage():String;

        public function warning(k:String):void;

        public function getLastWarningMessage():String;

        public function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;

        public function getLastErrorMessage():String;

        final public function loadFromFile(k:URLRequest, _arg_2:LoaderContext):LibraryLoader;

        final protected function loadReadyHandler(k:LibraryLoaderEvent):void;

        protected function loadErrorHandler(k:LibraryLoaderEvent):void;

        protected function loadDebugHandler(k:LibraryLoaderEvent):void;

        protected function removeLibraryLoader(k:LibraryLoader):void;

        public function prepareAssetLibrary(k:XML, _arg_2:Class):Boolean;

        final public function prepareComponent(k:Class, _arg_2:uint=0, _arg_3:ApplicationDomain=null):IUnknown;

        final public function attachComponent(k:Component, _arg_2:Array):void;

        final public function detachComponent(k:Component):void;

        override public function queueInterface(k:IID, _arg_2:Function=null):IUnknown;

        final protected function addQueueeForInterface(k:IID, _arg_2:Function):void;

        final protected function hasQueueForInterface(k:IID):Boolean;

        final protected function getQueueForInterface(k:IID):ComponentInterfaceQueue;

        final protected function announceInterfaceAvailability(k:IID, _arg_2:Component):void;

        override public function dispose():void;

        private function unlockEventHandler(k:LockEvent):void;

        override public function toXMLString(k:uint=0):String;

        public function set configuration(k:ICoreConfiguration):void;

        public function get configuration():ICoreConfiguration;


    }
}//package com.sulake.core.runtime

