//com.sulake.habbo.communication.demo.SSOTicket

package com.sulake.habbo.communication.demo{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.net.URLLoader;
    import com.sulake.habbo.communication.IHabboWebLogin;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.Event;

    public class SSOTicket extends EventDispatcherWrapper {

        public static const SUCCESS:String;
        public static const FAILURE:String;

        private var _loader:URLLoader;
        private var _clientURL:String;
        private var _habboWebLogin:IHabboWebLogin;
        private var _sessionId:String;
        private var _ticket:String;
        private var _flashClientUrl:String;
        private var _assets:IAssetLibrary;
        private var _isFacebookUser:Boolean;

        public function SSOTicket(k:IAssetLibrary, _arg_2:IHabboWebLogin, _arg_3:String, _arg_4:Boolean=true);

        public function get ticket():String;

        public function get isFacebookUser():Boolean;

        public function get flashClientUrl():String;

        private function requestClientURL(k:Event=null):void;

        private function clientURLComplete(k:Event=null):void;


    }
}//package com.sulake.habbo.communication.demo

