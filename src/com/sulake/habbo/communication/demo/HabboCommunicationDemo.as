package com.sulake.habbo.communication.demo
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.communication.encryption.rsa.RSAKey;
    import com.sulake.core.communication.handshake.IKeyExchange;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import flash.events.Event;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.text.Font;
    import flash.utils.ByteArray;
    import com.hurlant.crypto.hash.MD5;
    import flash.external.ExternalInterface;
    import flash.system.Capabilities;
    import flash.text.FontStyle;
    import flash.text.FontType;
    import com.hurlant.util.Hex;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.communication.messages.incoming.handshake.GenericErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.PingMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
    import com.sulake.habbo.communication.messages.incoming._Str_100.ConnectionErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UniqueMachineIDEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.InitDiffieHandshakeEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.IdentityAccountsEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.CompleteDiffieHandshakeEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.DisconnectReasonEvent;
    import flash.display.Stage;
    import com.sulake.core.runtime.events.HotelViewReadyEvent;
    import com.sulake.habbo.communication.enum._Str_6905;
    import com.sulake.core.Core;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.habbo.communication.enum.HabboCommunicationEvent;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_10198;
    import com.sulake.core.communication.encryption.CryptoTools;
    import com.sulake.habbo.communication.demo.utils.KeyObfuscator;
    import com.hurlant.math.BigInteger;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_10287;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.communication.encryption.IEncryption;
    import flash.net.SharedObject;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_7957;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_11513;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_10368;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_8322;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_6053;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.handshake._Str_9307;
    import com.sulake.habbo.communication.messages.parser.error.ConnectionErrorMessageParser;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.habbo.utils.Base64;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.communication.messages.incoming.handshake.*;
    import com.sulake.habbo.communication.messages.outgoing.handshake.*;
    import com.sulake.iid.*;

    public class HabboCommunicationDemo extends Component 
    {
        private static const FUSELOGIN:String = "fuselogin";

        private var _view:HabboLoginDemoView;
        private var _logoutInProgress:Boolean;
        private var _externalVariablesUrl:String;
        private var _rsa:RSAKey;
        private var _privateKey:String;
        private var _keyExchange:IKeyExchange;
        private var _handshakeInProgress:Boolean;
        private var _communication:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _ssoTicket:String;
        private var _flashClientUrl:String;

        public function HabboCommunicationDemo(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            k.events.addEventListener(Event.UNLOAD, this.unloading);
        }

        private static function _Str_20552():String
        {
            var userAgent:String;
            var plugins:String;
            var capabilities:String;
            var timeZoneOffset:String;
            var embeddedAndDeviceFonts:Array;
            var deviceFontNames:Array;
            var font:Font;
            var fonts:String;
            var fingerprintData:String;
            var ba:ByteArray;
            var md5:MD5;
            var fingerprint:String;
            try
            {
                if (ExternalInterface.available)
                {
                    userAgent = ExternalInterface.call("window.navigator.userAgent.toString");
                    plugins = ExternalInterface.call("FlashExternalInterface.listPlugins");
                }
                capabilities = Capabilities.serverString;
                timeZoneOffset = new String(new Date().timezoneOffset);
                embeddedAndDeviceFonts = Font.enumerateFonts(true);
                deviceFontNames = [];
                for each (font in embeddedAndDeviceFonts)
                {
                    if (((font.fontType == FontType.EMBEDDED) || (!(font.fontStyle == FontStyle.REGULAR))))
                    {
                    }
                    else
                    {
                        deviceFontNames.push(font.fontName);
                    }
                }
                fonts = deviceFontNames.join(",");
                fingerprintData = ((((((((userAgent + "#") + capabilities) + "#") + timeZoneOffset) + "#") + plugins) + "#") + fonts);
                ba = new ByteArray();
                ba.writeUTFBytes(fingerprintData);
                md5 = new MD5();
                fingerprint = Hex.fromArray(md5.hash(ba), false);
                if (((!(plugins)) || (plugins.length == 0)))
                {
                    return "~" + fingerprint;
                }
                return fingerprint;
            }
            catch(e:Error)
            {
            }
            return "";
        }


        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }, (!(this._Str_4954))), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            })]));
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function set _Str_25272(k:String):void
        {
            this._ssoTicket = k;
        }

        public function set flashClientUrl(k:String):void
        {
            this._flashClientUrl = k;
        }

        override protected function initComponent():void
        {
            var k:IConnection = this._communication.connection;
            if (k != null)
            {
                k.addEventListener(Event.CONNECT, this._Str_25793);
                k.addEventListener(Event.CLOSE, this.onParsedTicketSuccess);
            }
            this._communication.addHabboConnectionMessageEvent(new GenericErrorEvent(this.onGenericError));
            this._communication.addHabboConnectionMessageEvent(new PingMessageEvent(this._Str_24721));
            this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this._Str_22456));
            this._communication.addHabboConnectionMessageEvent(new ConnectionErrorEvent(this._Str_24454));
            this._communication.addHabboConnectionMessageEvent(new UniqueMachineIDEvent(this._Str_22966));
            this._communication.addHabboConnectionMessageEvent(new InitDiffieHandshakeEvent(this._Str_22382));
            this._communication.addHabboConnectionMessageEvent(new IdentityAccountsEvent(this._Str_23715));
            this._communication.addHabboConnectionMessageEvent(new CompleteDiffieHandshakeEvent(this._Str_25330));
            this._communication.addHabboConnectionMessageEvent(new DisconnectReasonEvent(this._Str_23126));
            var _local_2:Stage = context.displayObjectContainer.stage;
            if (_local_2 != null)
            {
                _local_2.dispatchEvent(new HotelViewReadyEvent(HotelViewReadyEvent.HOTEL_VIEW_READY));
            }
            this._ssoTicket = getProperty("sso.ticket");
            this._flashClientUrl = getProperty("flash.client.url");
            this._externalVariablesUrl = getProperty("external.variables.txt");
            if (this._ssoTicket)
            {
                this._communication.mode = _Str_6905._Str_4282;
                this._communication.initConnection(_Str_6905.HABBO);
            }
            else
            {
                if (((!(this._windowManager == null)) && (!(this._Str_4954))))
                {
                    if (((false) || (false)))
                    {
                        this._view = new HabboLoginDemoView(this);
                        this._view.addEventListener(HabboLoginDemoView.INITCONNECTION, this._Str_24041);
                    }
                    else
                    {
                        Core.crash("Login without an SSO ticket is not supported", Core.ERROR_CATEGORY_COMMMUNICATION_INIT);
                    }
                }
            }
        }

        override public function dispose():void
        {
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function initWithSSO(k:String):void
        {
            if (((k) && (!(this._ssoTicket))))
            {
                this._ssoTicket = k;
                this._communication.initConnection(_Str_6905.HABBO);
            }
        }

        public function sendTryLogin(k:String, _arg_2:String, _arg_3:int=0):void
        {
        }

        public function getXmlWindow(name:String, appendix:String="_xml", layer:uint=1):IWindow
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var window:IWindow;
            try
            {
                asset = assets.getAssetByName((name + appendix));
                xmlAsset = XmlAsset(asset);
                window = this._windowManager.buildFromXML(XML(xmlAsset.content), layer);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboCommunicationDemo", (((((("Failed to build window " + name) + "_xml, ") + asset) + ", ") + _windowManager) + "!"));
                throw (e);
            }
            return window;
        }

        public function _Str_4804(name:String, appendix:String="_xml"):_Str_2784
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var window:_Str_2784;
            try
            {
                asset = assets.getAssetByName((name + appendix));
                xmlAsset = XmlAsset(asset);
                window = this._windowManager.buildModalDialogFromXML(XML(xmlAsset.content));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboCommunicationDemo", (((((("Failed to build modal window " + name) + "_xml, ") + asset) + ", ") + _windowManager) + "!"));
                throw (e);
            }
            return window;
        }

        private function _Str_25793(k:Event=null):void
        {
            var _local_2:IConnection = this._communication.connection;
            if (_local_2 != null)
            {
                this._Str_25592();
                this.dispatchLoginStepEvent(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_ESTABLISHED);
                this._handshakeInProgress = true;
                this.dispatchLoginStepEvent(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKING);
                _local_2.sendUnencrypted(new _Str_10198());
                this.sendConnectionParameters(_local_2);
            }
        }

        private function _Str_22382(k:IMessageEvent):void
        {
            var _local_16:String;
            var _local_2:IConnection = k.connection;
            var _local_3:InitDiffieHandshakeEvent = (k as InitDiffieHandshakeEvent);
            var _local_4:ByteArray = new ByteArray();
            var _local_5:ByteArray = new ByteArray();
            _local_4.writeBytes(CryptoTools.hexStringToByteArray(_local_3._Str_16332));
            _local_5.writeBytes(CryptoTools.hexStringToByteArray(_local_3._Str_16524));
            var _local_6:ByteArray = new ByteArray();
            var _local_7:ByteArray = new ByteArray();
            this._rsa = RSAKey.parsePublicKey(KeyObfuscator._Str_24303(), KeyObfuscator._Str_22440());
            this._rsa.verify(_local_4, _local_6, _local_4.length);
            this._rsa.verify(_local_5, _local_7, _local_5.length);
            var _local_8:BigInteger = new BigInteger(_local_6.toString(), 10);
            var _local_9:BigInteger = new BigInteger(_local_7.toString(), 10);
            var _local_10:BigInteger = BigInteger.nbv(2);
            if (((_local_8.compareTo(_local_10) <= 0) || (_local_9.compareTo(_local_8) >= 0)))
            {
                Core.crash("Invalid DH prime and generator", Core.ERROR_CATEGORY_COMMMUNICATION_INIT);
                return;
            }
            if (_local_8.equals(_local_9))
            {
                Core.crash("Invalid DH prime and generator", Core.ERROR_CATEGORY_COMMMUNICATION_INIT);
                return;
            }
            this._keyExchange = this._communication.initializeKeyExchange(_local_8, _local_9);
            var _local_11:String;
            var _local_12:int = 10;
            var _local_13:String;
            while (_local_12 > 0)
            {
                _local_13 = this._Str_24975(30);
                this._keyExchange.init(_local_13);
                _local_16 = this._keyExchange.getPublicKey(10);
                if (_local_16.length < 64)
                {
                    if (((_local_11 == null) || (_local_16.length > _local_11.length)))
                    {
                        _local_11 = _local_16;
                        this._privateKey = _local_13;
                    }
                }
                else
                {
                    _local_11 = _local_16;
                    this._privateKey = _local_13;
                    break;
                }
                _local_12--;
            }
            if (_local_13 != this._privateKey)
            {
                this._keyExchange.init(this._privateKey);
            }
            var _local_14:ByteArray = new ByteArray();
            var _local_15:ByteArray = new ByteArray();
            _local_14.writeMultiByte(_local_11, "iso-8859-1");
            this._rsa.encrypt(_local_14, _local_15, _local_14.length);
            _local_2.sendUnencrypted(new _Str_10287(CryptoTools.byteArrayToHexString(_local_15)));
        }

        private function _Str_25330(k:IMessageEvent):void
        {
            var _local_9:IEncryption;
            var _local_2:IConnection = k.connection;
            var _local_3:CompleteDiffieHandshakeEvent = (k as CompleteDiffieHandshakeEvent);
            var _local_4:ByteArray = new ByteArray();
            var _local_5:ByteArray = new ByteArray();
            _local_4.writeBytes(CryptoTools.hexStringToByteArray(_local_3._Str_16514));
            this._rsa.verify(_local_4, _local_5, _local_4.length);
            this._rsa.dispose();
            this._keyExchange.generateSharedKey(_local_5.toString(), 10);
            var _local_6:String = this._keyExchange.getSharedKey(16).toUpperCase();
            if (((!(this._keyExchange._Str_20000())) || (!(this._keyExchange._Str_21716()))))
            {
                return;
            }
            var _local_7:ByteArray = CryptoTools.hexStringToByteArray(_local_6);
            _local_7.position = 0;
            var _local_8:IEncryption = this._communication.initializeEncryption();
            _local_8.init(_local_7);
            if (_local_3._Str_17893)
            {
                _local_9 = this._communication.initializeEncryption();
                _local_9.init(_local_7);
            }
            _local_2.setEncryption(_local_8, _local_9);
            this._handshakeInProgress = false;
            this.dispatchLoginStepEvent(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKED);
            this.sendConnectionParameters(_local_2);
        }

        private function sendConnectionParameters(k:IConnection):void
        {
            var _local_4:SharedObject;
            var _local_5:_Str_7957;
            k.send(new _Str_11513(401, this._flashClientUrl, this._externalVariablesUrl));
            var _local_2:String = "";
            try
            {
                _local_4 = SharedObject.getLocal(FUSELOGIN, "/");
                if (_local_4.data.machineid != null)
                {
                    _local_2 = _local_4.data.machineid;
                }
            }
            catch(e:Error)
            {
            }
            var _local_3:Array = Capabilities.version.split(" ");
            k.send(new _Str_10368(_local_2, _Str_20552(), _local_3.join("/")));
            if (((this._ssoTicket) && (this._ssoTicket.length > 0)))
            {
                k.send(new _Str_7957(this._ssoTicket));
            }
        }

        private function _Str_22456(k:IMessageEvent):void
        {
            var _local_2:IConnection = k.connection;
            var _local_3:AuthenticationOKMessageEvent = (k as AuthenticationOKMessageEvent);
            this.dispatchLoginStepEvent(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_AUTHENTICATED);
            var _local_4:_Str_8322 = new _Str_8322();
            _local_2.send(_local_4);
            var _local_5:EventLogMessageComposer = new EventLogMessageComposer("Login", "socket", "client.auth_ok");
            _local_2.send(_local_5);
            if (this._view != null)
            {
                this._view._Str_25535();
                this._view.dispose();
                this._view = null;
            }
        }

        private function onGenericError(event:IMessageEvent):void
        {
            var parser:_Str_6053 = (event as GenericErrorEvent).getParser();
            switch (parser.errorCode)
            {
                case -3:
                    this._windowManager.alert("${connection.error.id.title}", "${connection.login.error.-3.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case -400:
                    this._windowManager.alert("${connection.error.id.title}", "${connection.login.error.-400.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
            }
        }

        private function _Str_24721(k:IMessageEvent):void
        {
            var _local_2:IConnection = k.connection;
            var _local_3:PingMessageEvent = (k as PingMessageEvent);
            var _local_4:_Str_9307 = new _Str_9307();
            _local_2.send(_local_4);
        }

        private function _Str_22966(k:UniqueMachineIDEvent):void
        {
            var _local_2:SharedObject;
            if (k == null)
            {
                return;
            }
            try
            {
                _local_2 = SharedObject.getLocal(FUSELOGIN, "/");
                _local_2.data.machineid = k.machineID;
                _local_2.flush();
            }
            catch(e:Error)
            {
            }
        }

        private function _Str_23715(k:IdentityAccountsEvent):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:int;
            if (!k)
            {
                return;
            }
            if (this._Str_4954)
            {
                _local_2 = getProperty("roomviewer.login.name");
                _local_3 = getProperty("roomviewer.login.password");
                _local_4 = k.getParser()._Str_20644.getKey(0);
                this.sendTryLogin(_local_2, _local_3, _local_4);
            }
            else
            {
                if (this._view)
                {
                    this._view._Str_13771(k.getParser()._Str_20644);
                }
            }
        }

        private function _Str_24454(event:IMessageEvent):void
        {
            var parser:ConnectionErrorMessageParser = (event as ConnectionErrorEvent).getParser();
            var errorCode:int = parser.errorCode;
            var messageId:int = parser.messageId;
            var time:String = parser.timestamp;
            if (this._view)
            {
                this._view._Str_23906(errorCode, messageId, time);
            }
            switch (errorCode)
            {
                case 0:
                    this._windowManager.registerLocalizationParameter("connection.server.error.desc", "errorCode", String(errorCode));
                    this._windowManager.alert("${connection.server.error.title}", "${connection.server.error.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                case 1001:
                case 1002:
                case 1003:
                case 1004:
                case 1005:
                case 1006:
                case 1007:
                case 1008:
                case 1009:
                case 1010:
                case 1011:
                case 1012:
                case 1013:
                case 1014:
                case 1015:
                case 1016:
                case 1017:
                case 1018:
                case 1019:
                    event.connection.close();
                    return;
                case 4013:
                    this._windowManager.alert("${connection.room.maintenance.title}", "${connection.room.maintenance.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
                    return;
                default:
                    this._windowManager.registerLocalizationParameter("connection.server.error.desc", "errorCode", String(errorCode));
                    this._windowManager.alert("${connection.server.error.title}", "${connection.server.error.desc}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                    });
            }
        }

        private function _Str_23126(k:DisconnectReasonEvent):void
        {
            if (this._Str_4954)
            {
                return;
            }
            if (this._handshakeInProgress)
            {
                this.dispatchLoginStepEvent(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL);
            }
            this._logoutInProgress = true;
            var _local_2:String = getProperty("logout.url");
            if (_local_2.length > 0)
            {
                _local_2 = this.setReasonProperty(_local_2, k.reasonString);
                _local_2 = this.setOriginProperty(_local_2);
                _local_2 = (_local_2 + ("&id=" + k.reason));
                if (context.configuration.getInteger("spaweb", 0) == 1)
                {
                    HabboWebTools.send(k.reason, k.reasonString);
                }
                else
                {
                    HabboWebTools.openWebPage(_local_2, "_self");
                }
            }
        }

        private function setReasonProperty(k:String, _arg_2:String):String
        {
            if (k.indexOf("%reason%") != -1)
            {
                return k.replace("%reason%", _arg_2);
            }
            return k;
        }

        private function setOriginProperty(k:String):String
        {
            if (k.indexOf("%origin%") != -1)
            {
                return k.replace("%origin%", getProperty("flash.client.origin"));
            }
            return k;
        }

        private function dispatchLoginStepEvent(k:String):void
        {
            if (((Component(context) == null) || (Component(context).events == null)))
            {
                return;
            }
            Component(context).events.dispatchEvent(new Event(k));
        }

        private function _Str_24975(k:uint=16):String
        {
            var _local_4:uint;
            var _local_2:String = "";
            var _local_3:int;
            while (_local_3 < k)
            {
                _local_4 = uint(uint((Math.random() * 0xFF)));
                _local_2 = (_local_2 + _local_4.toString(16));
                _local_3++;
            }
            return _local_2;
        }

        private function unloading(k:Event):void
        {
            this._logoutInProgress = true;
        }

        private function _Str_24041(k:Event=null):void
        {
            this.dispatchLoginStepEvent(HabboCommunicationEvent.INIT);
            this._communication.mode = _Str_6905._Str_4282;
            this._communication.initConnection(_Str_6905.HABBO);
        }

        private function onParsedTicketSuccess(k:Event):void
        {
            var _local_2:String;
            if (this._Str_4954)
            {
                return;
            }
            if (this._handshakeInProgress)
            {
                this.dispatchLoginStepEvent(HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL);
            }
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.logDisconnection", "Communication failure, client disconnected.");
            }
            if (((k.type == Event.CLOSE) && (!(this._logoutInProgress))))
            {
                _local_2 = getProperty("logout.disconnect.url");
                _local_2 = this.setOriginProperty(_local_2);
                if (context.configuration.getInteger("spaweb", 0) == 1)
                {
                    HabboWebTools.send(-1, HabboCommunicationEvent.HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL);
                }
                else
                {
                    HabboWebTools.openWebPage(_local_2, "_self");
                }
            }
        }

        private function get _Str_4954():Boolean
        {
            return HabboComponentFlags._Str_4954(flags);
        }

        public function _Str_25592(k:Event=null):void
        {
            var _local_2:IWindowContainer = (this.getXmlWindow(Base64.decode("bG9naW5fd2luZG93"), "") as IWindowContainer);
            _local_2.visible = false;
            var _local_3:ITextFieldWindow = (_local_2.findChildByName(Base64.decode("ZHVtbXlfZmllbGQ=")) as ITextFieldWindow);
            var _local_4:String = Base64.decode(_local_3.text);
            _local_2.dispose();
            var _local_5:int = _local_4.charCodeAt(0);
            var _local_6:int = _local_4.charCodeAt((_local_5 + 1));
            var _local_7:Array = KeyObfuscator._Str_23865();
            _local_7[0] = _local_4.substr(1, _local_5);
            _local_7[1] = _local_4.substr((_local_5 + 2), _local_6);
        }
    }
}
