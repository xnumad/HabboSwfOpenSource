//com.sulake.habbo.communication.HabboWebLogin

package com.sulake.habbo.communication{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.net.URLRequestHeader;
    import flash.net.URLLoader;
    import flash.events.IEventDispatcher;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.SecurityErrorEvent;

    public class HabboWebLogin extends EventDispatcherWrapper implements IHabboWebLogin {

        private static const userAgentHeader:URLRequestHeader;

        private var _loader:URLLoader;
        private var _name:String;
        private var _password:String;
        private var _loginURL:String;
        private var _securityCheckURL:String;
        private var _reauthenticateURL:String;

        public function HabboWebLogin(k:String, _arg_2:String, _arg_3:String, _arg_4:IEventDispatcher=null);

        public function init():void;

        private function requestCredentials():void;

        private function credentialsComplete(k:Event=null):void;

        private function requestSecurityCheck():void;

        private function securityCheckComplete(k:Event=null):void;

        public function requestReAuthenticate():void;

        private function reauthenticateComplete(k:Event=null):void;

        private function configureListeners(k:IEventDispatcher):void;

        private function removeListeners(k:IEventDispatcher):void;

        private function ioErrorHandler(k:IOErrorEvent):void;

        private function httpStatusHandler(k:HTTPStatusEvent):void;

        private function securityErrorHandler(k:SecurityErrorEvent):void;


    }
}//package com.sulake.habbo.communication

