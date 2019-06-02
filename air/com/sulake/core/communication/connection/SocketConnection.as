//com.sulake.core.communication.connection.SocketConnection

package com.sulake.core.communication.connection{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import flash.net.Socket;
    import flash.utils.ByteArray;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.core.communication.wireformat.IWireFormat;
    import com.sulake.core.communication.messages.MessageClassManager;
    import com.sulake.core.communication.ICoreCommunicationManager;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import flash.events.ProgressEvent;
    import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;

    [SecureSWF(rename="true")]
    public class SocketConnection extends EventDispatcherWrapper implements IConnection, IDisposable {

        public static const DEFAULT_SOCKET_TIMEOUT:int;

        private var _socket:Socket;
        private var _dataBuffer:ByteArray;
        private var _encryption:IEncryption;
        private var _wireFormat:IWireFormat;
        private var _messageClassManager:MessageClassManager;
        private var _communicationManager:ICoreCommunicationManager;
        private var _stateListener:IConnectionStateListener;
        private var _timeOutTimer:Timer;
        private var _timeOutStarted:int;
        private var _connected:Boolean;
        private var _authenticated:Boolean;
        private var _configurationReady:Boolean;
        private var _pendingClientMessages:Vector.<IMessageComposer>;
        private var _pendingServerMessages:Vector.<IMessageDataWrapper>;

        public function SocketConnection(k:ICoreCommunicationManager, _arg_2:IConnectionStateListener);

        override public function dispose():void;

        public function init(k:String, _arg_2:uint=0, _arg_3:String=null):Boolean;

        public function set timeout(k:int):void;

        public function addMessageEvent(k:IMessageEvent):void;

        public function removeMessageEvent(k:IMessageEvent):void;

        public function isAuthenticated():void;

        public function isConfigured():void;

        [SecureSWF(controlFlow="50", codeWrap="maximum", rename="true")]
        public function send(k:IMessageComposer):Boolean;

        [SecureSWF(controlFlow="50", codeWrap="maximum", rename="true")]
        public function sendUnencrypted(k:IMessageComposer):Boolean;

        public function setEncryption(k:IEncryption):void;

        public function registerMessageClasses(k:IMessageConfiguration):void;

        public function toString():String;

        [SecureSWF(controlFlow="0")]
        public function processReceivedData():void;

        private function splitReceivedMessages():Array;

        private function parseReceivedMessage(k:IMessageDataWrapper):Array;

        private function handleReceivedMessage(k:int, _arg_2:Array):void;

        public function get connected():Boolean;

        public function close():void;

        private function onRead(k:ProgressEvent):void;

        private function onConnect(k:Event):void;

        private function onClose(k:Event):void;

        private function onComplete(k:Event):void;

        private function onSecurityError(k:SecurityErrorEvent):void;

        private function onIOError(k:IOErrorEvent):void;

        private function onTimeOutTimer(k:TimerEvent):void;

        private function debugLog(k:String):void;


    }
}//package com.sulake.core.communication.connection

