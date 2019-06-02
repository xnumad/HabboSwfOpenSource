package com.sulake.habbo.communication
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.communication.connection.IConnectionStateListener;
    import com.sulake.core.communication.ICoreCommunicationManager;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import flash.utils.Timer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.dummy.TcpAuthDummy;
    import flash.events.Event;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDCoreCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import com.sulake.core.Core;
    import com.sulake.habbo.communication.enum._Str_6905;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.tracking.HabboErrorVariableEnum;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.encryption.ArcFour;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.habbo.communication.encryption.DiffieHellman;
    import com.hurlant.math.BigInteger;
    import com.sulake.core.communication.handshake.IKeyExchange;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_9636;
    import com.sulake.iid.*;

    public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener 
    {
        private static const _Str_18533:int = 2;

        private var _communication:ICoreCommunicationManager;
        private var _messages:IMessageConfiguration;
        private var _host:String = "";
        private var _ports:Array;
        private var _portIndex:int = -1;
        private var _nextPortTimer:Timer;
        private var _connectionAttempts:int = 1;
        private var _handledMessageIds:String = "";
        private var _connectionFailed:Boolean = false;
        private var _connectionRequested:Boolean = false;
        private var _a4:Array;
        private var _configurationsComplete:Boolean = false;
        private var _connection:IConnection;
        private var _mode:int = 0;
        private var _dummyTimer:Timer;
        private var _currentTcpDummy:TcpAuthDummy;
        private var _requiresInitialRetryAttempt:Boolean = true;

        public function HabboCommunicationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._messages = new HabboMessages();
            this._ports = [];
            this._nextPortTimer = new Timer(100, 1);
            this._a4 = [65191, 65178, 65178, 65177, 65185];
            super(k, _arg_2, _arg_3);
            k.events.addEventListener(Event.UNLOAD, this.unloading);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDCoreCommunicationManager(), function (k:ICoreCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null, false, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }])]));
        }

        private function _Str_18093(k:Event):void
        {
            this._connection.isAuthenticated();
        }

        private function onConfigurationComplete(k:Event):void
        {
            this._connection.isConfigured();
        }

        public function get connection():IConnection
        {
            return this._connection;
        }

        public function get mode():int
        {
            return 0;
        }

        public function set mode(k:int):void
        {
            this._mode = k;
        }

        public function get port():int
        {
            if ((((this._ports.length == 0) || (this._portIndex < 0)) || (this._portIndex >= this._ports.length)))
            {
                return 0;
            }
            return this._ports[this._portIndex];
        }

        override protected function initComponent():void
        {
            context.events.addEventListener(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_AUTHENTICATED, this._Str_18093);
            this._connection = this._communication.createConnection(this);
            this._connection.registerMessageClasses(this._messages);
            this._connection.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
            this._connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSecurityError);
            this._connection.addEventListener(Event.CONNECT, this.onConnect);
            this.updateHostParameters();
            if (this._connectionRequested)
            {
                this.tryNextPort();
            }
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._connection)
            {
                this._connection.dispose();
                this._connection = null;
            }
            super.dispose();
        }

        public function updateHostParameters():void
        {
            var _local_5:String;
            var _local_8:String;
            var _local_9:Array;
            var _local_10:int;
            var k:Array = [65162, 65162, 65158, 65155];
            var _local_2:Array = [65234, 65174, 65168, 65175, 65165, 65229];
            var _local_3:Array = [65170, 65162, 65157, 65155];
            var _local_4:Array = [65186, 65168, 65178, 65171, 65171];
            var _local_6:String = getProperty(this.getKeyValue([this._a4, _local_4, _local_2, _local_3], 0), null);
            if (_local_6 == null)
            {
                Core.crash(this.getKeyValue([this._a4, _local_4, _local_2, _local_3], 0), Core.ERROR_CATEGORY_CONNECT_TO_PROXY);
                return;
            }
            if (false == false)
            {
                _local_9 = [];
                _local_10 = 1;
                while (_local_10 < 5)
                {
                    _local_6 = _local_6.substring(0, (_local_6.length - _local_10));
                    switch (_local_10)
                    {
                        case (488311 % 668):
                            _local_9.push(_local_2);
                            break;
                        case (76 % 37):
                            _local_9.push(_local_4);
                            break;
                        case (415524125 % 49157):
                            _local_9.push(k);
                            break;
                        case (16 % 5):
                            _local_9.push(this._a4);
                            break;
                    }
                    _local_10++;
                }
                _local_5 = getProperty(this.getKeyValue(_local_9, 0), null);
            }
            if (_local_5 == null)
            {
                Core.crash(this.getKeyValue([this._a4, _local_4, _local_2, k], 0), Core.ERROR_CATEGORY_CONNECT_TO_PROXY);
                return;
            }
            this._ports = [];
            var _local_7:Array = _local_5.split(",");
            for each (_local_8 in _local_7)
            {
                this._ports.push(parseInt(_local_8.replace(" ", "")));
            }
            this._host = _local_6;
        }

        public function _Str_23491():void
        {
            if (this._dummyTimer)
            {
                this._dummyTimer.reset();
            }
            this._dummyTimer = null;
            this._connectionAttempts = 1;
            this._currentTcpDummy = null;
            this._requiresInitialRetryAttempt = true;
            if (this._connection != null)
            {
                this._connection.createSocket();
            }
        }

        public function initConnection(k:String):void
        {
            switch (k)
            {
                case _Str_6905.HABBO:
                    if (this._connection == null)
                    {
                        Core.crash("Tried to connect to proxy but connection was null", Core.ERROR_CATEGORY_CONNECT_TO_PROXY);
                        return;
                    }
                    this._connectionRequested = true;
                    if (allRequiredDependenciesInjected)
                    {
                        this.tryNextPort();
                    }
                    return;
            }
        }

        public function addHabboConnectionMessageEvent(k:IMessageEvent):IMessageEvent
        {
            if (this._connection)
            {
                this._connection.addMessageEvent(k);
            }
            return k;
        }

        public function removeHabboConnectionMessageEvent(k:IMessageEvent):void
        {
            if (this._connection)
            {
                this._connection.removeMessageEvent(k);
            }
        }

        public function habboWebLogin(k:String, _arg_2:String):IHabboWebLogin
        {
            var _local_3:String = "";
            _local_3 = getProperty("url.prefix");
            _local_3 = _local_3.replace("http://", "");
            _local_3 = _local_3.replace("https://", "");
            return new HabboWebLogin(k, _arg_2, _local_3);
        }

        public function connectionInit(host:String, port:int):void
        {
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.HOST, host);
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.PORT, String(port));
        }

        public function messageReceived(k:String):void
        {
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.RECE_MSG_TIME, String(new Date().getTime()));
            if (this._handledMessageIds.length > 0)
            {
                this._handledMessageIds = (this._handledMessageIds + (",R:" + k));
            }
            else
            {
                this._handledMessageIds = ("R:" + k);
            }
            if (this._handledMessageIds.length > 150)
            {
                this._handledMessageIds = this._handledMessageIds.substring((this._handledMessageIds.length - 150));
            }
        }

        public function messageSent(k:String):void
        {
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.SENT_MSG_TIME, String(new Date().getTime()));
            if (this._handledMessageIds.length > 0)
            {
                this._handledMessageIds = (this._handledMessageIds + (",S:" + k));
            }
            else
            {
                this._handledMessageIds = ("S:" + k);
            }
            if (this._handledMessageIds.length > 150)
            {
                this._handledMessageIds = this._handledMessageIds.substring((this._handledMessageIds.length - 150));
            }
        }

        public function messageParseError(k:IMessageDataWrapper):void
        {
            ErrorReportStorage.setParameter(HabboErrorVariableEnum.SENT_MSG_DATA, (k as Object).toString());
            ErrorReportStorage.addDebugData("MESSAGE_QUEUE", this._handledMessageIds);
        }

        public function setMessageQueueErrorDebugData():void
        {
            ErrorReportStorage.addDebugData("MESSAGE_QUEUE", this._handledMessageIds);
        }

        public function initializeEncryption():IEncryption
        {
            return new ArcFour();
        }

        public function initializeKeyExchange(k:BigInteger, _arg_2:BigInteger):IKeyExchange
        {
            return new DiffieHellman(k, _arg_2);
        }

        private function getKeyValue(k:Array, _arg_2:int):String
        {
            var _local_4:Array;
            var _local_5:int;
            var _local_3:String = "";
            for each (_local_4 in k)
            {
                for each (_local_5 in _local_4)
                {
                    _local_3 = (_local_3 + String.fromCharCode(((65290 - _local_5) + _arg_2--)));
                }
            }
            return _local_3;
        }

        private function tryNextPort():void
        {
            this._host = getProperty("connection.info.host");
            var k:int;
            if (!this._connection)
            {
                return;
            }
            if (this._connection.connected)
            {
                return;
            }
            if (((!(this._currentTcpDummy == null)) && (!(this._currentTcpDummy._Str_24860))))
            {
                if (this._dummyTimer == null)
                {
                    this._dummyTimer = new Timer(500);
                    this._dummyTimer.addEventListener(TimerEvent.TIMER, this.onTryNextPort);
                    this._dummyTimer.start();
                }
                else
                {
                    this._dummyTimer.reset();
                    this._dummyTimer.start();
                }
                return;
            }
            this._portIndex++;
            if (this._currentTcpDummy == null)
            {
                this._currentTcpDummy = new TcpAuthDummy((this._host + this.getKeyValue([[65290, 65290, 65290, 65290, 65290], [65290, 65290, 65290], [65290, 65290]], 0)), this._ports[this._portIndex]);
                this._portIndex--;
                this.resetPocketHabboSession();
                return;
            }
            if (this._portIndex >= this._ports.length)
            {
                ErrorReportStorage.addDebugData("ConnectionRetry", ("Connection attempt " + this._connectionAttempts));
                this._connectionAttempts++;
                k = _Str_18533;
                if (this._ports.length == 1)
                {
                    k++;
                }
                if (this._connectionAttempts <= k)
                {
                    this._portIndex = 0;
                }
                else
                {
                    if (this._connectionFailed)
                    {
                        return;
                    }
                    this._connectionFailed = true;
                    Core.error("Connection failed to host and ports", true, Core.ERROR_CATEGORY_CONNECT_TO_PROXY);
                    return;
                }
            }
            this._connection.timeout = (this._connectionAttempts * 10000);
            if (false == false)
            {
                this._connection.init((this._host + this.getKeyValue([[65290, 65290, 65290, 65290, 65290], [65290, 65290, 65290], [65290, 65290]], 0)), this._ports[this._portIndex]);
            }
            if (this._dummyTimer != null)
            {
                if (this._dummyTimer.running)
                {
                    this._dummyTimer.stop();
                }
                this._dummyTimer.removeEventListener(TimerEvent.TIMER, this.onTryNextPort);
            }
            this._dummyTimer = null;
            this._currentTcpDummy = null;
            if (this._requiresInitialRetryAttempt)
            {
                this._portIndex--;
                this._requiresInitialRetryAttempt = false;
            }
        }

        private function resetPocketHabboSession():void
        {
            this._nextPortTimer.addEventListener(TimerEvent.TIMER, this.onTryNextPort);
            this._nextPortTimer.start();
        }

        private function unloading(k:Event):void
        {
            if (this._connection)
            {
                this._connection.send(new _Str_9636());
            }
        }

        private function onIOError(k:IOErrorEvent):void
        {
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
            ErrorReportStorage.addDebugData("Communication IO Error", ((((("IOError " + k.type) + " on connect: ") + k.text) + ". Port was ") + this._ports[this._portIndex]));
            this.resetPocketHabboSession();
        }

        private function onConnect(k:Event):void
        {
            ErrorReportStorage.addDebugData("Connection", (("Connected with " + this._connectionAttempts) + " attempts"));
        }

        private function onTryNextPort(k:TimerEvent):void
        {
            this.tryNextPort();
        }

        private function onSecurityError(k:SecurityErrorEvent):void
        {
            ErrorReportStorage.addDebugData("Communication Security Error", ((("SecurityError on connect: " + k.text) + ". Port was ") + this._ports[this._portIndex]));
            this.resetPocketHabboSession();
        }
    }
}
