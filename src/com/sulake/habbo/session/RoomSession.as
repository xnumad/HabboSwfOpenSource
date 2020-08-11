package com.sulake.habbo.session
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomModerationSettings;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.session.OpenFlatConnectionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.game.arena.Game2GameChatMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
    import flash.utils.getTimer;
    import com.sulake.habbo.communication.messages.outgoing.room.avatar.ChangeMottoMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.chat.ShoutMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.chat.WhisperMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.chat.StartTypingMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.chat.CancelTypingMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.avatar.AvatarExpressionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.avatar.SignMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.avatar.DanceMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.avatar.ChangePostureMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.CreditFurniRedeemMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.PresentOpenMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.OpenPetPackageMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerGetPresetsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerSavePresetMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerChangeStateMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.poll.PollStartComposer;
    import com.sulake.habbo.communication.messages.outgoing.poll.PollRejectComposer;
    import com.sulake.habbo.communication.messages.outgoing.poll.PollAnswerComposer;
    import com.sulake.habbo.communication.messages.outgoing.userclassification.PeerUsersClassificationMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.userclassification.RoomUsersClassificationMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.friendlist.FollowFriendMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.AmbassadorAlertMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.RoomUserKickMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.BanUserWithDurationMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.RoomUserMuteMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.AssignRightsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.RemoveRightsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.action.LetUserInMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.RemovePetFromFlatMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.MountPetMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.TogglePetRidingPermissionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.TogglePetBreedingPermissionMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.RemoveSaddleFromPetMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.HarvestPetMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.CompostPlantMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.GetPetCommandsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.pets.CustomizePetWithFurniComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.UseFurnitureMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.nux.NewUserExperienceScriptProceedComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.session.ChangeQueueMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.SetClothingChangeDataMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
	import com.sulake.habbo.ui.widget.infobuspolls.VotePollCounterMessageComposer;

    public class RoomSession implements IRoomSession 
    {
        private const CHAT_LAG_WARNING_LIMIT:int = 2500;

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
        private var _roomModerationSettings:RoomModerationSettings = null;

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

        public function get roomPassword():String
        {
            return this._password;
        }

        public function set roomPassword(k:String):void
        {
            this._password = k;
        }

        public function get roomResources():String
        {
            return this._roomResources;
        }

        public function set roomResources(k:String):void
        {
            this._roomResources = k;
        }

        public function get openConnectionComposer():IMessageComposer
        {
            return this._openConnectionComposer;
        }

        public function set openConnectionComposer(k:IMessageComposer):void
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

        public function get roomModerationSettings():RoomModerationSettings
        {
            return this._roomModerationSettings;
        }

        public function set roomModerationSettings(k:RoomModerationSettings):void
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
                this._tradeMode = RoomTradingLevelEnum.NO_TRADING;
                this._isSpectatorMode = false;
            }
        }

        private function sendOpenFlatConnectionMessage():Boolean
        {
            if (this._connection == null)
            {
                return false;
            }
            this._connection.send(new OpenFlatConnectionMessageComposer(this._roomId, this._password));
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

        public function sendChatMessage(k:String, _arg_2:int=0):void
        {
            if (this._isGameSession)
            {
                this._connection.send(new Game2GameChatMessageComposer(k));
            }
            else
            {
                k = k.replace(/&#[0-9]+;/g, "");
                this._connection.send(new ChatMessageComposer(k, _arg_2, this._chatTrackingId));
                this._messageLagTrackingMap.add(this._chatTrackingId, getTimer());
                this._chatTrackingId++;
            }
        }

        public function sendChangeMottoMessage(k:String):void
        {
            this._connection.send(new ChangeMottoMessageComposer(k));
        }

        public function receivedChatWithTrackingId(k:int):void
        {
            var _local_3:int;
            var _local_2:Object = this._messageLagTrackingMap.remove(k);
            if (_local_2 != null)
            {
                _local_3 = getTimer();
                if ((_local_3 - int(_local_2)) > this.CHAT_LAG_WARNING_LIMIT)
                {
                    if (this._habboTracking != null)
                    {
                        this._habboTracking.chatLagDetected(_local_3);
                    }
                }
            }
        }

        public function sendShoutMessage(k:String, _arg_2:int=0):void
        {
            this._connection.send(new ShoutMessageComposer(k, _arg_2));
        }

        public function sendWhisperMessage(k:String, _arg_2:String, _arg_3:int=0):void
        {
            this._connection.send(new WhisperMessageComposer(k, _arg_2, _arg_3));
        }

        public function sendChatTypingMessage(k:Boolean):void
        {
            if (k)
            {
                this._connection.send(new StartTypingMessageComposer());
            }
            else
            {
                this._connection.send(new CancelTypingMessageComposer());
            }
        }

        public function sendAvatarExpressionMessage(k:int):void
        {
            this._connection.send(new AvatarExpressionMessageComposer(k));
        }

        public function sendSignMessage(k:int):void
        {
            if (((k >= 0) && (k <= 17)))
            {
                this._connection.send(new SignMessageComposer(k));
            }
        }

        public function sendDanceMessage(k:int):void
        {
            this._connection.send(new DanceMessageComposer(k));
        }

        public function sendChangePostureMessage(k:int):void
        {
            this._connection.send(new ChangePostureMessageComposer(k));
        }

        public function sendCreditFurniRedeemMessage(k:int):void
        {
            this._connection.send(new CreditFurniRedeemMessageComposer(k));
        }

        public function sendPresentOpenMessage(k:int):void
        {
            this._connection.send(new PresentOpenMessageComposer(k));
        }

        public function sendOpenPetPackageMessage(k:int, _arg_2:String):void
        {
            this._connection.send(new OpenPetPackageMessageComposer(k, _arg_2));
        }

        public function sendRoomDimmerGetPresetsMessage():void
        {
            this._connection.send(new RoomDimmerGetPresetsMessageComposer());
        }

        public function sendRoomDimmerSavePresetMessage(k:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:String = ("000000" + _arg_3.toString(16).toUpperCase());
            var _local_7:String = ("#" + _local_6.substr((_local_6.length - 6)));
            this._connection.send(new RoomDimmerSavePresetMessageComposer(k, _arg_2, _local_7, _arg_4, _arg_5));
        }

        public function sendRoomDimmerChangeStateMessage():void
        {
            this._connection.send(new RoomDimmerChangeStateMessageComposer());
        }

        public function sendConversionPoint(k:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:int=0):void
        {
            this._connection.send(new EventLogMessageComposer(k, _arg_2, _arg_3, _arg_4, _arg_5));
        }

        public function sendPollStartMessage(k:int):void
        {
            this._connection.send(new PollStartComposer(k));
        }

        public function sendPollRejectMessage(k:int):void
        {
            this._connection.send(new PollRejectComposer(k));
        }

        public function sendPollAnswerMessage(k:int, _arg_2:int, _arg_3:Array):void
        {
            this._connection.send(new PollAnswerComposer(k, _arg_2, _arg_3));
        }

        public function sendPeerUsersClassificationMessage(k:String):void
        {
            this._connection.send(new PeerUsersClassificationMessageComposer(k));
        }

        public function sendRoomUsersClassificationMessage(k:String):void
        {
            this._connection.send(new RoomUsersClassificationMessageComposer(k));
        }

        public function sendVisitFlatMessage(k:int):void
        {
            this._connection.send(new OpenFlatConnectionMessageComposer(k));
        }

        public function sendVisitUserMessage(k:String):void
        {
            this._connection.send(new FollowFriendMessageComposer(k));
        }

        public function ambassadorAlert(k:int):void
        {
            this._connection.send(new AmbassadorAlertMessageComposer(k));
        }

        public function kickUser(k:int):void
        {
            this._connection.send(new RoomUserKickMessageComposer(k));
        }

        public function banUserWithDuration(k:int, _arg_2:String):void
        {
            this._connection.send(new BanUserWithDurationMessageComposer(k, _arg_2, this.roomId));
        }

        public function muteUser(userId:int, minutes:int):void
        {
            this._connection.send(new RoomUserMuteMessageComposer(userId, minutes, this.roomId));
        }

        public function assignRights(k:int):void
        {
            this._connection.send(new AssignRightsMessageComposer(k));
        }

        public function removeRights(k:int):void
        {
            var _local_2:Array = [];
            _local_2.push(k);
            var _local_3:RemoveRightsMessageComposer = new RemoveRightsMessageComposer(_local_2);
            this._connection.send(_local_3);
        }

        public function letUserIn(k:String, _arg_2:Boolean):void
        {
            this._connection.send(new LetUserInMessageComposer(k, _arg_2));
        }

        public function pickUpPet(k:int):void
        {
            this._connection.send(new RemovePetFromFlatMessageComposer(k));
        }

        public function mountPet(k:int):void
        {
            this._connection.send(new MountPetMessageComposer(k, true));
        }

        public function togglePetRidingPermission(k:int):void
        {
            this._connection.send(new TogglePetRidingPermissionMessageComposer(k));
        }

        public function togglePetBreedingPermission(k:int):void
        {
            this._connection.send(new TogglePetBreedingPermissionMessageComposer(k));
        }

        public function dismountPet(k:int):void
        {
            this._connection.send(new MountPetMessageComposer(k, false));
        }

        public function removeSaddleFromPet(k:int):void
        {
            this._connection.send(new RemoveSaddleFromPetMessageComposer(k));
        }

        public function harvestPet(k:int):void
        {
            this._connection.send(new HarvestPetMessageComposer(k));
        }

        public function compostPlant(k:int):void
        {
            this._connection.send(new CompostPlantMessageComposer(k));
        }

        public function requestPetCommands(k:int):void
        {
            this._connection.send(new GetPetCommandsMessageComposer(k));
        }

        public function useProductForPet(k:int, _arg_2:int):void
        {
            this._connection.send(new CustomizePetWithFurniComposer(k, _arg_2));
        }

        public function plantSeed(k:int):void
        {
            this._connection.send(new UseFurnitureMessageComposer(k));
        }

        public function sendScriptProceed():void
        {
            this._connection.send(new NewUserExperienceScriptProceedComposer());
        }

        public function quit():void
        {
            if (this._connection != null)
            {
                this._connection.send(new QuitMessageComposer());
            }
        }

        public function changeQueue(k:int):void
        {
            if (this._connection == null)
            {
                return;
            }
            this._connection.send(new ChangeQueueMessageComposer(k));
        }

        public function sendUpdateClothingChangeFurniture(k:int, _arg_2:String, _arg_3:String):void
        {
            if (this._connection == null)
            {
                return;
            }
            var _local_4:SetClothingChangeDataMessageComposer = new SetClothingChangeDataMessageComposer(k, _arg_2, _arg_3);
            this._connection.send(_local_4);
            _local_4.dispose();
            _local_4 = null;
        }

        public function get userDataManager():UserDataManager
        {
            return this._userDataManager;
        }

        public function get ownUserRoomId():int
        {
            return this._ownUserRoomId;
        }

        public function set ownUserRoomId(k:int):void
        {
            this._ownUserRoomId = k;
        }

        public function set isRoomOwner(k:Boolean):void
        {
            this._isRoomOwner = k;
        }

        public function get isRoomOwner():Boolean
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

        public function get tradeMode():int
        {
            return this._tradeMode;
        }

        public function get isPrivateRoom():Boolean
        {
            return true;
        }

        public function set tradeMode(k:int):void
        {
            this._tradeMode = k;
        }

        public function get isGuildRoom():Boolean
        {
            return this._isGuildRoom;
        }

        public function set isGuildRoom(k:Boolean):void
        {
            this._isGuildRoom = k;
        }

        public function get isNoobRoom():Boolean
        {
            return this._doorMode == RoomSettingsData.DOORMODE_NOOBS_ONLY;
        }

        public function set doorMode(k:int):void
        {
            this._doorMode = k;
        }

        public function get isSpectatorMode():Boolean
        {
            return this._isSpectatorMode;
        }

        public function set isSpectatorMode(k:Boolean):void
        {
            this._isSpectatorMode = k;
        }

        public function get arePetsAllowed():Boolean
        {
            return this._arePetsAllowed;
        }

        public function set arePetsAllowed(k:Boolean):void
        {
            this._arePetsAllowed = k;
        }

        public function get areBotsAllowed():Boolean
        {
            return this._isRoomOwner;
        }

        public function get isUserDecorating():Boolean
        {
            return this._isUserDecorating;
        }

        public function set isUserDecorating(k:Boolean):void
        {
            this._isUserDecorating = k;
        }

        public function get isNuxNotComplete():Boolean
        {
            return this._nuxNotComplete;
        }

        public function set isNuxNotComplete(k:Boolean):void
        {
            this._nuxNotComplete = k;
        }

		public function votePoll(counter:int):void
		{
			this._connection.send(new VotePollCounterMessageComposer(counter));
		}
    }
}
