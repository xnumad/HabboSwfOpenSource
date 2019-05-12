package com.sulake.habbo.communication
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.net.URLRequestHeader;
    import flash.net.URLLoader;
    import flash.events.IEventDispatcher;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.net.URLRequestMethod;
    import flash.events.Event;
    import com.sulake.habbo.communication.enum.HabboWeb;
    import flash.events.SecurityErrorEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;

    public class HabboWebLogin extends EventDispatcherWrapper implements IHabboWebLogin 
    {
        private static const _Str_21840:URLRequestHeader = new URLRequestHeader("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:14.0) Gecko/20100101 Firefox/14.0.1 FirePHP/0.7.1");

        private var _loader:URLLoader;
        private var _name:String;
        private var _password:String;
        private var _loginURL:String;
        private var _securityCheckURL:String;
        private var _reauthenticateURL:String;

        public function HabboWebLogin(k:String, _arg_2:String, _arg_3:String, _arg_4:IEventDispatcher=null)
        {
            super(_arg_4);
            this._name = k;
            this._password = _arg_2;
            this._loginURL = (("https://" + _arg_3) + "/account/submit");
            this._securityCheckURL = (("https://" + _arg_3) + "/security_check");
            this._reauthenticateURL = (("https://" + _arg_3) + "/account/reauthenticate");
        }

        public function init():void
        {
            this._Str_24445();
        }

        private function _Str_24445():void
        {
            var k:String = ((("credentials.username=" + this._name) + "&credentials.password=") + this._password);
            var _local_2:URLRequest = new URLRequest(this._loginURL);
            _local_2.data = new URLVariables(k);
            _local_2.method = URLRequestMethod.POST;
            this._loader = new URLLoader();
            this._loader.addEventListener(Event.COMPLETE, this._Str_19337);
            this._Str_16389(this._loader);
            this._loader.load(_local_2);
        }

        private function _Str_19337(k:Event=null):void
        {
            var _local_4:String;
            var _local_5:URLRequest;
            var _local_2:URLLoader = URLLoader(k.target);
            var _local_3:String = _local_2.data;
            if (((_local_3.indexOf("Redirecting") > -1) && (!(_local_3.indexOf("/useOrCreateAvatar/") == -1))))
            {
                _local_4 = /<meta http-equiv="Refresh" content="0;URL=(.*?)">/.exec(_local_3)[1];
                _local_5 = new URLRequest(_local_4);
                this._loader.load(_local_5);
                return;
            }
            this._loader.removeEventListener(Event.COMPLETE, this._Str_19337);
            this._Str_5679(this._loader);
            if (_local_3.indexOf("Redirecting") > -1)
            {
                this._Str_25394();
            }
            else
            {
                if (_local_3.indexOf("Habbo ~ Me") > -1)
                {
                    dispatchEvent(new Event(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL));
                }
                else
                {
                    if (_local_3.indexOf("Habbo ~ Home") > -1)
                    {
                        dispatchEvent(new Event(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL));
                    }
                    else
                    {
                        if (_local_3.indexOf("Habbo: Home") > -1)
                        {
                            dispatchEvent(new Event(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL));
                        }
                        else
                        {
                            if (_local_3.indexOf("document.habboLoggedIn = true") > -1)
                            {
                                dispatchEvent(new Event(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL));
                            }
                            else
                            {
                                Logger.log(("Login failed. Received page:\n" + _local_3));
                            }
                        }
                    }
                }
            }
        }

        private function _Str_25394():void
        {
            var k:URLRequest = new URLRequest(this._securityCheckURL);
            this._loader = new URLLoader();
            this._loader.addEventListener(Event.COMPLETE, this._Str_21739);
            this._Str_16389(this._loader);
            this._loader.load(k);
        }

        private function _Str_21739(k:Event=null):void
        {
            var _local_2:URLLoader = URLLoader(k.target);
            this._loader.removeEventListener(Event.COMPLETE, this._Str_21739);
            this._Str_5679(this._loader);
            var _local_3:String = _local_2.data;
            if (_local_3.indexOf("Redirecting") > -1)
            {
                dispatchEvent(new Event(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL));
            }
        }

        public function _Str_20369():void
        {
            var k:String = ("page=%2Fclient&credentials.password=" + this._password);
            var _local_2:URLRequest = new URLRequest(this._reauthenticateURL);
            _local_2.data = new URLVariables(k);
            _local_2.method = URLRequestMethod.POST;
            this._loader = new URLLoader();
            this._loader.addEventListener(Event.COMPLETE, this._Str_20987);
            this._Str_16389(this._loader);
            this._loader.load(_local_2);
        }

        private function _Str_20987(k:Event=null):void
        {
            var _local_2:URLLoader = URLLoader(k.target);
            this._loader.removeEventListener(Event.COMPLETE, this._Str_20987);
            this._Str_5679(this._loader);
            var _local_3:String = _local_2.data;
            if (_local_3.indexOf("Redirecting") > -1)
            {
                dispatchEvent(new Event(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL));
            }
        }

        private function _Str_16389(k:IEventDispatcher):void
        {
            k.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this._Str_19695);
            k.addEventListener(HTTPStatusEvent.HTTP_STATUS, this._Str_19037);
            k.addEventListener(IOErrorEvent.IO_ERROR, this._Str_9598);
        }

        private function _Str_5679(k:IEventDispatcher):void
        {
            k.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this._Str_19695);
            k.removeEventListener(HTTPStatusEvent.HTTP_STATUS, this._Str_19037);
            k.removeEventListener(IOErrorEvent.IO_ERROR, this._Str_9598);
        }

        private function _Str_9598(k:IOErrorEvent):void
        {
        }

        private function _Str_19037(k:HTTPStatusEvent):void
        {
        }

        private function _Str_19695(k:SecurityErrorEvent):void
        {
        }
    }
}
