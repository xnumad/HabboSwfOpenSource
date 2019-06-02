package com.sulake.habbo.gamecenter
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextLinkWindow;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.game.GameAssetEnum;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;

    public class WaitingGameView implements IDisposable 
    {
        private static const _Str_7257:int = 500;
        private static const GAME_CENTER_WAITING_GAME_VIEW_XML:String = "game_center_waiting_game_view_xml";

        private var _disposed:Boolean;
        private var _gameCenterView:GameCenterView;
        private var _waitingGameDialog:_Str_2784;
        private var _waitingGameWindow:IWindowContainer;
        private var _logoImage:IStaticBitmapWrapperWindow;
        private var _cancelLink:ITextLinkWindow;
        private var _selectedGame:int;
        private var _waitingGameTimer:Timer;
        private var _counter:int = 0;

        public function WaitingGameView(k:GameCenterView)
        {
            this._gameCenterView = k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._waitingGameDialog)
            {
                this._waitingGameDialog.dispose();
                this._waitingGameDialog = null;
            }
            if (this._waitingGameTimer)
            {
                this._waitingGameTimer.removeEventListener(TimerEvent.TIMER, this._Str_10599);
                this._waitingGameTimer.stop();
                this._waitingGameTimer = null;
            }
            if (this._cancelLink)
            {
                this._cancelLink.removeEventListener(WindowMouseEvent.CLICK, this._Str_26455);
            }
            this._cancelLink = null;
            this._logoImage = null;
            this._gameCenterView = null;
            this._disposed = true;
            this._counter = 0;
        }

        public function activate(k:int):void
        {
            this._counter = 0;
            this._selectedGame = k;
            if (!this._waitingGameDialog)
            {
                this.createWindow();
            }
            this._waitingGameWindow.invalidate();
            this._waitingGameWindow.visible = true;
            this._Str_6199();
            this._gameCenterView._Str_3777(GameConfigurations.getNameId(this._selectedGame), "waitingGame");
            if (!this._waitingGameTimer)
            {
                this._waitingGameTimer = new Timer(_Str_7257);
                this._waitingGameTimer.addEventListener(TimerEvent.TIMER, this._Str_10599);
            }
            this._waitingGameTimer.start();
        }

        private function _Str_6199():void
        {
            this._logoImage.assetUri = null;
            this._logoImage.assetUri = GameConfigurations.getAssetUrl(this._selectedGame, GameAssetEnum.LOGO);
        }

        private function _Str_10599(k:TimerEvent):void
        {
            if (!this._waitingGameWindow)
            {
                return;
            }
            var _local_2:String = " ";
            var _local_3:int;
            while (_local_3 < (this._counter % 4))
            {
                _local_2 = (_local_2 + ".");
                _local_3++;
            }
            this._waitingGameWindow.caption = (this._gameCenterView.localization.getLocalization("gamecenter.waiting_game_title") + _local_2);
            this._counter++;
        }

        public function disable():void
        {
            if (!this._waitingGameDialog)
            {
                return;
            }
            this._waitingGameDialog.dispose();
            this._waitingGameDialog = null;
            this._waitingGameWindow = null;
            if (this._waitingGameTimer)
            {
                this._waitingGameTimer.stop();
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._Str_26455(k);
        }

        private function _Str_26455(k:WindowMouseEvent):void
        {
            this._gameCenterView._Str_10458(this._selectedGame);
            this.disable();
            this._gameCenterView.activate(this._selectedGame, false);
            this._gameCenterView._Str_3777(GameConfigurations.getNameId(this._selectedGame), "waitingGameCancel");
        }

        private function createWindow():void
        {
            var k:IAsset = this._gameCenterView.assets.getAssetByName(GAME_CENTER_WAITING_GAME_VIEW_XML);
            var _local_2:XmlAsset = XmlAsset(k);
            this._waitingGameDialog = this._gameCenterView.windowManager.buildModalDialogFromXML(XML(_local_2.content));
            this._waitingGameWindow = (this._waitingGameDialog._Str_2429 as IWindowContainer);
            this._waitingGameWindow.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            this._cancelLink = (this._waitingGameWindow.findChildByName("cancel_link") as ITextLinkWindow);
            this._cancelLink.addEventListener(WindowMouseEvent.CLICK, this._Str_26455);
            this._logoImage = (this._waitingGameWindow.findChildByName("logo_image") as IStaticBitmapWrapperWindow);
        }
    }
}
