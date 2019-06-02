//com.sulake.habbo.communication.demo.IncomingMessages

package com.sulake.habbo.communication.demo{
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.communication.handshake.IKeyExchange;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.incoming.handshake.UniqueMachineIDEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.IdentityAccountsEvent;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.availability.MaintenanceStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.DisconnectReasonEvent;

    public class IncomingMessages {

        private var _component:HabboCommunicationDemo;
        private var _communication:IHabboCommunicationManager;
        private var _keyExchange:IKeyExchange;
        private var _cryptoBannerLoader:CryptoBannerLoader;
        private var _privateKey:String;
        private var _token:String;
        private var _handshakeInProgress:Boolean;
        private var _logoutInProgress:Boolean;

        public function IncomingMessages(k:HabboCommunicationDemo, _arg_2:IHabboCommunicationManager);

        public function dispose():void;

        private function unloading():void;

        private function onInitCrypto(k:IMessageEvent):void;

        private function onHotelViewBannerLoaded(k:BitmapData):void;

        private function onSecretKeyEvent(k:IMessageEvent):void;

        private function onAuthenticationOK(k:IMessageEvent):void;

        private function onGenericError(k:IMessageEvent):void;

        private function onPing(k:IMessageEvent):void;

        [SecureSWF(controlFlow="0", codeWrap="off")]
        private function onUniqueMachineId(k:UniqueMachineIDEvent):void;

        private function onIdentityAccounts(k:IdentityAccountsEvent):void;

        private function onErrorReport(k:IMessageEvent):void;

        private function onConnectionEstablished(k:Event=null):void;

        private function onMaintenance(k:MaintenanceStatusMessageEvent):void;

        private function onDisconnectReason(k:DisconnectReasonEvent):void;

        private function onConnectionDisconnected(k:Event):void;


    }
}//package com.sulake.habbo.communication.demo

