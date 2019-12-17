package com.sulake.habbo.game
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelWillCloseInMinutesEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.GameListMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.availability._Str_6521;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.GameAchievementsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.UnloadGameMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.LoadGameMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.availability.HotelClosesAndWillOpenAtEvent;
    import com.sulake.habbo.communication.messages.incoming._Str_348._Str_5416;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.LeftQueueMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.JoinedQueueMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.game.lobby.LoadGameUrlMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby.JoinedQueueMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LeftQueueMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.LoadGameUrlMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.lobby.UnloadGameMessageParser;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_6554;
    import com.sulake.habbo.communication.messages.outgoing._Str_497._Str_7123;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_7312;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_8040;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.lobby._Str_5486;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameListMessageParser;
    import com.sulake.habbo.gamecenter.GameConfigurations;
    import com.sulake.habbo.gamecenter.GameConfiguration;
    import com.sulake.habbo.communication.messages.parser.game.lobby._Str_5597;
    import com.sulake.habbo.communication.messages.parser.game.lobby.GameAchievementsMessageParser;

    public class IncomingMessages implements IDisposable 
    {
        private var _gameManager:HabboGameManager;
        private var _isDisposed:Boolean = false;

        public function IncomingMessages(k:HabboGameManager)
        {
            this._gameManager = k;
            var _local_2:IHabboCommunicationManager = this._gameManager.communication;
            _local_2.addHabboConnectionMessageEvent(new HotelWillCloseInMinutesEvent(this._Str_10317));
            _local_2.addHabboConnectionMessageEvent(new GameListMessageEvent(this._Str_25333));
            _local_2.addHabboConnectionMessageEvent(new _Str_6521(this._Str_10317));
            _local_2.addHabboConnectionMessageEvent(new GameAchievementsMessageEvent(this._Str_25513));
            _local_2.addHabboConnectionMessageEvent(new UnloadGameMessageEvent(this._Str_25361));
            _local_2.addHabboConnectionMessageEvent(new LoadGameMessageEvent(this._Str_22979));
            _local_2.addHabboConnectionMessageEvent(new HotelClosesAndWillOpenAtEvent(this._Str_10317));
            _local_2.addHabboConnectionMessageEvent(new _Str_5416(this._Str_16577));
            _local_2.addHabboConnectionMessageEvent(new LeftQueueMessageEvent(this._Str_22378));
            _local_2.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this._Str_24100));
            _local_2.addHabboConnectionMessageEvent(new JoinedQueueMessageEvent(this._Str_24534));
            _local_2.addHabboConnectionMessageEvent(new LoadGameUrlMessageEvent(this._Str_25712));
        }

        public function dispose():void
        {
            this._gameManager = null;
            this._isDisposed = true;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        private function _Str_24534(k:JoinedQueueMessageEvent):void
        {
            var _local_2:JoinedQueueMessageParser = k.getParser();
            HabboGamesCom.log(("[BaseJump] joined queue for game " + _local_2.gameTypeId));
        }

        private function _Str_22378(k:LeftQueueMessageEvent):void
        {
            var _local_2:LeftQueueMessageParser = k.getParser();
            HabboGamesCom.log(("[BaseJump] left queue for game " + _local_2.gameTypeId));
        }

        private function _Str_22979(k:LoadGameMessageEvent):void
        {
            var _local_2:LoadGameMessageParser = k.getParser();
            HabboGamesCom.log(((("[BaseJump] load game " + _local_2.gameTypeId) + " url:") + _local_2.url));
            this._gameManager.loadGameClient(_local_2.gameTypeId, _local_2._Str_12486, _local_2.url, _local_2.quality, _local_2.scaleMode, _local_2.frameRate, _local_2.minMajorVersion, _local_2.minMinorVersion, _local_2.params);
        }

        private function _Str_25712(k:LoadGameUrlMessageEvent):void
        {
            var _local_2:LoadGameUrlMessageParser = k.getParser();
            HabboGamesCom.log(((("[BaseJump] load game url " + _local_2.gameTypeId) + " url:") + _local_2.url));
            this._gameManager._Str_19055(_local_2.gameTypeId, _local_2._Str_12486, _local_2.url);
        }

        private function _Str_25361(k:UnloadGameMessageEvent):void
        {
            var _local_2:UnloadGameMessageParser = k.getParser();
            HabboGamesCom.log(("[BaseJump] unload game " + _local_2.gameTypeId));
            this._gameManager._Str_8716(_local_2.gameTypeId, _local_2._Str_12486, "unloadGameClient");
        }

        private function _Str_16577(k:_Str_5416):void
        {
            var _local_2:_Str_6554 = k.getParser();
            if (_local_2.gameTypeId == this._gameManager.promotedGameId())
            {
                this._gameManager._Str_23215(_local_2._Str_22319);
                this._gameManager._Str_22499();
            }
        }

        private function _Str_24100(k:AuthenticationOKMessageEvent):void
        {
            var _local_2:int = this._gameManager.promotedGameId();
            if (_local_2 != -1)
            {
                this._gameManager.send(new _Str_7123(_local_2));
            }
            this._gameManager.send(new _Str_7312());
            this._gameManager.send(new _Str_8040());
        }

        private function _Str_10317(k:IMessageEvent):void
        {
            this._gameManager._Str_25498 = true;
        }

        private function _Str_25333(k:GameListMessageEvent):void
        {
            var _local_3:_Str_5486;
            var _local_2:GameListMessageParser = (k.parser as GameListMessageParser);
            GameConfigurations.resetGames();
            for each (_local_3 in _local_2.games)
            {
                GameConfigurations.addGame(new GameConfiguration(_local_3.gameId, _local_3.gameNameId, _local_3.bgColor, _local_3.textColor, _local_3.assetUrl, _local_3.supportUrl));
            }
            GameConfigurations.setGameListInitialized(this._gameManager.events);
        }

        private function _Str_25513(k:GameAchievementsMessageEvent):void
        {
            var _local_3:_Str_5597;
            var _local_4:int;
            var _local_5:String;
            var _local_2:GameAchievementsMessageParser = (k.parser as GameAchievementsMessageParser);
            GameConfigurations.resetBadges();
            for each (_local_3 in _local_2.achievements)
            {
                _local_4 = 1;
                while (_local_4 <= _local_3.levels)
                {
                    _local_5 = (("ACH_" + _local_3._Str_25317) + _local_4);
                    GameConfigurations.addGameAchievementBadge(_local_3.gameTypeId, _local_5);
                    _local_4++;
                }
            }
            GameConfigurations.setGameAchievementsInitialized(this._gameManager.events);
        }
    }
}
