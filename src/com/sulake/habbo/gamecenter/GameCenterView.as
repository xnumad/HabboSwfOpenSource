package com.sulake.habbo.gamecenter
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.game.HabboGameManager;
    import flash.utils.Timer;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.incoming.game.score._Str_11645;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_356._Str_10571;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.display.BitmapData;

    public class GameCenterView implements IDisposable, IGetImageListener 
    {
        private static const _Str_7257:int = 3000;

        private var _disposed:Boolean;
        private var _gameManager:HabboGameManager;
        private var _layout:GameCenterLayout;
        private var _leaderboard:LeaderboardView;
        private var _waitingGame:WaitingGameView;
        private var _teaserView:TeaserView;
        private var _waitingGameTimer:Timer;
        private var _waitingGameId:int = -1;
        private var _alert:_Str_2418;
        private var _gameRewardListener:IGameRewardListener;
        private var _waitingRewardFurniId:int;
        private var _startPlaying:Boolean;

        public function GameCenterView(k:HabboGameManager)
        {
            this._gameManager = k;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._gameManager.windowManager;
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._gameManager.communication;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._gameManager.localization;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._gameManager.sessionDataManager;
        }

        public function get avatarRenderManager():IAvatarRenderManager
        {
            return this._gameManager.avatarRenderManager;
        }

        public function get assets():IAssetLibrary
        {
            return this._gameManager.assets;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._gameManager.roomEngine;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_3479():HabboGameManager
        {
            return this._gameManager;
        }

        public function dispose():void
        {
            if (this._layout)
            {
                this._layout.dispose();
                this._layout = null;
            }
            if (this._leaderboard)
            {
                this._leaderboard.dispose();
                this._leaderboard = null;
            }
            this._waitingGameId = -1;
            if (this._waitingGame)
            {
                this._waitingGame.dispose();
                this._waitingGame = null;
            }
            if (this._waitingGameTimer)
            {
                this._waitingGameTimer.removeEventListener(TimerEvent.TIMER, this._Str_10599);
                this._waitingGameTimer.stop();
                this._waitingGameTimer = null;
            }
            if (this._teaserView)
            {
                this._teaserView.dispose();
                this._teaserView = null;
            }
            this._Str_18574();
            this._gameManager = null;
            this._disposed = true;
        }

        public function initialize(k:int, _arg_2:Boolean):void
        {
            this._startPlaying = _arg_2;
            if (!this._layout)
            {
                this._layout = new GameCenterLayout(this);
            }
            if (GameConfigurations.isGameEnabled(k))
            {
                this.activate(k, _arg_2);
            }
            this.communication.addHabboConnectionMessageEvent(new _Str_11645(this._Str_23350));
        }

        public function activate(k:int, _arg_2:Boolean):void
        {
            if (this._layout)
            {
                this._layout.activate(k, _arg_2);
            }
        }

        public function disable():void
        {
            if (this._layout)
            {
                this._layout.disable();
            }
            if (this._leaderboard)
            {
                this._leaderboard.disable();
            }
            if (this._waitingGame)
            {
                this._waitingGame.disable();
            }
            if (this._teaserView)
            {
                this._teaserView.disable();
            }
        }

        public function _Str_18157(k:int):void
        {
            if (this._leaderboard)
            {
                this._leaderboard._Str_18157(k);
            }
        }

        public function get _Str_12938():Boolean
        {
            return this._gameManager._Str_12938;
        }

        public function getLocalization(k:int):String
        {
            var _local_2:String = GameConfigurations.getNameId(k);
            return this.localization.getLocalization((("gamecenter." + _local_2) + ".name"));
        }

        public function _Str_3777(k:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            this._gameManager._Str_3777(k, _arg_2, _arg_3, _arg_4);
        }

        public function registerParameter(k:int, _arg_2:String):String
        {
            return this.localization.registerParameter(_arg_2, "game", this.getLocalization(k));
        }

        public function send(k:IMessageComposer):void
        {
            this._gameManager.send(k);
        }

        public function joinPlayerQueue(k:int):void
        {
            this._startPlaying = false;
            this._gameManager.joinPlayerQueue(k);
        }

        public function _Str_10458(k:int):void
        {
            this._gameManager._Str_10458(k);
        }

        public function showLeaderboard(k:int):void
        {
            if (!this._leaderboard)
            {
                this._leaderboard = new LeaderboardView(this);
            }
            this._leaderboard.activate(k);
            this._Str_3777(GameConfigurations.getNameId(k), "showLeaderboard");
        }

        public function _Str_26125(k:int):void
        {
            if (!this._teaserView)
            {
                this._teaserView = new TeaserView(this);
            }
            this._teaserView.activate(k);
            this._Str_3777(GameConfigurations.getNameId(k), "showTeaser");
        }

        public function _Str_19498(k:int):void
        {
            if (this._waitingGameId > -1)
            {
                return;
            }
            if (!this._waitingGame)
            {
                this._waitingGame = new WaitingGameView(this);
            }
            if (!this._waitingGameTimer)
            {
                this._waitingGameTimer = new Timer(_Str_7257, 1);
                this._waitingGameTimer.addEventListener(TimerEvent.TIMER, this._Str_10599);
            }
            this._waitingGameTimer.start();
            this._waitingGameId = k;
        }

        private function _Str_10599(k:TimerEvent):void
        {
            if (this._waitingGameId > -1)
            {
                this._waitingGame.activate(this._waitingGameId);
            }
        }

        public function _Str_18594(k:int):void
        {
            this._waitingGameId = -1;
            if (this._waitingGameTimer)
            {
                this._waitingGameTimer.reset();
            }
            if (this._waitingGame)
            {
                this._waitingGame.disable();
            }
        }

        public function _Str_5104(k:String):void
        {
            this._Str_18574();
            this._alert = this.windowManager.alert("Game Center Alert", k, 0, this._Str_3168);
        }

        private function _Str_18574():void
        {
            if (this._alert)
            {
                this._alert.dispose();
                this._alert = null;
            }
        }

        private function _Str_3168(k:_Str_2418, _arg_2:WindowEvent):void
        {
            this._Str_18574();
        }

        public function _Str_24458(k:int):void
        {
            this._startPlaying = false;
            var _local_2:String = GameConfigurations.getNameId(k);
            this._gameManager._Str_22538(_local_2, "getVip.clicked.playNow");
        }

        public function _Str_20681(k:IGameRewardListener):void
        {
            this._gameRewardListener = k;
            this.send(new _Str_10571(k._Str_18928()));
        }

        private function _Str_23350(k:IMessageEvent):void
        {
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if ((((this._waitingRewardFurniId == k) && (this._gameRewardListener)) && (!((this._gameRewardListener as IDisposable).disposed))))
            {
                this._gameRewardListener._Str_16195(_arg_2);
            }
            this._waitingRewardFurniId = -1;
            this._gameRewardListener = null;
        }

        public function imageFailed(k:int):void
        {
        }

        internal function get _Str_18932():Boolean
        {
            return this._startPlaying;
        }
    }
}
