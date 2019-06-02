//com.sulake.core.assets.loaders.AssetLoaderEventBroker

package com.sulake.core.assets.loaders{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import flash.events.Event;

    class AssetLoaderEventBroker extends EventDispatcherWrapper implements IDisposable {

        public static const NONE:uint;
        public static const IO_ERROR:uint;
        public static const SECURITY_ERROR:uint;

        protected var _status:int;
        protected var _retries:int;
        protected var _attempts:int;
        protected var _errorCode:uint;

        public function AssetLoaderEventBroker();

        public function get errorCode():uint;

        protected function loadEventHandler(k:Event):void;

        protected function retry():Boolean;


    }
}//package com.sulake.core.assets.loaders

