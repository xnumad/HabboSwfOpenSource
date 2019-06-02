package com.sulake.habbo.communication.demo
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.net.URLLoader;
    import com.sulake.habbo.communication.IHabboWebLogin;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.communication.enum.HabboWeb;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.events.Event;

    public class SSOTicket extends EventDispatcherWrapper 
    {
        public static const SUCCESS:String = "success";
        public static const FAILURE:String = "failure";

        private var _loader:URLLoader;
        private var _clientURL:String;
        private var _habboWebLogin:IHabboWebLogin;
        private var _sessionId:String;
        private var _ticket:String;
        private var _flashClientUrl:String;
        private var _assets:IAssetLibrary;
        private var _isFacebookUser:Boolean;

        public function SSOTicket(k:IAssetLibrary, _arg_2:IHabboWebLogin, _arg_3:String, _arg_4:Boolean=true)
        {
            this._assets = k;
            this._habboWebLogin = _arg_2;
            this._clientURL = (("http://" + _arg_3) + "/client");
            if (!_arg_4)
            {
                this._habboWebLogin.init();
                this._habboWebLogin.addEventListener(HabboWeb.HABBO_WEB_LOGIN_SUCCESSFUL, this.requestClientURL);
            }
            else
            {
                this.requestClientURL();
            }
        }

        public function get ticket():String
        {
            return this._ticket;
        }

        public function get isFacebookUser():Boolean
        {
            return this._isFacebookUser;
        }

        public function get flashClientUrl():String
        {
            return this._flashClientUrl;
        }

        private function requestClientURL(k:Event=null):void
        {
            var _local_2:String = this._clientURL;
            if (this._assets.hasAsset(_local_2))
            {
            }
            var _local_3:URLRequest = new URLRequest(this._clientURL);
            if (this._assets.hasAsset(_local_2))
            {
                this._assets.removeAsset(this._assets.getAssetByName(_local_2));
            }
            var _local_4:AssetLoaderStruct = this._assets.loadAssetFromFile(_local_2, _local_3, "text/plain");
            _local_4.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_24600);
        }

        private function _Str_24600(event:Event=null):void
        {
            var facebookData:Object;
            var loaderStruct:AssetLoaderStruct = (event.target as AssetLoaderStruct);
            if (loaderStruct == null)
            {
                return;
            }
            var data:String = (loaderStruct.assetLoader.content as String);
            if (data.indexOf('account/reauthenticate"') > -1)
            {
                this._habboWebLogin.requestReAuthenticate();
            }
            else
            {
                try
                {
                    this._ticket = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
                    this._flashClientUrl = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
                    facebookData = /\"facebook.user\" : \"(.*?)\"/.exec(data);
                    if (facebookData)
                    {
                        this._isFacebookUser = Boolean(facebookData[1]);
                    }
                    if (this._ticket.length > 0)
                    {
                        dispatchEvent(new Event(SUCCESS));
                    }
                    else
                    {
                        dispatchEvent(new Event(FAILURE));
                    }
                }
                catch(e:Error)
                {
                    Logger.log(e);
                    dispatchEvent(new Event(FAILURE));
                }
            }
        }
    }
}
