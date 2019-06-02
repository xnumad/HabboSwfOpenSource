//com.sulake.core.runtime.Component

package com.sulake.core.runtime{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import __AS3__.vec.Vector;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;

    public class Component implements IUnknown, ICoreConfiguration {

        public static const COMPONENT_EVENT_RUNNING:String;
        public static const COMPONENT_EVENT_DISPOSING:String;
        public static const COMPONENT_EVENT_WARNING:String;
        public static const COMPONENT_EVENT_ERROR:String;
        public static const COMPONENT_EVENT_DEBUG:String;
        public static const COMPONENT_EVENT_UNLOCKED:String;
        public static const COMPONENT_EVENT_REBOOT:String;
        protected static const INTERNAL_EVENT_UNLOCKED:String;
        public static const COMPONENT_FLAG_NULL:uint;
        public static const COMPONENT_FLAG_INTERFACE:uint;
        public static const COMPONENT_FLAG_CONTEXT:uint;
        public static const COMPONENT_FLAG_DISPOSABLE:uint;

        protected var _references:uint;
        protected var _lastError:String;
        protected var _lastDebug:String;
        protected var _lastWarning:String;
        private var _assets:IAssetLibrary;
        private var _events:EventDispatcherWrapper;
        private var _flags:uint;
        private var _iids:InterfaceStructList;
        private var _context:IContext;
        private var _disposed:Boolean;
        private var _locked:Boolean;
        private var _requiredDependencyCount:int;
        private var _requiredDependencyIids:Vector.<String>;
        private var _dependencyDisposalActions:Vector.<Function>;

        public function Component(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        public static function getInterfaceStructList(k:Component):InterfaceStructList;


        public function get locked():Boolean;

        public function get disposed():Boolean;

        public function get context():IContext;

        public function get events():IEventDispatcher;

        public function get assets():IAssetLibrary;

        private function injectDependency(identifier:IID, dependencySetter:Function, isRequired:Boolean, eventListeners:Array):void{
        }
        private function allDependenciesRequested(k:String=""):void;

        protected function get allRequiredDependenciesInjected():Boolean;

        protected function get dependencies():Vector.<ComponentDependency>;

        protected function initComponent():void;

        public function queueInterface(k:IID, _arg_2:Function=null):IUnknown;

        public function release(k:IID):uint;

        public function dispose():void;

        public function purge():void;

        final protected function lock():void;

        final protected function unlock():void;

        public function toString():String;

        public function toXMLString(k:uint=0):String;

        public function registerUpdateReceiver(k:IUpdateReceiver, _arg_2:uint):void;

        public function removeUpdateReceiver(k:IUpdateReceiver):void;

        public function get flags():uint;

        public function propertyExists(k:String):Boolean;

        public function getProperty(k:String, _arg_2:Dictionary=null):String;

        public function setProperty(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void;

        public function getBoolean(k:String):Boolean;

        public function getInteger(k:String, _arg_2:int):int;

        public function interpolate(k:String):String;

        public function updateUrlProtocol(k:String):String;


    }
}//package com.sulake.core.runtime

