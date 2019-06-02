//com.sulake.habbo.communication.demo.HabboCommunicationDemo

package com.sulake.habbo.communication.demo{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IPocketHabboListener;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.configuration.IHabboConfigurationManager;
    import com.sulake.habbo.ui.IHabboUI;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.demo.view.ILoginView;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.core.runtime.events.ErrorEvent;
    import flash.events.Event;
    import com.sulake.core.communication.connection.IConnection;
    import flash.utils.Dictionary;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.UIEvent;

    [SecureSWF(rename="true")]
    public class HabboCommunicationDemo extends Component implements IPocketHabboListener {

        public static const FLAG_ROOM_VIEWER_MODE:uint;
        private static const POCKET_MODE_REGISTRATION:int;
        private static const POCKET_MODE_LOGIN:int;

        private var _pocketSessionMode:int;
        private var _localization:IHabboLocalizationManager;
        private var _communication:IHabboCommunicationManager;
        private var _configurations:IHabboConfigurationManager;
        private var _habboUI:IHabboUI;
        private var _windowManager:IHabboWindowManager;
        private var _incomingMessages:IncomingMessages;
        private var _ssoTicket:String;
        private var _roomViewerMode:Boolean;
        private var _loginView:ILoginView;
        private var _ssoTicketParser:SSOTicket;
        private var _loginName:String;
        private var _password:String;
        private var _autoLogin:Boolean;

        public function HabboCommunicationDemo(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        private static function setReasonProperty(k:String, _arg_2:String):String;

        private static function clearPopups():void;


        override public function dispose():void;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        public function setHabboUI(k:IHabboUI):void;

        public function get communication():IHabboCommunicationManager;

        public function get windowManager():IHabboWindowManager;

        public function get localization():IHabboLocalizationManager;

        public function get configurations():IHabboConfigurationManager;

        public function get loginName():String;

        public function get password():String;

        public function set loginName(k:String):void;

        public function set password(k:String):void;

        override protected function initComponent():void;

        private function onCoreError(k:ErrorEvent):void;

        private function onHotelViewError(k:Event):void;

        private function initWithCredentials():void;

        private function initWithParseSSO():void;

        private function initWithSSO(k:String):void;

        private function initWithDesktopLogin():void;

        private function initWithTabletLogin():void;

        public function startSSOTicketParsing(k:String, _arg_2:String, _arg_3:Boolean):void;

        private function onParsedTicketSuccess(k:Event):void;

        private function onParsedTicketFailure(k:Event):void;

        public function sendTryLogin(k:String, _arg_2:String, _arg_3:int=0):void;

        [SecureSWF(controlFlow="0", codeWrap="off")]
        public function sendConnectionParameters(k:IConnection):void;

        public function dispatchLoginStepEvent(k:String):void;

        public function populateUserList(k:Dictionary):void;

        private function onAutoSendLogin(k:TimerEvent):void;

        public function loginOk():void;

        private function initPocketHabboSession():void;

        public function pocketHabboError(k:String, _arg_2:Object):void;

        public function pocketHabboRawResponse(k:String, _arg_2:Object):void;

        public function pocketHabboResponse(k:String, _arg_2:Object):void;

        private function onConfigurationComplete(k:Event):void;

        private function onLocalizationComplete(k:Event):void;

        private function onLocalizationFailed(e:Event):void{
        }
        public function alert(titleKey:String, messageKey:String):void{
        }
        public function handleErrorMessage(errorCode:int, messageId:int):void{
        }
        private function setOriginProperty(k:String):String;

        public function initConnection():void;

        public function disconnected(k:int, _arg_2:String):void;

        private function disconnectDesktopMode(k:int, _arg_2:String):void;

        private function disconnectRoomViewerMode(k:int, _arg_2:String):void;

        private function habboUIEventHandler(k:UIEvent):void;


    }
}//package com.sulake.habbo.communication.demo

