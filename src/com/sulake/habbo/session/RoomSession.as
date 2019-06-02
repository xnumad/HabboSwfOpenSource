package com.sulake.habbo.session
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_2817;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_5756;
    import com.sulake.habbo.communication.messages.outgoing._Str_465._Str_12300;
    import com.sulake.habbo.communication.messages.outgoing.room.chat._Str_7738;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_11637;
    import com.sulake.habbo.communication.messages.outgoing.room.chat._Str_12180;
    import com.sulake.habbo.communication.messages.outgoing.room.chat._Str_10169;
    import com.sulake.habbo.communication.messages.outgoing.room.chat._Str_9917;
    import com.sulake.habbo.communication.messages.outgoing.room.chat._Str_10643;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_9976;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_11695;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_11206;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_10078;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10673;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10141;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10243;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11262;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_9899;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10045;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.poll._Str_11290;
    import com.sulake.habbo.communication.messages.outgoing.poll._Str_12165;
    import com.sulake.habbo.communication.messages.outgoing.poll.PollAnswerComposer;
    import com.sulake.habbo.communication.messages.outgoing._Str_495._Str_9884;
    import com.sulake.habbo.communication.messages.outgoing._Str_495._Str_9928;
    import com.sulake.habbo.communication.messages.outgoing.friendlist._Str_10757;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_10514;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_9893;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_11568;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_11259;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_7856;
    import com.sulake.habbo.communication.messages.outgoing.room.action.RemoveRightsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action._Str_10476;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10764;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_7691;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_12318;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_12394;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10983;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10547;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10852;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10067;
    import com.sulake.habbo.communication.messages.outgoing._Str_381._Str_10642;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.habbo.communication.messages.outgoing._Str_428._Str_10856;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_3719;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_10314;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_8017;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
	import com.sulake.habbo.ui.widget.infobuspolls.VotePollCounterMessageComposer;

    public class RoomSession implements IRoomSession 
    {
        private const _Str_23360:int = 2500;

        private var _connection:IConnection;
        private var _roomId:int = 0;
        private var _password:String = "";
        private var _roomResources:String = "";
        private var _openConnectionComposer:IMessageComposer = null;
        private var _state:String = "RSE_CREATED";
        private var _userDataManager:UserDataManager;
        private var _ownUserRoomId:int = -1;
        private var _isRoomOwner:Boolean = false;
        private var _roomControllerLevel:int = 0;
        private var _tradeMode:int = 0;
        private var _isGuildRoom:Boolean = false;
        private var _isSpectatorMode:Boolean = false;
        private var _arePetsAllowed:Boolean = false;
        private var _doorMode:int;
        private var _messageLagTrackingMap:Map;
        private var _chatTrackingId:int = 0;
        private var _habboTracking:IHabboTracking = null;
        private var _isUserDecorating:Boolean = false;
        private var _isGameSession:Boolean = false;
        private var _nuxNotComplete:Boolean = false;
        private var _roomModerationSettings:_Str_2817 = null;

        public function RoomSession()
        {
            this._messageLagTrackingMap = new Map();
            super();
            this._userDataManager = new UserDataManager();
        }

        public function set connection(k:IConnection):void
        {
            if (k == null)
            {
                return;
            }
            this._connection = k;
            if (this._userDataManager != null)
            {
                this._userDataManager.connection = k;
            }
        }

        public function dispose():void
        {
            this._connection = null;
            if (this._userDataManager != null)
            {
                this._userDataManager.dispose();
                this._userDataManager = null;
            }
            if (this._messageLagTrackingMap != null)
            {
                this._messageLagTrackingMap.dispose();
                this._messageLagTrackingMap = null;
            }
            if (this._openConnectionComposer)
            {
                this._openConnectionComposer.dispose();
                this._openConnectionComposer = null;
            }
            if (this._roomModerationSettings != null)
            {
                this._roomModerationSettings = null;
            }
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function set roomId(k:int):void
        {
            this._roomId = k;
        }

        public function get _Str_18062():String
        {
            return this._password;
        }

        public function set _Str_18062(k:String):void
        {
            this._password = k;
        }

        public function get _Str_17752():String
        {
            return this._roomResources;
        }

        public function set _Str_17752(k:String):void
        {
            this._roomResources = k;
        }

        public function get _Str_21443():IMessageComposer
        {
            return this._openConnectionComposer;
        }

        public function set _Str_21443(k:IMessageComposer):void
        {
            this._openConnectionComposer = k;
        }

        public function get state():String
        {
            return this._state;
        }

        public function get habboTracking():IHabboTracking
        {
            return this._habboTracking;
        }

        public function set habboTracking(k:IHabboTracking):void
        {
            this._habboTracking = k;
        }

        public function get isGameSession():Boolean
        {
            return this._isGameSession;
        }

        public function set isGameSession(k:Boolean):void
        {
            this._isGameSession = k;
        }

        public function get _Str_4418():_Str_2817
        {
            return this._roomModerationSettings;
        }

        public function set _Str_4418(k:_Str_2817):void
        {
            this._roomModerationSettings = k;
        }

        public function start():Boolean
        {
            if (((this._state == RoomSessionEvent.CREATED) && (!(this._connection == null))))
            {
                this._state = RoomSessionEvent.STARTED;
                if (this._openConnectionComposer)
                {
                    return this.sendPredefinedOpenConnection();
                }
                return this.sendOpenFlatConnectionMessage();
            }
            return false;
        }

        public function reset(k:int):void
        {
            if (k != this._roomId)
            {
                this._roomId = k;
                this._isRoomOwner = false;
                this._roomControllerLevel = RoomControllerLevel.NONE;
                this._tradeMode = RoomTradingLevelEnum._Str_12752;
                this._isSpectatorMode = false;
            }
        }

        private function sendOpenFlatConnectionMessage():Boolean
        {
            if (this._connection == null)
            {
                return false;
            }
            this._connection.send(new _Str_5756(this._roomId, this._password));
            return true;
        }

        private function sendPredefinedOpenConnection():Boolean
        {
            if (this._connection == null)
            {
                return false;
            }
            this._connection.send(this._openConnectionComposer);
            this._openConnectionComposer = null;
            return true;
        }

        public function _Str_17917(k:String, _arg_2:int=0):void
        {
            if (this._isGameSession)
            {
                this._connection.send(new _Str_12300(k));
            }
            else
            {
                k = k.replace(/&#[0-9]+;/g, "");
                this._connection.send(new _Str_7738(k, _arg_2, this._chatTrackingId));
                this._messageLagTrackingMap.add(this._chatTrackingId, getTimer());
                this._chatTrackingId++;
            }
        }

        public function _Str_22140(k:String):void
        {
            this._connection.send(new _Str_11637(k));
        }

        public function _Str_20236(k:int):void
        {
            var _local_3:int;
            var _local_2:Object = this._messageLagTrackingMap.remove(k);
            if (_local_2 != null)
            {
                _local_3 = getTimer();
                if ((_local_3 - int(_local_2)) > this._Str_23360)
                {
                    if (this._habboTracking != null)
                    {
                        this._habboTracking._Str_13181(_local_3);
                    }
                }
            }
        }

        public function _Str_21231(k:String, _arg_2:int=0):void
        {
            this._connection.send(new _Str_12180(k, _arg_2));
        }

        public function _Str_19359(k:String, _arg_2:String, _arg_3:int=0):void
        {
            this._connection.send(new _Str_10169(k, _arg_2, _arg_3));
        }

        public function _Str_21148(k:Boolean):void
        {
            if (k)
            {
                this._connection.send(new _Str_9917());
            }
            else
            {
                this._connection.send(new _Str_10643());
            }
        }

        public function _Str_5941(k:int):void
        {
            this._connection.send(new _Str_9976(k));
        }

        public function _Str_16233(k:int):void
        {
            if (((k >= 0) && (k <= 17)))
            {
                this._connection.send(new _Str_11695(k));
            }
        }

        public function _Str_20495(k:int):void
        {
            this._connection.send(new _Str_11206(k));
        }

        public function _Str_18552(k:int):void
        {
            this._connection.send(new _Str_10078(k));
        }

        public function _Str_22199(k:int):void
        {
            this._connection.send(new _Str_10673(k));
        }

        public function _Str_17139(k:int):void
        {
            this._connection.send(new _Str_10141(k));
        }

        public function _Str_20560(k:int, _arg_2:String):void
        {
            this._connection.send(new _Str_10243(k, _arg_2));
        }

        public function _Str_21175():void
        {
            this._connection.send(new _Str_11262());
        }

        public function _Str_21317(k:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:String = ("000000" + _arg_3.toString(16).toUpperCase());
            var _local_7:String = ("#" + _local_6.substr((_local_6.length - 6)));
            this._connection.send(new _Str_9899(k, _arg_2, _local_7, _arg_4, _arg_5));
        }

        public function _Str_20755():void
        {
            this._connection.send(new _Str_10045());
        }

        public function _Str_21689(k:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:int=0):void
        {
            this._connection.send(new EventLogMessageComposer(k, _arg_2, _arg_3, _arg_4, _arg_5));
        }

        public function _Str_21176(k:int):void
        {
            this._connection.send(new _Str_11290(k));
        }

        public function _Str_20499(k:int):void
        {
            this._connection.send(new _Str_12165(k));
        }

        public function _Str_19069(k:int, _arg_2:int, _arg_3:Array):void
        {
            this._connection.send(new PollAnswerComposer(k, _arg_2, _arg_3));
        }

        public function _Str_21574(k:String):void
        {
            this._connection.send(new _Str_9884(k));
        }

        public function _Str_16989(k:String):void
        {
            this._connection.send(new _Str_9928(k));
        }

        public function _Str_19906(k:int):void
        {
            this._connection.send(new _Str_5756(k));
        }

        public function _Str_21026(k:String):void
        {
            this._connection.send(new _Str_10757(k));
        }

        public function _Str_18152(k:int):void
        {
            this._connection.send(new _Str_10514(k));
        }

        public function _Str_15299(k:int):void
        {
            this._connection.send(new _Str_9893(k));
        }

        public function _Str_20746(k:int, _arg_2:String):void
        {
            this._connection.send(new _Str_11568(k, _arg_2, this.roomId));
        }

        public function _Str_5984(k:int, _arg_2:int):void
        {
            this._connection.send(new _Str_11259(k, _arg_2, this.roomId));
        }

        public function _Str_20139(k:int):void
        {
            this._connection.send(new _Str_7856(k));
        }

        public function _Str_21257(k:int):void
        {
            var _local_2:Array = [];
            _local_2.push(k);
            var _local_3:RemoveRightsMessageComposer = new RemoveRightsMessageComposer(_local_2);
            this._connection.send(_local_3);
        }

        public function _Str_20488(k:String, _arg_2:Boolean):void
        {
            this._connection.send(new _Str_10476(k, _arg_2));
        }

        public function _Str_13781(k:int):void
        {
            this._connection.send(new _Str_10764(k));
        }

        public function _Str_21066(k:int):void
        {
            this._connection.send(new _Str_7691(k, true));
        }

        public function _Str_21025(k:int):void
        {
            this._connection.send(new _Str_12318(k));
        }

        public function _Str_21562(k:int):void
        {
            this._connection.send(new _Str_12394(k));
        }

        public function _Str_19075(k:int):void
        {
            this._connection.send(new _Str_7691(k, false));
        }

        public function _Str_21635(k:int):void
        {
            this._connection.send(new _Str_10983(k));
        }

        public function _Str_19090(k:int):void
        {
            this._connection.send(new _Str_10547(k));
        }

        public function _Str_21305(k:int):void
        {
            this._connection.send(new _Str_10852(k));
        }

        public function _Str_21895(k:int):void
        {
            this._connection.send(new _Str_10067(k));
        }

        public function _Str_21525(k:int, _arg_2:int):void
        {
            this._connection.send(new _Str_10642(k, _arg_2));
        }

        public function _Str_21289(k:int):void
        {
            this._connection.send(new _Str_3382(k));
        }

        public function _Str_19996():void
        {
            this._connection.send(new _Str_10856());
        }

        public function _Str_20268():void
        {
            if (this._connection != null)
            {
                this._connection.send(new _Str_3719());
            }
        }

        public function _Str_11375(k:int):void
        {
            if (this._connection == null)
            {
                return;
            }
            this._connection.send(new _Str_10314(k));
        }

        public function _Str_21093(k:int, _arg_2:String, _arg_3:String):void
        {
            if (this._connection == null)
            {
                return;
            }
            var _local_4:_Str_8017 = new _Str_8017(k, _arg_2, _arg_3);
            this._connection.send(_local_4);
            _local_4.dispose();
            _local_4 = null;
        }

        public function get userDataManager():UserDataManager
        {
            return this._userDataManager;
        }

        public function get _Str_3871():int
        {
            return this._ownUserRoomId;
        }

        public function set _Str_3871(k:int):void
        {
            this._ownUserRoomId = k;
        }

        public function set isRoomController(k:Boolean):void
        {
            this._isRoomOwner = k;
        }

        public function get isRoomController():Boolean
        {
            return this._isRoomOwner;
        }

        public function set roomControllerLevel(k:int):void
        {
            if (((k >= RoomControllerLevel.NONE) && (k <= RoomControllerLevel.MODERATOR)))
            {
                this._roomControllerLevel = k;
            }
            else
            {
                Logger.log((("Invalid roomControllerLevel " + k) + ", setting to ROOM_CONTROL_LEVEL_NONE instead"));
                this._roomControllerLevel = RoomControllerLevel.NONE;
            }
        }

        public function get roomControllerLevel():int
        {
            return this._roomControllerLevel;
        }

        public function get _Str_3827():int
        {
            return this._tradeMode;
        }

        public function get _Str_7411():Boolean
        {
            return true;
        }

        public function set _Str_3827(k:int):void
        {
            this._tradeMode = k;
        }

        public function get _Str_3672():Boolean
        {
            return this._isGuildRoom;
        }

        public function set _Str_3672(k:Boolean):void
        {
            this._isGuildRoom = k;
        }

        public function get _Str_19282():Boolean
        {
            return this._doorMode == RoomSettingsData.DOORMODE_NOOBS_ONLY;
        }

        public function set _Str_2738(k:int):void
        {
            this._doorMode = k;
        }

        public function get _Str_4780():Boolean
        {
            return this._isSpectatorMode;
        }

        public function set _Str_4780(k:Boolean):void
        {
            this._isSpectatorMode = k;
        }

        public function get _Str_9439():Boolean
        {
            return this._arePetsAllowed;
        }

        public function set _Str_9439(k:Boolean):void
        {
            this._arePetsAllowed = k;
        }

        public function get _Str_18311():Boolean
        {
            return this._isRoomOwner;
        }

        public function get _Str_5249():Boolean
        {
            return this._isUserDecorating;
        }

        public function set _Str_5249(k:Boolean):void
        {
            this._isUserDecorating = k;
        }

        public function get _Str_16924():Boolean
        {
            return this._nuxNotComplete;
        }

        public function set _Str_16924(k:Boolean):void
        {
            this._nuxNotComplete = k;
        }

		public function votePoll(counter:int):void
		{
			this._connection.send(new VotePollCounterMessageComposer(counter));
		}
    }
}
