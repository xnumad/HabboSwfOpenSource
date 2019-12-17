package snowwar
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.game.HabboGames;
	import com.sulake.habbo.communication.messages.incoming.users._Str_3492;
	import snowwar._Str_231.SynchronizedGameArena;
	import snowwar._Str_231.SynchronizedGameStage;
	import snowwar._Str_231._SafeStr_4019;
	import snowwar._Str_277.SnowStormOnStageStartParser;
	import snowwar._Str_277.SnowStormIntializeGameArenaViewParser;
	import snowwar._Str_277.SnowStormRejoinPreviousRoomParser;
	import snowwar._Str_277._SafeStr_4568;
	import snowwar._Str_277.SnowStormLevelDataParser;
	import snowwar._Str_277.SnowStormOnGameEndingParser;
	import snowwar._Str_277.SnowStormOnStageRunningParser;
	import snowwar._Str_277.SnowStormOnStageEndingParser;
	import snowwar._Str_277.SnowStormIntializedPlayersParser;
	import snowwar._Str_277.SnowStormOnPlayerExitedArenaParser;
	import snowwar._Str_277.SnowStormGenericErrorParser2;
	import snowwar._Str_277.SnowStormUserRematchedParser;
	import com.sulake.habbo.communication.messages.parser.game.score.Game2WeeklyLeaderboardParser;
	import com.sulake.habbo.communication.messages.parser.game.score._Str_4574;
	import snowwar._Str_320._SafeStr_4674;
	//import com.sulake.room.renderer.cache._SafeStr_1440; //TODO
	import com.sulake.habbo.communication.messages.incoming.game.score._Str_18356;
	import com.sulake.habbo.communication.messages.incoming.game.score._Str_5142;
	import com.sulake.habbo.communication.messages.incoming.game.score._Str_8022;
	import com.sulake.habbo.communication.messages.incoming.game.score._Str_8191;
	import com.sulake.core.utils.Map;
	import com.sulake.habbo.catalog.enum._SafeStr_2308; //constants 2308
	import snowwar._Str_336.SnowStormOnStageStartEvent;
	import snowwar._Str_336.SnowStormIntializeGameArenaViewEvent;
	import snowwar._Str_336.SnowStormRejoinPreviousRoomEvent;
	import snowwar._Str_336._SafeStr_3669;
	import snowwar._Str_336.SnowStormLevelDataEvent;
	import snowwar._Str_336.SnowStormOnGameEndingEvent;
	import snowwar._Str_336.SnowStormUserChatMessageEvent;
	import snowwar._Str_336.SnowStormOnStageRunningEvent;
	import snowwar._Str_336.SnowStormOnStageEndingEvent;
	import snowwar._Str_336.SnowStormIntializedPlayersEvent;
	import snowwar._Str_336.SnowStormOnPlayerExitedArenaEvent;
	import snowwar._Str_336.SnowStormGenericErrorEvent2;
	import snowwar._Str_336.SnowStormUserRematchedEvent;
	import snowwar._Str_343.SnowStormGameStatusEvent;
	import snowwar._Str_343.SnowStormFullGameStatusEvent;
	import snowwar._Str_377._SafeStr_4677;
	import snowwar._Str_39.HumanGameObject;
	import snowwar._Str_39.TreeGameObject;
	import snowwar._Str_39._SafeStr_4035;
	import snowwar._Str_39._SafeStr_4671;
	import snowwar._Str_39._SafeStr_4672;
	import com.sulake.habbo.communication.IHabboCommunicationManager;
	import snowwar._Str_448.SnowStormGameStartedEvent;
	import snowwar._Str_448.SnowStormQuePositionEvent;
	import snowwar._Str_448.SnowStormStartBlockTickerEvent;
	import snowwar._Str_448.StartLobbyCounterEvent;
	import snowwar._Str_448.SnowStormUnusedAlertGenericEvent;
	import snowwar._Str_448.SnowStormLongDataEvent;
	import snowwar._Str_448.SnowStormGameEndedEvent;
	import snowwar._Str_448.SnowStormGenericErrorEvent;
	import snowwar._Str_448.SnowStormQuePlayerAddedEvent;
	import snowwar._Str_448.SnowStormPlayAgainEvent;
	import snowwar._Str_448.SnowStormGamesLeftEvent;
	import snowwar._Str_448.SnowStormQuePlayerRemovedEvent;
	import snowwar._Str_448.SnowStormGamesInformationEvent;
	import snowwar._Str_448.SnowStormLongData2Event;
	import snowwar._Str_451.SnowStormGamesLeftParser;
	import snowwar._Str_451.SnowStormGameStartedParser;
	import snowwar._Str_451.SnowStormQuePositionParser;
	import snowwar._Str_451.SnowStormStartBlockTickerParser;
	import snowwar._Str_451.StartLobbyCounterParser;
	import snowwar._Str_451.SnowStormLongDataParser;
	import snowwar._Str_451.SnowStormGenericErrorParser;
	import snowwar._Str_451.SnowStormQuePlayerAddedParser;
	import snowwar._Str_451.SnowStormQuePlayerRemovedParser;
	import snowwar._Str_451.SnowStormGamesInformationParser;
	import snowwar._Str_451.SnowStormLongData2Parser;
	import snowwar._Str_512.SnowStormGameStatusParser;
	import snowwar._Str_512.SnowStormFullGameStatusParser;
	import snowwar._Str_277.SnowStormUserChatMessageParser;
	import snowwar._Str_377._SafeStr_4679;
	import snowwar._Str_377._SafeStr_4680;
	import snowwar._Str_377._SafeStr_4681;
	import snowwar._Str_377._SafeStr_4686;
	import snowwar._Str_377._SafeStr_4687;
	import snowwar._Str_377._SafeStr_4688;
	import snowwar._Str_377._SafeStr_4689;
	import snowwar._Str_377._SafeStr_4691;
	import snowwar._Str_39._SafeStr_4670;
	import snowwar._Str_400._SafeStr_3624;
	import snowwar._Str_427._SafeStr_4021;
	import snowwar._Str_427._SafeStr_4676;
	import snowwar._Str_427._SafeStr_4678;
	import snowwar._Str_427._SafeStr_4682;
	import snowwar._Str_427._SafeStr_4683;
	import snowwar._Str_427._SafeStr_4684;
	import snowwar._Str_427._SafeStr_4685;
	import snowwar._Str_427._SafeStr_4693;
	import snowwar._Str_496.Game2PlayerData;
	import snowwar._Str_496._SafeStr_3610;
	import snowwar._Str_496._SafeStr_4018;
	import snowwar._Str_496._SafeStr_4690;
	import snowwar._Str_496._SafeStr_4692;
	import snowwar._Str_62.SnowWarGameObjectData;
	import snowwar._Str_62.HumanGameObjectData;
	import snowwar._Str_62._SafeStr_3584;
	import snowwar._Str_62._SafeStr_3585;
	import snowwar._Str_62._SafeStr_3586;
	import snowwar._Str_62._SafeStr_3587;

    public class IncomingMessages implements IDisposable 
    {
        private var _snowWarEngine:SnowWarEngine;
        private var _disposed:Boolean = false;

        public function IncomingMessages(k:SnowWarEngine)
        {
            this._snowWarEngine = k;
            var _local_2:IHabboCommunicationManager = this._snowWarEngine.communication;
            _local_2.addHabboConnectionMessageEvent(new _Str_8191(this._SafeStr_18914));
            _local_2.addHabboConnectionMessageEvent(new SnowStormIntializedPlayersEvent(this._SafeStr_18915));
            _local_2.addHabboConnectionMessageEvent(new SnowStormOnStageStartEvent(this._SafeStr_18916));
            _local_2.addHabboConnectionMessageEvent(new SnowStormLevelDataEvent(this._SafeStr_18917));
            _local_2.addHabboConnectionMessageEvent(new _Str_8022(this._SafeStr_18918));
            _local_2.addHabboConnectionMessageEvent(new SnowStormQuePositionEvent(this._SafeStr_18919));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGameEndedEvent(this._SafeStr_18920));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGamesLeftEvent(this._SafeStr_13119));
            _local_2.addHabboConnectionMessageEvent(new SnowStormOnStageRunningEvent(this._SafeStr_18921));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_3669(this._SafeStr_18922));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGameStatusEvent(this._SafeStr_18518));
            _local_2.addHabboConnectionMessageEvent(new SnowStormIntializeGameArenaViewEvent(this._SafeStr_18923));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGenericErrorEvent(this._SafeStr_18924));
            _local_2.addHabboConnectionMessageEvent(new SnowStormRejoinPreviousRoomEvent(this._SafeStr_18925));
            _local_2.addHabboConnectionMessageEvent(new SnowStormLongDataEvent(this._SafeStr_18926));
            _local_2.addHabboConnectionMessageEvent(new _Str_3492(this._SafeStr_18927));
            _local_2.addHabboConnectionMessageEvent(new SnowStormOnStageEndingEvent(this._SafeStr_18928));
            _local_2.addHabboConnectionMessageEvent(new SnowStormOnPlayerExitedArenaEvent(this._SafeStr_18929));
            _local_2.addHabboConnectionMessageEvent(new SnowStormUnusedAlertGenericEvent(this._SafeStr_18930));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGameStartedEvent(this._SafeStr_10644));
            _local_2.addHabboConnectionMessageEvent(new SnowStormPlayAgainEvent(this._SafeStr_18931));
            _local_2.addHabboConnectionMessageEvent(new SnowStormStartBlockTickerEvent(this._SafeStr_18932));
            _local_2.addHabboConnectionMessageEvent(new _Str_18356(this._SafeStr_18933));
            _local_2.addHabboConnectionMessageEvent(new SnowStormUserChatMessageEvent(this._SafeStr_18934));
            _local_2.addHabboConnectionMessageEvent(new SnowStormLongData2Event(this._SafeStr_18935));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGenericErrorEvent(this._SafeStr_18936));
            _local_2.addHabboConnectionMessageEvent(new SnowStormOnGameEndingEvent(this._SafeStr_18937));
            _local_2.addHabboConnectionMessageEvent(new SnowStormGamesInformationEvent(this._SafeStr_18938));
            _local_2.addHabboConnectionMessageEvent(new SnowStormQuePlayerRemovedEvent(this._SafeStr_18939));
            _local_2.addHabboConnectionMessageEvent(new StartLobbyCounterEvent(this._SafeStr_18940));
            _local_2.addHabboConnectionMessageEvent(new _Str_5142(this._SafeStr_18941));
            _local_2.addHabboConnectionMessageEvent(new SnowStormUserRematchedEvent(this._SafeStr_18942));
            _local_2.addHabboConnectionMessageEvent(new SnowStormFullGameStatusEvent(this._SafeStr_18943));
            _local_2.addHabboConnectionMessageEvent(new SnowStormQuePlayerAddedEvent(this._SafeStr_18944));
            //_local_2.addHabboConnectionMessageEvent(new _SafeStr_1440(this._SafeStr_6336));
        }

        public function dispose():void
        {
            this._snowWarEngine = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _SafeStr_18917(k:SnowStormLevelDataEvent):void
        {
            var _local_2:SnowStormLevelDataParser = k.getParser();
            this._snowWarEngine.initializeGameArena(_local_2._SafeStr_12658, _local_2.fieldName, _local_2._SafeStr_13274, _local_2._SafeStr_13266);
            var _local_3:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_4:SynchronizedGameStage = _local_3.synchronizedGameStage();
            _local_4.initialize(this._snowWarEngine.synchronizedGameArena, _local_2._SafeStr_18958);
            this._snowWarEngine.gameMainViewController.close(false);
        }

        private function _SafeStr_18924(k:SnowStormGenericErrorEvent):void
        {
            var _local_2:SnowStormGenericErrorParser = k.getParser();
            var _local_3:String = "snowwar.error.generic";
            switch (_local_2.reason)
            {
                case SnowStormGenericErrorParser2._SafeStr_18959:
                    _local_3 = "snowwar.error.game_already_started";
                    break;
                case SnowStormGenericErrorParser2._SafeStr_21884:
                    _local_3 = "snowwar.error.no_free_games_left";
                    break;
                case SnowStormGenericErrorParser2._SafeStr_21885:
                    _local_3 = "snowwar.error.dulicate_machineid";
                    break;
                case SnowStormGenericErrorParser2._SafeStr_21886:
                    _local_3 = "snowwar.error.has_active_instance";
                    break;
            }
            this._snowWarEngine.alert((("${" + _local_3) + "}"));
        }

        private function _SafeStr_18922(k:_SafeStr_3669):void
        {
            var _local_2:_SafeStr_4568 = k.getParser();
            var _local_3:Game2PlayerData = _local_2.player;
        }

        private function _SafeStr_18923(k:SnowStormIntializeGameArenaViewEvent):void
        {
            var _local_2:SnowStormIntializeGameArenaViewParser = k.getParser();
            this._snowWarEngine.initializeGameArenaView();
        }

        private function _SafeStr_18915(k:SnowStormIntializedPlayersEvent):void
        {
            var _local_2:SnowStormIntializedPlayersParser = k.getParser();
            this._snowWarEngine.playersInitialized(_local_2._SafeStr_18960, _local_2._SafeStr_18961);
        }

        private function _SafeStr_18916(k:SnowStormOnStageStartEvent):void
        {
            var _local_2:SnowStormOnStageStartParser = k.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On stage start: " + _local_2._SafeStr_12659));
            var _local_3:_SafeStr_3610 = _local_2._SafeStr_7508;
            this._SafeStr_18945(_local_3);
            this._snowWarEngine.onStageStart(_local_2._SafeStr_12659);
        }

        private function _SafeStr_18921(k:SnowStormOnStageRunningEvent):void
        {
            var _local_2:SnowStormOnStageRunningParser = k.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On stage running: " + _local_2.time));
            this._snowWarEngine.onStageRunning(_local_2.time);
        }

        private function _SafeStr_18928(k:SnowStormOnStageEndingEvent):void
        {
            var _local_2:SnowStormOnStageEndingParser = k.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On stage ending: " + _local_2._SafeStr_18963));
            if (_local_2._SafeStr_18963 == 0)
            {
                this._snowWarEngine.onStageEnding();
            }
        }

        private function _SafeStr_18937(k:SnowStormOnGameEndingEvent):void
        {
            var _local_2:SnowStormOnGameEndingParser = k.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On game ending: " + _local_2._SafeStr_18963));
            this._snowWarEngine.onGameEnding(_local_2._SafeStr_18963, _local_2._SafeStr_18964, _local_2._SafeStr_18965, _local_2._SafeStr_18966);
        }

        private function _SafeStr_18929(k:SnowStormOnPlayerExitedArenaEvent):void
        {
            var _local_2:SnowStormOnPlayerExitedArenaParser = k.getParser();
            HabboGamesCom.log(((("[HabbosnowWarEngine] On player exited arena. userId:" + _local_2.userId) + " gameObjectId:") + _local_2._SafeStr_18967));
        }

        private function _SafeStr_18925(k:SnowStormRejoinPreviousRoomEvent):void
        {
            var _local_2:SnowStormRejoinPreviousRoomParser = k.getParser();
            HabboGamesCom.log(("Rejoin game! Room Before game: " + _local_2.rejoinRoom));
            this._snowWarEngine.setRejoinRoom(_local_2.rejoinRoom);
        }

        private function _SafeStr_18942(k:SnowStormUserRematchedEvent):void
        {
            var _local_2:SnowStormUserRematchedParser = k.getParser();
            HabboGamesCom.log((("User " + _local_2.userId) + " rematches"));
            this._snowWarEngine.rematchPlayer(_local_2.userId);
        }

        private function _SafeStr_18938(k:SnowStormGamesInformationEvent):void
        {
            var _local_2:SnowStormGamesInformationParser = k.getParser();
            if (_local_2.status == SnowStormGamesInformationParser._SafeStr_18968)
            {
                this._snowWarEngine.gameMainViewController._SafeStr_18778(_local_2.timeTillNextGame);
                this._snowWarEngine._SafeStr_13229 = _local_2.userId;
                this._snowWarEngine._SafeStr_13182(true);
                this._snowWarEngine._SafeStr_13221(HabboGames._SafeStr_7697, _local_2.infiniteGames, _local_2.gamesLeft);
            }
            else
            {
                this._snowWarEngine._SafeStr_13182(false);
                HabboGamesCom.log(("Game directory not available, status:" + _local_2.status));
            }
        }

        private function _SafeStr_13119(k:SnowStormGamesLeftEvent):void
        {
            var _local_2:SnowStormGamesLeftParser = k.getParser();
            HabboGamesCom.log(((("FREE GAMES LEFT: " + _local_2._SafeStr_13224) + " OR HAS UNLIMITED GAMES: ") + _local_2._SafeStr_13223));
            this._snowWarEngine._SafeStr_13221(_local_2.gameTypeId, _local_2._SafeStr_13223, _local_2._SafeStr_13224);
        }

        private function _SafeStr_18926(k:SnowStormLongDataEvent):void
        {
            var _local_2:SnowStormLongDataParser = k.getParser();
            var _local_3:_SafeStr_4018 = _local_2._SafeStr_18970;
            this._snowWarEngine.onLongDataReceived(_local_3);
        }

        private function _SafeStr_10644(k:SnowStormGameStartedEvent):void
        {
            var _local_2:SnowStormGameStartedParser = k.getParser();
            HabboGamesCom.log("Game started!");
			try
			{
				this._snowWarEngine.onGameStart(_local_2._SafeStr_18971);
			}
			catch (e:Error)
			{
				HabboGamesCom.log(e.getStackTrace());
			}
        }

        private function _SafeStr_18940(k:StartLobbyCounterEvent):void
        {
            var _local_2:StartLobbyCounterParser = k.getParser();
            HabboGamesCom.log(("Start Lobby Counter: " + _local_2._SafeStr_18972));
            this._snowWarEngine.onStartLobbyCounter(_local_2._SafeStr_18972);
        }

        private function _SafeStr_18931(k:SnowStormPlayAgainEvent):void
        {
            this._snowWarEngine._SafeStr_13217();
        }

        private function _SafeStr_18920(k:SnowStormGameEndedEvent):void
        {
            this._snowWarEngine._SafeStr_13222(false);
        }

        private function _SafeStr_18919(k:SnowStormQuePositionEvent):void
        {
            var _local_2:SnowStormQuePositionParser = k.getParser();
            if (this._snowWarEngine.gameLobbyViewController)
            {
                this._snowWarEngine.gameLobbyViewController._SafeStr_18591 = _local_2.position;
            }
        }

        private function _SafeStr_18944(k:SnowStormQuePlayerAddedEvent):void
        {
            var _local_2:SnowStormQuePlayerAddedParser = k.getParser();
            this._snowWarEngine._SafeStr_13219(_local_2.user);
        }

        private function _SafeStr_18939(k:SnowStormQuePlayerRemovedEvent):void
        {
            var _local_2:SnowStormQuePlayerRemovedParser = k.getParser();
            this._snowWarEngine._SafeStr_13220(_local_2.userId);
        }

        private function _SafeStr_18935(k:SnowStormLongData2Event):void
        {
            var _local_2:SnowStormLongData2Parser = k.getParser();
            var _local_3:_SafeStr_4018 = _local_2._SafeStr_18970;
            HabboGamesCom.log(("Long data received: " + [_local_3.fieldName, _local_3._SafeStr_13274, _local_3._SafeStr_13275]));
            this._snowWarEngine.onLongDataReceived(_local_3);
        }

        private function _SafeStr_18936(k:SnowStormGenericErrorEvent):void
        {
            var _local_2:SnowStormGenericErrorParser = k.getParser();
            var errorCode:String = "snowwar.error.generic";
            switch (_local_2.reason)
            {
                case SnowStormGenericErrorParser._SafeStr_18973:
                case SnowStormGenericErrorParser._SafeStr_18974:
                    errorCode = "snowwar.error.has_active_instance";
                    break;
                case SnowStormGenericErrorParser._SafeStr_18975:
                    errorCode = "snowwar.error.no_free_games_left";
                    break;
                case SnowStormGenericErrorParser._SafeStr_13125:
                    errorCode = "snowwar.error.duplicate_machineid";
                    break;
            }
            this._snowWarEngine.alert((("${" + errorCode) + "}"));
        }

        private function _SafeStr_18930(k:SnowStormUnusedAlertGenericEvent):void
        {
            this._snowWarEngine.alert("${snowwar.error.generic}");
        }

        private function _SafeStr_18932(k:SnowStormStartBlockTickerEvent):void
        {
            var _local_2:SnowStormStartBlockTickerParser = k.getParser();
            this._snowWarEngine.gameMainViewController._SafeStr_18778(_local_2._SafeStr_18976);
        }

        private function _SafeStr_18943(k:SnowStormFullGameStatusEvent):void
        {
            var _local_5:_SafeStr_4692;
            var _local_2:SnowStormFullGameStatusParser = k.getParser();
            var gameArena:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            HabboGamesCom.log("On full game status: ");
            var _local_4:_SafeStr_4690 = _local_2._SafeStr_18977;
            (gameArena.synchronizedGameStage() as SnowWarGameStage).removeGameObjects();
            this._SafeStr_18945(_local_4._SafeStr_7508);
            if (gameArena)
            {
                _local_5 = _local_4._SafeStr_18978;
                gameArena.newTurn(_local_5.turn, _local_5.checksum);
                this._SafeStr_18946(_local_5, true);
            }
        }

        private function _SafeStr_18518(k:SnowStormGameStatusEvent):void
        {
            var _local_2:SnowStormGameStatusParser = k.getParser();
            HabboGamesCom.log("[HabbosnowWarEngine] On game status: ");
            this._SafeStr_18946(_local_2.status);
        }

        private function _SafeStr_18945(k:_SafeStr_3610):void
        {
            var _local_3:SnowWarGameStage;
            var _local_4:SnowWarGameObjectData;
            var _local_5:HumanGameObjectData;
            var _local_6:Boolean;
            var _local_7:HumanGameObject;
            var _local_8:_SafeStr_3587;
            var _local_9:_SafeStr_4035;
            var _local_10:HumanGameObject;
            var _local_11:_SafeStr_3585;
            var _local_12:_SafeStr_4672;
            var _local_13:_SafeStr_3586;
            var _local_14:_SafeStr_4671;
            var _local_15:_SafeStr_3584;
            var _local_16:TreeGameObject;
            var _local_17:HumanGameObject;
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            if (!_local_2)
            {
                return;
            }
            _local_3 = (_local_2.synchronizedGameStage() as SnowWarGameStage);
            _local_3._SafeStr_18709();
            for each (_local_4 in k._SafeStr_7508)
            {
                switch (_local_4.type)
                {
                    case SnowWarGameObjectData.OBJECT_TYPE_HUMAN:
                        _local_5 = (_local_4 as HumanGameObjectData);
                        _local_6 = (_local_5.name == this._snowWarEngine.sessionDataManager.userName);
                        if (_local_6)
                        {
                            this._snowWarEngine.gamePlayerId = _local_5.id;
                        }
                        _local_7 = new HumanGameObject(_local_3, _local_5, false, this._snowWarEngine);
                        _local_3.addActiveGameObject(_local_7._SafeStr_13236, _local_7);
                        _local_7._SafeStr_18745 = _SafeStr_2308.ANY;
                        if (((_local_6) && (this._snowWarEngine.ghostEnabled)))
                        {
                            if (this._snowWarEngine.ghostVisualizationEnabled)
                            {
                                _local_7._SafeStr_18745 = _SafeStr_4674._SafeStr_10198;
                            }
                            else
                            {
                                _local_7._SafeStr_18745 = _SafeStr_4674._SafeStr_7300;
                            }
                            if (this._snowWarEngine.synchronizedGameArena.synchronizedGameStage().getGameObject(_local_7._SafeStr_13241) == null)
                            {
                                _local_17 = new HumanGameObject(_local_3, _local_5, true, this._snowWarEngine);
                                _local_17._SafeStr_13236 = _local_7._SafeStr_13241;
                                _local_3.addActiveGameObject(_local_17._SafeStr_13236, _local_17);
                            }
                        }
                        HabboGamesCom.log(((((("human id:" + _local_5.id) + " x:") + _local_5.x) + " y:") + _local_5.y));
                        break;
                    case SnowWarGameObjectData.OBJECT_TYPE_SNOWBALL:
                        _local_8 = (_local_4 as _SafeStr_3587);
                        _local_9 = new _SafeStr_4035(_local_8.id);
                        _local_10 = (_local_3.getGameObject(_local_8._SafeStr_18040) as HumanGameObject);
                        _local_9._SafeStr_18982(_local_8, _local_10);
                        _local_3.addActiveGameObject(_local_9._SafeStr_13236, _local_9);
                        HabboGamesCom.log(((("snowball x:" + _local_8.x) + " y:") + _local_8.y));
                        break;
                    case SnowWarGameObjectData.OBJECT_TYPE_SNOWBALL_MACHINE:
                        _local_11 = (_local_4 as _SafeStr_3585);
                        _local_12 = new _SafeStr_4672(_local_11, _local_3);
                        _local_3.addActiveGameObject(_local_11.id, _local_12);
                        HabboGamesCom.log(("machine id:" + _local_11.id));
                        break;
                    case SnowWarGameObjectData.OBJECT_TYPE_SNOWBALL_PILE:
                        _local_13 = (_local_4 as _SafeStr_3586);
                        _local_14 = new _SafeStr_4671(_local_13, _local_3);
                        _local_3.addActiveGameObject(_local_13.id, _local_14);
                        HabboGamesCom.log(("pile id:" + _local_13.id));
                        break;
                    case SnowWarGameObjectData.OBJECT_TYPE_TREE:
                        _local_15 = (_local_4 as _SafeStr_3584);
                        _local_16 = new TreeGameObject(_local_15, _local_3);
                        _local_3.addActiveGameObject(_local_16._SafeStr_13236, _local_16);
                        HabboGamesCom.log(("tree id:" + _local_16._SafeStr_13236));
                        break;
                    default:
                        HabboGamesCom.log(("Unkonwn game-object:" + _local_4.type));
                }
            }
        }

        private function _SafeStr_18946(status:_SafeStr_4692, _arg_2:Boolean=false):void
        {
            var subturn:int;
            var _local_7:int;
            var eventsList:Array;
            var event:_SafeStr_4677;
            var userEvent:_SafeStr_4019;
            var targetEvent:_SafeStr_4019;
            var events:Map = (status.events as Map);
            var gameArena:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            if (!gameArena)
            {
                return;
            }
            var turn:int = status.turn;
            for each (subturn in events.getKeys())
            {
                eventsList = (events.getValue(subturn) as Array);
                for each (event in eventsList)
                {
                    switch (event.id)
                    {
                        case _SafeStr_4677._SafeStr_18983:
                            userEvent = this._SafeStr_18952((event as _SafeStr_4687));
                            break;
                        case _SafeStr_4677._SafeStr_18984:
                            userEvent = this._SafeStr_18947((event as _SafeStr_4686));
                            break;
                        case _SafeStr_4677._SafeStr_18985:
                            userEvent = this._SafeStr_18951((event as _SafeStr_4681));
                            targetEvent = this._SafeStr_18957((event as _SafeStr_4681));
                            break;
                        case _SafeStr_4677._SafeStr_18986:
                            userEvent = this._SafeStr_18948((event as _SafeStr_4679));
                            break;
                        case _SafeStr_4677._SafeStr_18987:
                            userEvent = this._SafeStr_18953((event as _SafeStr_4689)); //Event 2: PlayerMoveEvent
                            break;
                        case _SafeStr_4677._SafeStr_18988:
                            userEvent = this._SafeStr_18950((event as _SafeStr_4691)); //Event 3: ThrowBallToPlayerEvent
                            targetEvent = this._SafeStr_18956((event as _SafeStr_4691)); //Event 3:
                            break;
                        case _SafeStr_4677._SafeStr_18989:
                            userEvent = this._SafeStr_18949((event as _SafeStr_4688)); //Event 4: 
                            targetEvent = this._SafeStr_18955((event as _SafeStr_4688));
                            break;
                        case _SafeStr_4677._SafeStr_18990:
                            userEvent = this._SafeStr_18954((event as _SafeStr_4680)); //Event 1: RemovePlayerEvent
                            break;
                        default:
                            HabboGamesCom.log(("Unknown event id " + event.id));
                    }
                    if (userEvent)
                    {
                        gameArena.addGameEvent((turn + 1), subturn, userEvent);
                    }
                    if (targetEvent)
                    {
                        gameArena.addGameEvent((turn + 1), subturn, targetEvent);
                    }
                }
            }
            _local_7 = status.checksum;
            this._snowWarEngine._SafeStr_13198(turn, _local_7, _arg_2);
        }

        private function _SafeStr_18947(k:_SafeStr_4686):_SafeStr_4684
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            var _local_5:_SafeStr_4670 = (_local_3.getGameObject(k._SafeStr_18992) as _SafeStr_4670);
            return new _SafeStr_4684(_local_4, _local_5);
        }

        private function _SafeStr_18948(k:_SafeStr_4679):_SafeStr_4682
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:_SafeStr_4672 = (_local_3.getGameObject(k._SafeStr_18992) as _SafeStr_4672);
            return new _SafeStr_4682(_local_4);
        }

        private function _SafeStr_18949(k:_SafeStr_4688):_SafeStr_4693 //Event 4 (USER): 
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            return new _SafeStr_4693(_local_4, k.targetX, k._SafeStr_16005, k._SafeStr_18038);
        }

        private function _SafeStr_18950(k:_SafeStr_4691):_SafeStr_4683 //Event 3 (USER): ThrowBallToPlayerEvent
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            var _local_5:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18993) as HumanGameObject);
            return new _SafeStr_4683(_local_4, _local_5, k._SafeStr_18038);
        }

        private function _SafeStr_18951(k:_SafeStr_4681):_SafeStr_4676
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            return new _SafeStr_4676(_local_4);
        }

        private function _SafeStr_18952(k:_SafeStr_4687):_SafeStr_4685
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            return new _SafeStr_4685(k._SafeStr_18994, _local_4, k.targetX, k._SafeStr_16005, k._SafeStr_18038);
        }

        private function _SafeStr_18953(k:_SafeStr_4689):_SafeStr_4021
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            return new _SafeStr_4021(_local_4, k.x, k.y);
        }

        private function _SafeStr_18954(k:_SafeStr_4680):_SafeStr_4678 //Event 1: RemovePlayerEvent
        {
            var _local_2:SynchronizedGameArena = this._snowWarEngine.synchronizedGameArena;
            var _local_3:SynchronizedGameStage = _local_2.synchronizedGameStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
            return new _SafeStr_4678(_local_4);
        }

        private function _SafeStr_18955(k:_SafeStr_4688):_SafeStr_4693 //Event 4: 
        {
            var _local_2:SynchronizedGameArena;
            var _local_3:SynchronizedGameStage;
            if (this._snowWarEngine.ghostEnabled)
            {
                _local_2 = this._snowWarEngine.synchronizedGameArena;
                _local_3 = _local_2.synchronizedGameStage();
                if (k._SafeStr_18991 == this._snowWarEngine.gamePlayerId)
                {
                    return new _SafeStr_4693(this._snowWarEngine._SafeStr_13190(), k.targetX, k._SafeStr_16005, k._SafeStr_18038);
                }
            }
            return null;
        }

        private function _SafeStr_18956(k:_SafeStr_4691):_SafeStr_4683 //Event 3 (TARGET): ThrowBallToPlayerEvent
        {
            var _local_2:SynchronizedGameArena;
            var _local_3:SynchronizedGameStage;
            var _local_4:HumanGameObject;
            if (this._snowWarEngine.ghostEnabled)
            {
                _local_2 = this._snowWarEngine.synchronizedGameArena;
                _local_3 = _local_2.synchronizedGameStage();
                _local_4 = (_local_3.getGameObject(k._SafeStr_18993) as HumanGameObject);
                if (k._SafeStr_18991 == this._snowWarEngine.gamePlayerId)
                {
                    return new _SafeStr_4683(this._snowWarEngine._SafeStr_13190(), _local_4, k._SafeStr_18038);
                }
            }
            return null;
        }

        private function _SafeStr_18957(k:_SafeStr_4681):_SafeStr_4676
        {
            var _local_2:SynchronizedGameArena;
            var _local_3:SynchronizedGameStage;
            var _local_4:HumanGameObject;
            if (this._snowWarEngine.ghostEnabled)
            {
                _local_2 = this._snowWarEngine.synchronizedGameArena;
                _local_3 = _local_2.synchronizedGameStage();
                _local_4 = (_local_3.getGameObject(k._SafeStr_18991) as HumanGameObject);
                if (k._SafeStr_18991 == this._snowWarEngine.gamePlayerId)
                {
                    return new _SafeStr_4676(this._snowWarEngine._SafeStr_13190());
                }
            }
            return null;
        }

        private function _SafeStr_18934(k:SnowStormUserChatMessageEvent):void
        {
            var _local_2:SnowStormUserChatMessageParser = k.getParser();
            this._snowWarEngine._SafeStr_13216(_local_2.userId, _local_2._SafeStr_18212);
        }

        private function _SafeStr_18927(k:_Str_3492):void
        {
            if (this._snowWarEngine != null)
            {
                this._snowWarEngine.send(new _SafeStr_3624(HabboGames._SafeStr_7697));
                if (!this._snowWarEngine.gameCenterEnabled)
                {
                    this._snowWarEngine.gameMainViewController.createAndVisible(false);
                }
            }
        }

        /* //Could not find assigned incoming message for this. Seems to have been removed.
		 * private function _SafeStr_6336(k:_SafeStr_1440):void
        {
            this._snowWarEngine._SafeStr_7663();
        }*/

        private function _SafeStr_18933(k:_Str_18356):void
        {
            var _local_2:_Str_4574 = k.getParser();
            if (this._snowWarEngine.leaderboard)
            {
                this._snowWarEngine.leaderboard._SafeStr_18636(_local_2.leaderboard, _local_2._Str_26158);
            }
        }

        private function _SafeStr_18941(k:_Str_5142):void
        {
            var _local_2:_Str_4574 = k.getParser();
            if (this._snowWarEngine.leaderboard)
            {
                this._snowWarEngine.leaderboard._SafeStr_18634(_local_2.leaderboard, _local_2._Str_26158);
            }
        }

        private function _SafeStr_18918(k:_Str_8022):void
        {
            var _local_2:Game2WeeklyLeaderboardParser = k.getParser();
            if (this._snowWarEngine.leaderboard)
            {
                this._snowWarEngine.leaderboard._SafeStr_18635(_local_2.year, _local_2.week, _local_2.leaderboard, _local_2._Str_26158, _local_2.maxOffset, _local_2.minutesUntilReset);
            }
        }

        private function _SafeStr_18914(k:_Str_8191):void
        {
            var _local_2:Game2WeeklyLeaderboardParser = k.getParser();
            if (this._snowWarEngine.leaderboard)
            {
                this._snowWarEngine.leaderboard._SafeStr_18637(_local_2.year, _local_2.week, _local_2.leaderboard, _local_2._Str_26158, _local_2.maxOffset, _local_2.minutesUntilReset);
            }
        }
    }
}
