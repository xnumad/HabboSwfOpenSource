package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4085;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4914;
    import com.sulake.habbo.communication.messages.incoming.users.UserBadgesEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4129;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3084;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4150;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetInfoMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetTrainingPanelEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetPlacingErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetFigureUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetBreedingResultEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_7734;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetStatusUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetLevelUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9293;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9336;
    import com.sulake.habbo.communication.messages.incoming.notifications._Str_9632;
    import com.sulake.habbo.communication.messages.incoming.room.bots.BotErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_4841;
    import com.sulake.habbo.communication.messages.incoming.room.action._Str_5619;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7839;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.events.RoomSessionFavouriteGroupUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7301;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3548;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6367;
    import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_5856;
    import com.sulake.habbo.communication.messages.parser.room.pets._Str_7533;
    import com.sulake.habbo.session.RoomPetData;
    import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetFigureUpdateParser;
    import com.sulake.habbo.session.events.RoomSessionPetFigureUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetBreedingResultParser;
    import com.sulake.habbo.session.events.RoomSessionPetBreedingResultEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_6719;
    import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_6256;
    import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingResultEvent;
    import com.sulake.habbo.session.events.RoomSessionNestBreedingSuccessEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_7523;
    import com.sulake.habbo.session.events.RoomSessionPetBreedingEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetStatusUpdateParser;
    import com.sulake.habbo.session.events.RoomSessionPetStatusUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets._Str_7212;
    import com.sulake.habbo.session.events.RoomSessionPetLevelUpdateEvent;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetTrainingPanelMessageParser;
    import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist._Str_6246;
    import com.sulake.habbo.communication.messages.incoming.friendlist._Str_3742;
    import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6731;
    import com.sulake.habbo.session.events.RoomSessionDanceEvent;
    import __AS3__.vec.*;

    public class RoomUsersHandler extends BaseHandler 
    {
        public function RoomUsersHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_4085(this._Str_10523));
            k.addMessageEvent(new _Str_4914(this._Str_16267));
            k.addMessageEvent(new UserBadgesEvent(this.onUserBadges));
            k.addMessageEvent(new _Str_4129(this.onDoorbell));
            k.addMessageEvent(new _Str_3084(this._Str_5174));
            k.addMessageEvent(new _Str_4150(this.onUserNameChange));
            k.addMessageEvent(new PetInfoMessageEvent(this.onPetInfo));
            k.addMessageEvent(new PetTrainingPanelEvent(this.onEnabledPetCommands));
            k.addMessageEvent(new PetPlacingErrorEvent(this.onPetPlacingError));
            k.addMessageEvent(new PetFigureUpdateEvent(this._Str_6212));
            k.addMessageEvent(new PetBreedingResultEvent(this.onPetBreedingResult));
            k.addMessageEvent(new _Str_7734(this.onPetBreedingEvent));
            k.addMessageEvent(new PetStatusUpdateEvent(this.onPetStatusUpdate));
            k.addMessageEvent(new PetLevelUpdateEvent(this.onPetLevelUpdate));
            k.addMessageEvent(new _Str_9293(this._Str_25414));
            k.addMessageEvent(new _Str_9336(this._Str_24337));
            k.addMessageEvent(new _Str_9632(this._Str_22690));
            k.addMessageEvent(new BotErrorEvent(this.onBotError));
            k.addMessageEvent(new _Str_4841(this._Str_22755));
            k.addMessageEvent(new _Str_5619(this.onDance));
            k.addMessageEvent(new _Str_7839(this.onFavoriteMembershipUpdate));
        }

        private function onFavoriteMembershipUpdate(k:IMessageEvent):void
        {
            var _local_5:RoomSessionFavouriteGroupUpdateEvent;
            var _local_2:_Str_7301 = _Str_7839(k).getParser();
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:RoomUserData = _local_3.userDataManager.getUserDataByIndex(_local_2.roomIndex);
            if (_local_4 == null)
            {
                return;
            }
            _local_4._Str_4592 = ("" + _local_2.habboGroupId);
            _local_4.groupName = _local_2.habboGroupName;
            if (((listener) && (listener.events)))
            {
                _local_5 = new RoomSessionFavouriteGroupUpdateEvent(_local_3, _local_2.roomIndex, _local_2.habboGroupId, _local_2.status, _local_2.habboGroupName);
                listener.events.dispatchEvent(_local_5);
            }
        }

        private function _Str_10523(k:IMessageEvent):void
        {
            var _local_7:_Str_3548;
            var _local_8:RoomUserData;
            var _local_2:_Str_4085 = (k as _Str_4085);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:UsersMessageParser = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:Vector.<RoomUserData> = new Vector.<RoomUserData>(0);
            var _local_6:int;
            while (_local_6 < _local_3.getUserCount())
            {
                _local_7 = _local_3._Str_5126(_local_6);
                _local_8 = new RoomUserData(_local_7.roomIndex);
                _local_8.name = _local_7.name;
                _local_8.custom = _local_7.custom;
                _local_8.activityPoints = _local_7.activityPoints;
                _local_8.figure = _local_7.figure;
                _local_8.type = _local_7._Str_2908;
                _local_8._Str_2394 = _local_7._Str_2394;
                _local_8._Str_4592 = _local_7._Str_4592;
                _local_8.groupName = _local_7.groupName;
                _local_8._Str_7043 = _local_7._Str_7043;
                _local_8._Str_3344 = _local_7._Str_3344;
                _local_8.ownerId = _local_7.ownerId;
                _local_8.ownerName = _local_7.ownerName;
                _local_8.rarityLevel = _local_7.rarityLevel;
                _local_8._Str_4799 = _local_7._Str_4799;
                _local_8.isRiding = _local_7.isRiding;
                _local_8.canBreed = _local_7.canBreed;
                _local_8.canHarvest = _local_7.canHarvest;
                _local_8.canRevive = _local_7.canRevive;
                _local_8.hasBreedingPermission = _local_7.hasBreedingPermission;
                _local_8._Str_3897 = _local_7._Str_3897;
                _local_8._Str_2899 = _local_7._Str_2899;
                _local_8._Str_3853 = _local_7._Str_3853;
                if (_local_4.userDataManager.getUserData(_local_7.roomIndex) == null)
                {
                    _local_5.push(_local_8);
                }
                _local_4.userDataManager._Str_22067(_local_8);
                _local_6++;
            }
            listener.events.dispatchEvent(new RoomSessionUserDataUpdateEvent(_local_4, _local_5));
        }

        private function _Str_16267(k:IMessageEvent):void
        {
            var _local_2:_Str_4914 = (k as _Str_4914);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:int = (_local_2.getParser() as _Str_6367).id;
            _local_3.userDataManager.removeUserDataByRoomIndex(_local_4);
        }

        private function onUserBadges(k:IMessageEvent):void
        {
            var _local_2:UserBadgesEvent = (k as UserBadgesEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.userDataManager.setUserBadges(_local_2.userId, _local_2.badges);
            listener.events.dispatchEvent(new RoomSessionUserBadgesEvent(_local_3, _local_2.userId, _local_2.badges));
        }

        private function onDoorbell(k:IMessageEvent):void
        {
            var _local_2:_Str_4129 = (k as _Str_4129);
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.userName == "")
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionDoorbellEvent(RoomSessionDoorbellEvent.RSDE_DOORBELL, _local_3, _local_2.userName));
        }

        private function _Str_5174(k:IMessageEvent):void
        {
            var _local_2:_Str_3084 = (k as _Str_3084);
            if (_local_2 == null)
            {
                return;
            }
            var session:IRoomSession = listener.getSession(_xxxRoomId);
            if (session == null)
            {
                return;
            }
            if (_local_2.id >= 0)
            {
                session.userDataManager.updateFigure(_local_2.id, _local_2.figure, _local_2._Str_3344, false, false);
                session.userDataManager.updateCustom(_local_2.id, _local_2.customInfo);
                session.userDataManager.updateAchievementScore(_local_2.id, _local_2.activityPoints);
                listener.events.dispatchEvent(new RoomSessionUserFigureUpdateEvent(session, _local_2.id, _local_2.figure, _local_2._Str_3344, _local_2.customInfo, _local_2.activityPoints));
            }
        }

        private function onUserNameChange(k:IMessageEvent):void
        {
            var _local_2:_Str_4150 = (k as _Str_4150);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_5856 = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            _local_4.userDataManager.updateNameByIndex(_local_3.id, _local_3._Str_16428);
        }

        private function onPetInfo(k:IMessageEvent):void
        {
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetInfoMessageEvent = (k as PetInfoMessageEvent);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:_Str_7533 = _local_3.getParser();
            var _local_5:RoomPetData = new RoomPetData();
            _local_5.id = _local_4.id;
            _local_5.level = _local_4.level;
            _local_5.maximumLevel = _local_4.maximumLevel;
            _local_5.experience = _local_4.experience;
            _local_5.levelExperienceGoal = _local_4.levelExperienceGoal;
            _local_5.energy = _local_4.energy;
            _local_5.maximumEnergy = _local_4.maximumEnergy;
            _local_5.happyness = _local_4.happyness;
            _local_5.maximumHappyness = _local_4.maximumHappyness;
            _local_5.ownerId = _local_4.ownerId;
            _local_5.ownerName = _local_4.ownerName;
            _local_5.respect = _local_4.respect;
            _local_5.age = _local_4.age;
            _local_5.unknownRarity = _local_4.unknownRarity;
            _local_5.saddle = _local_4.saddle;
            _local_5.rider = _local_4.rider;
            _local_5.breedable = _local_4.breedable;
            _local_5.fullyGrown = _local_4.fullyGrown;
            _local_5.rarityLevel = _local_4.rarityLevel;
            _local_5.dead = _local_4.dead;
            _local_5._Str_3307 = _local_4._Str_3307;
            _local_5.publiclyRideable = _local_4.publiclyRideable;
            _local_5.maximumTimeToLive = _local_4.maximumTimeToLive;
            _local_5.remainingTimeToLive = _local_4.remainingTimeToLive;
            _local_5.remainingGrowTime = _local_4.remainingGrowTime;
            _local_5.publiclyBreedable = _local_4.publiclyBreedable;
            listener.events.dispatchEvent(new RoomSessionPetInfoUpdateEvent(_local_2, _local_5));
        }

        private function _Str_6212(k:IMessageEvent):void
        {
            var _local_2:PetFigureUpdateEvent = (k as PetFigureUpdateEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetFigureUpdateParser = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:String = _local_3.figureData.figuredata;
            var _local_6:int = _local_3.roomIndex;
            var _local_7:int = _local_3._Str_2508;
            var _local_8:Boolean = _local_3._Str_4799;
            var _local_9:Boolean = _local_3.isRiding;
            _local_4.userDataManager.updateFigure(_local_6, _local_5, "", _local_8, _local_9);
            listener.events.dispatchEvent(new RoomSessionPetFigureUpdateEvent(_local_4, _local_7, _local_5));
        }

        private function onPetBreedingResult(k:IMessageEvent):void
        {
            var _local_2:PetBreedingResultEvent = (k as PetBreedingResultEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetBreedingResultParser = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionPetBreedingResultEvent(_local_4, _local_3._Str_3713, _local_3._Str_5840));
        }

        private function _Str_25414(k:_Str_9293):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_6719 = (k.parser as _Str_6719);
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionConfirmPetBreedingEvent(_local_3, _local_2.nestId, _local_2.pet1, _local_2.pet2, _local_2.rarityCategories, _local_2._Str_24905));
        }

        private function _Str_24337(k:_Str_9336):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_6256 = (k.parser as _Str_6256);
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_3 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionConfirmPetBreedingResultEvent(_local_3, _local_2.breedingNestStuffId, _local_2.result));
        }

        private function _Str_22690(k:_Str_9632):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionNestBreedingSuccessEvent(_local_2, k.getParser()._Str_2508, k.getParser().rarityCategory));
        }

        private function onPetBreedingEvent(k:IMessageEvent):void
        {
            var _local_2:_Str_7734 = (k as _Str_7734);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7523 = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionPetBreedingEvent(_local_4, _local_3.state, _local_3.ownPetId, _local_3.otherPetId));
        }

        private function onPetStatusUpdate(k:IMessageEvent):void
        {
            var _local_2:PetStatusUpdateEvent = (k as PetStatusUpdateEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetStatusUpdateParser = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:int = _local_3.roomIndex;
            var _local_6:int = _local_3._Str_2508;
            var _local_7:Boolean = _local_3.canHarvest;
            var _local_8:Boolean = _local_3.canRevive;
            var _local_9:Boolean = _local_3.canBreed;
            var _local_10:Boolean = _local_3.hasBreedingPermission;
            _local_4.userDataManager.updatePetBreedingStatus(_local_5, _local_9, _local_7, _local_8, _local_10);
            listener.events.dispatchEvent(new RoomSessionPetStatusUpdateEvent(_local_4, _local_6, _local_9, _local_7, _local_8, _local_10));
        }

        private function onPetLevelUpdate(k:IMessageEvent):void
        {
            var _local_2:PetLevelUpdateEvent = (k as PetLevelUpdateEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7212 = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:int = _local_3.roomIndex;
            var _local_6:int = _local_3._Str_2508;
            var _local_7:int = _local_3.level;
            _local_4.userDataManager.updatePetLevel(_local_5, _local_7);
            listener.events.dispatchEvent(new RoomSessionPetLevelUpdateEvent(_local_4, _local_6, _local_7));
        }

        private function onEnabledPetCommands(k:IMessageEvent):void
        {
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetTrainingPanelEvent = (k as PetTrainingPanelEvent);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:PetTrainingPanelMessageParser = _local_3.getParser();
            if (_local_4 != null)
            {
                listener.events.dispatchEvent(new RoomSessionPetCommandsUpdateEvent(_local_2, _local_4.id, _local_4.commands, _local_4.enabledCommands));
            }
        }

        private function onPetPlacingError(k:PetPlacingErrorEvent):void
        {
            var _local_3:String;
            if (((k == null) || (k.getParser() == null)))
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            switch (k.getParser().errorCode)
            {
                case 0:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_PETS_FORBIDDEN_IN_HOTEL;
                    break;
                case 1:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_PETS_FORBIDDEN_IN_FLAT;
                    break;
                case 2:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_MAX_PETS;
                    break;
                case 3:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_NO_FREE_TILES_FOR_PET;
                    break;
                case 4:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_SELECTED_TILE_NOT_FREE_FOR_PET;
                    break;
                case 5:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_MAX_NUMBER_OF_OWN_PETS;
                    break;
            }
            if (_local_3 != null)
            {
                listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_local_3, _local_2));
            }
        }

        private function onBotError(k:BotErrorEvent):void
        {
            var _local_3:String;
            if (((k == null) || (k.getParser() == null)))
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            switch (k.getParser().errorCode)
            {
                case 0:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_BOTS_FORBIDDEN_IN_HOTEL;
                    break;
                case 1:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_BOTS_FORBIDDEN_IN_FLAT;
                    break;
                case 2:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_BOT_LIMIT_REACHED;
                    break;
                case 3:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT;
                    break;
                case 4:
                    _local_3 = RoomSessionErrorMessageEvent.RSEME_BOT_NAME_NOT_ACCEPTED;
                    break;
            }
            if (_local_3 != null)
            {
                listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_local_3, _local_2));
            }
        }

        private function _Str_22755(k:_Str_4841):void
        {
            if ((((!(k)) || (!(listener))) || (!(listener.events))))
            {
                return;
            }
            var _local_2:_Str_6246 = k.getParser();
            if (!_local_2)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            if (!_local_3)
            {
                return;
            }
            var _local_4:_Str_3742 = _local_2.req;
            if (!_local_4)
            {
                return;
            }
            listener.events.dispatchEvent(new RoomSessionFriendRequestEvent(_local_3, _local_4.requestId, _local_4.requestId, _local_4.requesterName));
        }

        private function onDance(k:_Str_5619):void
        {
            var _local_2:_Str_6731 = k.getParser();
            var _local_3:IRoomSession = listener.getSession(_xxxRoomId);
            listener.events.dispatchEvent(new RoomSessionDanceEvent(_local_3, _local_2.userId, _local_2._Str_8263));
        }
    }
}
