//com.sulake.habbo.communication.HabboCommunicationManager

package com.sulake.habbo.communication{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.communication.connection.IConnectionStateListener;
    import com.sulake.core.communication.ICoreCommunicationManager;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import flash.utils.Timer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import flash.events.Event;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.hurlant.math.BigInteger;
    import com.sulake.core.communication.handshake.IKeyExchange;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;
    import flash.events.SecurityErrorEvent;

    [SecureSWF(rename="true")]
    public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener {

        private static const DEFAULT_CONNECTION_ATTEMPTS:int;

        private var _communication:ICoreCommunicationManager;
        private var _messages:IMessageConfiguration;
        private var _host:String;
        private var _ports:Array;
        private var _portIndex:int;
        private var _nextPortTimer:Timer;
        private var _connectionAttempts:int;
        private var _handledMessageIds:String;
        private var _connectionFailed:Boolean;
        private var _connectionRequested:Boolean;
        private var _mode:int;
        private var _pocketSession:IPocketHabboSession;
        private var _a4:Array;
        private var _connection:IConnection;

        public function HabboCommunicationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null);

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        private function onAuthenticated(k:Event):void;

        private function onConfigurationComplete(k:Event):void;

        public function get connection():IConnection;

        public function get mode():int;

        public function set mode(k:int):void;

        public function get port():int;

        override protected function initComponent():void;

        override public function dispose():void;

        [SecureSWF(controlFlow="50", codeWrap="maximum")]
        public function updateHostParameters():void;

        public function initConnection(k:String):void;

        public function addHabboConnectionMessageEvent(k:IMessageEvent):IMessageEvent;

        public function removeHabboConnectionMessageEvent(k:IMessageEvent):void;

        public function habboWebLogin(k:String, _arg_2:String):IHabboWebLogin;

        public function connectionInit(k:String, _arg_2:int):void;

        public function messageReceived(k:String):void;

        public function messageSent(k:String):void;

        public function messageParseError(k:IMessageDataWrapper):void;

        public function setMessageQueueErrorDebugData():void;

        public function initializeEncryption(k:IEncryption):IEncryption;

        public function initializeKeyExchange(k:BigInteger, _arg_2:BigInteger):IKeyExchange;

        private function getKeyValue(k:Array, _arg_2:int):String;

        private function nextPort():void;

        private function tryNextPort():void;

        private function unloading(k:Event):void;

        private function onIOError(k:IOErrorEvent):void;

        private function onConnect(k:Event):void;

        private function onClose(k:Event):void;

        private function onTryNextPort(k:TimerEvent):void;

        private function onSecurityError(k:SecurityErrorEvent):void;

        public function createPocketHabboSession(k:IPocketHabboListener, _arg_2:String):IPocketHabboSession;

        public function getPocketHabboSession():IPocketHabboSession;

        public function resetPocketHabboSession():void;


    }
}//package com.sulake.habbo.communication

