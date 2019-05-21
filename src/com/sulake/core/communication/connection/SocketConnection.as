package com.sulake.core.communication.connection
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import flash.net.Socket;
    import flash.utils.Timer;
    import flash.utils.ByteArray;
    import com.sulake.core.communication.wireformat.IWireFormat;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.core.communication.messages.MessageClassManager;
    import com.sulake.core.communication.ICoreCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.core.communication.wireformat.EvaWireFormat;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getDefinitionByName;
    import com.sulake.core.utils.ClassUtils;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.Core;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.events.*;
    import __AS3__.vec.*;

    public class SocketConnection extends EventDispatcherWrapper implements IConnection, IDisposable 
    {
        public static const DEFAULT_SOCKET_TIMEOUT:int = 10000;

        private var _socket:Socket;
        private var _timeOutTimer:Timer;
        private var _timeOutStarted:int;
        private var _dataBuffer:ByteArray;
        private var _wireFormat:IWireFormat;
        private var _clientToServerEncryption:IEncryption;
        private var _serverToClientEncryption:IEncryption;
        private var _messageClassManager:MessageClassManager;
        private var _communicationManager:ICoreCommunicationManager;
        private var _stateListener:IConnectionStateListener;
        private var _authenticated:Boolean;
        private var _configurationReady:Boolean;
        private var _pendingClientMessages:Vector.<IMessageComposer>;
        private var _pendingServerMessages:Vector.<IMessageDataWrapper>;
        private var _lastProcessedMessage:IMessageDataWrapper;

        public function SocketConnection(communicationManager:ICoreCommunicationManager, stateListener:IConnectionStateListener)
        {
            this._communicationManager = communicationManager;
            this._messageClassManager = new MessageClassManager();
            this._wireFormat = new EvaWireFormat();
            this.createSocket();
            this._timeOutTimer = new Timer(DEFAULT_SOCKET_TIMEOUT, 1);
            this._timeOutTimer.addEventListener(TimerEvent.TIMER, this.onTimeOutTimer);
            this._stateListener = stateListener;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._Str_20244();
                if (this._timeOutTimer)
                {
                    this._timeOutTimer.stop();
                    this._timeOutTimer.removeEventListener(TimerEvent.TIMER, this.onTimeOutTimer);
                }
                this._timeOutTimer = null;
                this._dataBuffer = null;
                this._stateListener = null;
                this._clientToServerEncryption = null;
                this._serverToClientEncryption = null;
                this._wireFormat = null;
                if (this._messageClassManager)
                {
                    this._messageClassManager.dispose();
                }
                this._messageClassManager = null;
                this._communicationManager = null;
                this._stateListener = null;
                this._lastProcessedMessage = null;
                super.dispose();
            }
        }

        public function createSocket():void
        {
            this._Str_20244();
            this._dataBuffer = new ByteArray();
            this._serverToClientEncryption = null;
            this._clientToServerEncryption = null;
            this._socket = new Socket();
            this._socket.addEventListener(Event.CONNECT, this.onConnect);
            this._socket.addEventListener(Event.COMPLETE, this.onComplete);
            this._socket.addEventListener(Event.CLOSE, this.onClose);
            this._socket.addEventListener(ProgressEvent.SOCKET_DATA, this.onRead);
            this._socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
            this._socket.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
        }

        private function _Str_20244():void
        {
            if (this._socket)
            {
                this._socket.removeEventListener(Event.CONNECT, this.onConnect);
                this._socket.removeEventListener(Event.COMPLETE, this.onComplete);
                this._socket.removeEventListener(Event.CLOSE, this.onClose);
                this._socket.removeEventListener(ProgressEvent.SOCKET_DATA, this.onRead);
                this._socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
                this._socket.removeEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
                if (this._socket.connected)
                {
                    this._socket.close();
                }
                this._socket = null;
            }
        }

        public function init(k:String, _arg_2:uint=0):Boolean
        {
            if (this._stateListener)
            {
                this._stateListener.connectionInit(k, _arg_2);
            }
            this._timeOutTimer.start();
            this._timeOutStarted = getTimer();
            this._socket.connect(k, _arg_2);
            return true;
        }

        public function set timeout(k:int):void
        {
            if (disposed)
            {
                return;
            }
            this._timeOutTimer.delay = k;
        }

        public function addMessageEvent(k:IMessageEvent):void
        {
            if (disposed)
            {
                return;
            }
            this._messageClassManager.registerMessageEvent(k);
        }

        public function removeMessageEvent(k:IMessageEvent):void
        {
            if (disposed)
            {
                return;
            }
            this._messageClassManager.unregisterMessageEvent(k);
        }

        public function isAuthenticated():void
        {
            this._authenticated = true;
        }

        public function isConfigured():void
        {
            this._configurationReady = true;
            if (this._pendingServerMessages)
            {
                for each (var pendingServerMessage:IMessageDataWrapper in this._pendingServerMessages)
                {
                    var data:Array = this.parseReceivedMessage(pendingServerMessage);
                    if (data != null)
                    {
                        this.handleReceivedMessage(pendingServerMessage.getID(), data);
                    }
                }
            }
            if (this._pendingClientMessages)
            {
                for each (var pendingClientMessage:IMessageComposer in this._pendingClientMessages)
                {
                    this.send(pendingClientMessage);
                }
                this._pendingClientMessages = null;
            }
            this._pendingClientMessages = new Vector.<IMessageComposer>(0);
            this._pendingServerMessages = new Vector.<IMessageDataWrapper>(0);
        }

        public function send(message:IMessageComposer):Boolean
        {
            if (disposed)
            {
                return false;
            }
            if (((this._authenticated) && (!(this._configurationReady))))
            {
                if (this._pendingClientMessages == null)
                {
                    this._pendingClientMessages = new Vector.<IMessageComposer>(0);
                }
                this._pendingClientMessages.push(message);
                return false;
            }
            var _local_2:int = this._messageClassManager.getMessageIDForComposer(message);
            if (_local_2 < 0)
            {
                return false;
            }
            var _local_3:Array = message.getMessageArray();
            var _local_4:ByteArray = this._wireFormat.encode(_local_2, _local_3);
            if (this._stateListener)
            {
                this._stateListener.messageSent(String(_local_2));
            }
            if (this._socket.connected)
            {
                this._socket.writeBytes(_local_4);
                this._socket.flush();
            }
            else
            {
                return false;
            }
            return true;
        }

        public function sendUnencrypted(k:IMessageComposer):Boolean
        {
            if (disposed)
            {
                return false;
            }
            var _local_2:int = this._messageClassManager.getMessageIDForComposer(k);
            if (_local_2 < 0)
            {
                return false;
            }
            var _local_3:Array = k.getMessageArray();
            var _local_4:ByteArray = this._wireFormat.encode(_local_2, _local_3);
            var _local_5:String = getQualifiedClassName(k);
            var _local_6:Class = (getDefinitionByName(_local_5) as Class);
            if (!ClassUtils.implementsInterface(_local_6, IPreEncryptionMessage))
            {
                return false;
            }
            if (this._stateListener)
            {
                this._stateListener.messageSent(String(_local_2));
            }
            if (this._socket.connected)
            {
                this._socket.writeBytes(_local_4);
                this._socket.flush();
            }
            else
            {
                return false;
            }
            return true;
        }

        public function setEncryption(k:IEncryption, _arg_2:IEncryption):void
        {
            this._clientToServerEncryption = k;
            this._serverToClientEncryption = _arg_2;
        }

        public function registerMessageClasses(k:IMessageConfiguration):void
        {
            this._messageClassManager.registerMessages(k);
        }

        private function processData():void
        {
            var toProcess:Array;
			toProcess = this.splitReceivedMessages();
            for each (this._lastProcessedMessage in toProcess)
            {
            	var lastId:int = this._lastProcessedMessage.getID();
                if (this._stateListener)
                {
                    this._stateListener.messageReceived(String(lastId));
                }
                if (((this._authenticated) && (!(this._configurationReady))))
                {
                    if (this._pendingServerMessages == null)
                    {
                        this._pendingServerMessages = new Vector.<IMessageDataWrapper>(0);
                    }
                    this._pendingServerMessages.push(this._lastProcessedMessage);
                }
                else
                {
            		var messages:Array = this.parseReceivedMessage(this._lastProcessedMessage);
                    if (messages == null)
                    {
                    }
                    else
                    {
                        this.handleReceivedMessage(lastId, messages);
                    }
                }
            }
        }

        public function processReceivedData():void
        {
            if (disposed)
            {
                return;
            }
            try
            {
                this.processData();
            }
            catch(e:Error)
            {
                if (((_stateListener) && (_lastProcessedMessage)))
                {
                    _stateListener.messageParseError(_lastProcessedMessage);
                }
                if (!disposed)
                {
                    throw (e);
                }
            }
        }

        private function splitReceivedMessages():Array
        {
            this._dataBuffer.position = 0;
            if (this._dataBuffer.bytesAvailable == 0)
            {
                return new Array();
            }
            var buffer:Array = this._wireFormat.decode(this._dataBuffer, this);
            if (this._dataBuffer.bytesAvailable == 0)
            {
                this._dataBuffer = new ByteArray();
            }
            else
            {
                if (this._dataBuffer.position > 0)
                {
                    var remainingBuffer:ByteArray = new ByteArray();
                    remainingBuffer.writeBytes(this._dataBuffer, this._dataBuffer.position);
                    this._dataBuffer = remainingBuffer;
                }
            }
            return buffer;
        }

        private function parseReceivedMessage(message:IMessageDataWrapper):Array
        {
            var parser:IMessageParser;
            var events:Array = this._messageClassManager.getMessageEventsForID(message.getID());
            if (events != null)
            {
                parser = (events[0] as IMessageEvent).parser;
                try
                {
                    parser.flush();
                    parser.parse(message);
                }
                catch(e:Error)
                {
                    Core.crash((getKeyValue([[65220, 65192, 65183, 65179], [65185, 65185, 65252, 65167], [65171, 65249, 65168, 65182], [65164, 65162, 65175, 65243], [65169, 65163, 65173, 65160], [65161, 65164, 65158, 65164], [65234, 65156, 65163, 65148], [65147, 65164, 65157, 65158], [65226, 65140, 65141, 65150, 65144, 65150]], 0) + getQualifiedClassName(parser)), e.errorID, e);
                }
            }
            return events;
        }

        private function handleReceivedMessage(k:int, _arg_2:Array):void
        {
            var _local_3:IMessageEvent;
            for each (_local_3 in _arg_2)
            {
                _local_3.connection = this;
                _local_3.callback.call(null, _local_3);
            }
        }

        public function get connected():Boolean
        {
            if (this._socket == null)
            {
                return false;
            }
            return this._socket.connected;
        }

        public function close():void
        {
            if (this._socket == null)
            {
                return;
            }
            return this._socket.close();
        }

        private function onRead(k:ProgressEvent):void
        {
            if (this._socket == null)
            {
                return;
            }
            this._dataBuffer.position = this._dataBuffer.length;
            this._socket.readBytes(this._dataBuffer, this._dataBuffer.position);
        }

        public function getServerToClientEncryption():IEncryption
        {
            return this._serverToClientEncryption;
        }

        private function onConnect(k:Event):void
        {
            this._timeOutTimer.stop();
            ErrorReportStorage.addDebugData(this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65182], [65182, 65249, 65175, 65169, 65246]], 0) + (getTimer() - this._timeOutStarted)));
            dispatchEvent(k);
        }

        private function onClose(k:Event):void
        {
            this._timeOutTimer.stop();
            ErrorReportStorage.addDebugData(this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (this.getKeyValue([[65223, 65181, 65177, 65172], [65185, 65185, 65252, 65178], [65172, 65249]], 0) + (getTimer() - this._timeOutStarted)));
            dispatchEvent(k);
        }

        private function onComplete(k:Event):void
        {
            this._timeOutTimer.stop();
            ErrorReportStorage.addDebugData(this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (this.getKeyValue([[65223, 65178, 65179, 65175], [65178, 65184, 65168, 65182], [65182, 65249, 65175, 65169, 65246]], 0) + (getTimer() - this._timeOutStarted)));
            dispatchEvent(k);
        }

        private function onSecurityError(k:SecurityErrorEvent):void
        {
            this._timeOutTimer.stop();
            ErrorReportStorage.addDebugData(this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (this.getKeyValue([[65207, 65188, 65189, 65170], [65172, 65180, 65168, 65162], [65213, 65167, 65166, 65168], [65164, 65245, 65171, 65165, 65242]], 0) + (getTimer() - this._timeOutStarted)));
            dispatchEvent(k);
        }

        private function onIOError(k:IOErrorEvent):void
        {
            this._timeOutTimer.stop();
            ErrorReportStorage.addDebugData(this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (this.getKeyValue([[65217, 65210, 65219, 65173], [65172, 65174, 65170, 65251], [65177, 65171, 65248]], 0) + (getTimer() - this._timeOutStarted)));
            switch (k.type)
            {
                case IOErrorEvent.IO_ERROR:
                    break;
                case IOErrorEvent.DISK_ERROR:
                    break;
                case IOErrorEvent.NETWORK_ERROR:
                    break;
                case IOErrorEvent.VERIFY_ERROR:
                    break;
            }
            dispatchEvent(k);
        }

        private function onTimeOutTimer(k:TimerEvent):void
        {
            this._timeOutTimer.stop();
            ErrorReportStorage.addDebugData(this.getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (this.getKeyValue([[65206, 65184, 65179, 65186], [65207, 65168, 65168, 65251], [65177, 65171, 65248, 65247]], 0) + (getTimer() - this._timeOutStarted)));
            var ioErrorEvent:IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR);
            ioErrorEvent.text = ((this.getKeyValue([[65207, 65178, 65189, 65180], [65185, 65169, 65252, 65199], [65177, 65172, 65179, 65168], [65161, 65161, 65244, 65235]], 0) + this._timeOutTimer.delay) + this.getKeyValue([[65258, 65180, 65173, 65246], [65240, 65253, 65204, 65172], [65167, 65166, 65175, 65181], [65170, 65176, 65244, 65205], [65169, 65159, 65171, 65152], [65173, 65161, 65160, 65221]], 0));
            dispatchEvent(ioErrorEvent);
        }

        private function getKeyValue(keys:Array, value:int):String
        {
            var result:String = "";
            for each (var key:Array in keys)
            {
                for each (var header:int in key)
                {
                    result = (result + String.fromCharCode(((65290 - header) + value--)));
                }
            }
            return result;
        }
    }
}
