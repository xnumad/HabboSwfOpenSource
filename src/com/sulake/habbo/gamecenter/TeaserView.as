package com.sulake.habbo.gamecenter
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.display.Loader;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.LoaderInfo;

    public class TeaserView implements IDisposable 
    {
        private static const GAME_CENTER_TEASER_VIEW_XML:String = "game_center_teaser_view_xml";

        private var _disposed:Boolean;
        private var _gameCenterView:GameCenterView;
        private var _teaserDialog:_Str_2784;
        private var _teaserWindow:IWindowContainer;
        private var _teaserWrapper:IDisplayObjectWrapper;
        private var _teaserPlayer:Object;
        private var _selectedGame:int;

        public function TeaserView(k:GameCenterView)
        {
            this._gameCenterView = k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this.disable();
            this._gameCenterView = null;
            this._disposed = true;
        }

        public function activate(k:int):void
        {
            this._selectedGame = k;
            if (!this._teaserDialog)
            {
                this.createWindow();
            }
            this._teaserWindow.invalidate();
            this._teaserWindow.visible = true;
            this._Str_6199();
        }

        public function disable():void
        {
            var k:Loader;
            if (this._teaserWrapper)
            {
                if (this._teaserPlayer)
                {
                    this._teaserPlayer.destroy();
                    this._teaserPlayer = null;
                }
                k = (this._teaserWrapper.getDisplayObject() as Loader);
                if (k)
                {
                    k.unloadAndStop();
                }
                this._teaserWrapper = null;
            }
            if (this._teaserDialog)
            {
                this._teaserDialog.dispose();
                this._teaserDialog = null;
            }
            this._teaserWindow = null;
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this.disable();
        }

        private function createWindow():void
        {
            var k:IAsset = this._gameCenterView.assets.getAssetByName(GAME_CENTER_TEASER_VIEW_XML);
            var _local_2:XmlAsset = XmlAsset(k);
            this._teaserDialog = this._gameCenterView.windowManager.buildModalDialogFromXML(XML(_local_2.content));
            this._teaserWindow = (this._teaserDialog._Str_2429 as IWindowContainer);
            this._teaserWindow.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            this._teaserWrapper = (this._teaserWindow.findChildByName("teaser_wrapper") as IDisplayObjectWrapper);
            this._Str_23580();
        }

        private function _Str_23580():void
        {
            Security.allowDomain("www.youtube.com");
            var k:Loader = new Loader();
            k.load(new URLRequest((("http://www.youtube.com/v/" + this._Str_20439()) + "?version=3&autoplay=1")));
            k.contentLoaderInfo.addEventListener(Event.INIT, this._Str_24395);
            k.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this._Str_22482);
        }

        private function _Str_6199():void
        {
            this._gameCenterView.registerParameter(this._selectedGame, "gamecenter.teaser_title");
        }

        private function _Str_24395(k:Event):void
        {
            var _local_3:Loader;
            var _local_2:LoaderInfo = (k.target as LoaderInfo);
            if (_local_2)
            {
                _local_3 = _local_2.loader;
                this._teaserWrapper.setDisplayObject(_local_3);
                _local_3.content.addEventListener("onReady", this._Str_16623);
            }
        }

        private function _Str_20439():String
        {
            return this._gameCenterView._Str_3479.getProperty(("gamecenter.teaser." + GameConfigurations.getNameId(this._selectedGame)));
        }

        private function _Str_22482(k:IOErrorEvent):void
        {
            var _local_2:String;
            if (((this._gameCenterView._Str_3479) && (this._gameCenterView._Str_3479.context)))
            {
                _local_2 = ((("Failed to load teaser " + this._Str_20439()) + " for game ") + GameConfigurations.getNameId(this._selectedGame));
                this._gameCenterView._Str_3479.context.error(_local_2, false, k.errorID);
            }
        }

        private function _Str_16623(k:Event):void
        {
            this._teaserPlayer = k.target;
            this._teaserPlayer.setSize(this._teaserWrapper.width, this._teaserWrapper.height);
        }
    }
}
