package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.sound.IHabboMusicController;
    import com.sulake.habbo.ui.widget.infostand.InfoStandWidget;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.session.events.RoomSessionUserTagsEvent;
    import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionFavouriteGroupUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetFigureUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetBreedingResultEvent;
    import com.sulake.habbo.session.events.RoomSessionPetBreedingEvent;
    import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingEvent;
    import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingResultEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_3921;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5269;
    import com.sulake.habbo.communication.messages.incoming.users._Str_2974;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomTagSearchMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeImageMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChangeMottoMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.ui.widget.events._Str_4831;
    import com.sulake.habbo.ui.widget.infostand.InfoStandFurniData;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_11770;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_10187;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_7251;
    import com.sulake.habbo.ui.widget.enums.PetSupplementEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_381._Str_8184;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_10794;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.utils._Str_6093;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.events._Str_3735;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_381._Str_11301;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentrableBotInfostandUpdateEvent;
    import com.sulake.habbo.friendlist.IFriend;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.session.enum.RoomTradingLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_8049;
    import com.sulake.habbo.communication.messages.incoming.roomsettings._Str_2817;
    import com.sulake.habbo.sound.IPlayListController;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfostandUpdateEvent;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnumItemExtradataParameter;
    import com.sulake.habbo.room.object.data.StuffDataFactory;
    import com.sulake.habbo.room.IStuffData;
    import flash.utils.getTimer;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserTagsUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfostandUpdateEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.RoomPetData;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetFigureUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_3801;
    import com.sulake.habbo.ui.widget.events._Str_4736;
    import com.sulake.habbo.ui.widget.events._Str_3919;
    import com.sulake.habbo.ui.widget.events._Str_3575;
    import com.sulake.habbo.communication.messages.incoming.room.pets._Str_5753;
    import com.sulake.habbo.ui.widget.events._Str_4624;
    import com.sulake.habbo.ui.widget.events._Str_5914;
    import com.sulake.habbo.ui.widget.events._Str_3962;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_5686;

    public class InfoStandWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _cachedPetImages:Map;
        private var _musicController:IHabboMusicController;
        private var _widget:InfoStandWidget;
        private var _groupDetailsMessageEvent:IMessageEvent;
        private var _relationshipStatusMessageEvent:IMessageEvent;

        public function InfoStandWidgetHandler(k:IHabboMusicController)
        {
            this._cachedPetImages = new Map();
            super();
            this._musicController = k;
            if (this._musicController != null)
            {
                this._musicController.events.addEventListener(NowPlayingEvent.NPE_SONG_CHANGED, this._Str_14970);
                this._musicController.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
            }
        }

        public function set widget(k:InfoStandWidget):void
        {
            this._widget = k;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.INFOSTAND;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            if (this._container != null)
            {
                if (this._container.sessionDataManager != null)
                {
                    this._container.sessionDataManager.events.removeEventListener(RoomSessionUserTagsEvent.UTRE_USER_TAGS_RECEIVED, this._Str_7983);
                }
                if (this._container.roomSessionManager != null)
                {
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionUserFigureUpdateEvent.RSUBE_FIGURE, this._Str_8471);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionPetInfoUpdateEvent.PET_INFO, this.onPetInfo);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS, this._Str_12211);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionFavouriteGroupUpdateEvent.RSFGUE_FAVOURITE_GROUP_UPDATE, this._Str_20602);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionPetFigureUpdateEvent.PET_FIGURE_UPDATE, this._Str_6212);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionPetBreedingResultEvent.RSPFUE_PET_BREEDING_RESULT, this.onPetBreedingResult);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionPetBreedingEvent.RSPFUE_PET_BREEDING, this.onPetBreedingEvent);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionConfirmPetBreedingEvent.RSPFUE_CONFIRM_PET_BREEDING, this._Str_20173);
                    this._container.roomSessionManager.events.removeEventListener(RoomSessionConfirmPetBreedingResultEvent.RSPFUE_CONFIRM_PET_BREEDING_RESULT, this._Str_20716);
                }
                if (this._container.connection != null)
                {
                    if (this._groupDetailsMessageEvent != null)
                    {
                        this._container.connection.removeMessageEvent(this._groupDetailsMessageEvent);
                        this._groupDetailsMessageEvent.dispose();
                        this._groupDetailsMessageEvent = null;
                    }
                    if (this._relationshipStatusMessageEvent != null)
                    {
                        this._container.connection.removeMessageEvent(this._relationshipStatusMessageEvent);
                        this._relationshipStatusMessageEvent.dispose();
                        this._relationshipStatusMessageEvent = null;
                    }
                }
            }
            this._container = k;
            if (k == null)
            {
                return;
            }
            if (this._container.sessionDataManager != null)
            {
                this._container.sessionDataManager.events.addEventListener(RoomSessionUserTagsEvent.UTRE_USER_TAGS_RECEIVED, this._Str_7983);
            }
            if (this._container.roomSessionManager != null)
            {
                this._container.roomSessionManager.events.addEventListener(RoomSessionUserFigureUpdateEvent.RSUBE_FIGURE, this._Str_8471);
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetInfoUpdateEvent.PET_INFO, this.onPetInfo);
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS, this._Str_12211);
                this._container.roomSessionManager.events.addEventListener(RoomSessionFavouriteGroupUpdateEvent.RSFGUE_FAVOURITE_GROUP_UPDATE, this._Str_20602);
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetFigureUpdateEvent.PET_FIGURE_UPDATE, this._Str_6212);
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetBreedingResultEvent.RSPFUE_PET_BREEDING_RESULT, this.onPetBreedingResult);
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetBreedingEvent.RSPFUE_PET_BREEDING, this.onPetBreedingEvent);
                this._container.roomSessionManager.events.addEventListener(RoomSessionConfirmPetBreedingEvent.RSPFUE_CONFIRM_PET_BREEDING, this._Str_20173);
                this._container.roomSessionManager.events.addEventListener(RoomSessionConfirmPetBreedingResultEvent.RSPFUE_CONFIRM_PET_BREEDING_RESULT, this._Str_20716);
            }
            if (this._container.connection)
            {
                this._groupDetailsMessageEvent = new _Str_3921(this._Str_3702);
                this._container.connection.addMessageEvent(this._groupDetailsMessageEvent);
                this._relationshipStatusMessageEvent = new _Str_5269(this._Str_22283);
                this._container.connection.addMessageEvent(this._relationshipStatusMessageEvent);
            }
        }

        private function _Str_3702(k:_Str_3921):void
        {
            var _local_2:_Str_2974 = k.data;
            if (this._widget.furniData.groupId == _local_2.groupId)
            {
                this._widget._Str_21463._Str_5235 = _local_2.badgeCode;
                this._widget._Str_21463.groupName = _local_2.groupName;
            }
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:BitmapData;
            if (this._cachedPetImages != null)
            {
                k = (this._cachedPetImages.length - 1);
                while (k >= 0)
                {
                    _local_2 = this._cachedPetImages.getWithIndex(k);
                    if (_local_2)
                    {
                        _local_2.dispose();
                    }
                    _local_2 = null;
                    k--;
                }
                this._cachedPetImages.dispose();
                this._cachedPetImages = null;
            }
            if (this._musicController != null)
            {
                this._musicController.events.removeEventListener(NowPlayingEvent.NPE_SONG_CHANGED, this._Str_14970);
                this._musicController.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
                this._musicController = null;
            }
            this._isDisposed = true;
            this.container = null;
        }

        public function _Str_2607():Array
        {
            var k:Array = [];
            k.push(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_INFO);
            k.push(RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_NAME);
            k.push(RoomWidgetUserActionMessage.RWUAM_SEND_FRIEND_REQUEST);
            k.push(RoomWidgetUserActionMessage.RWUAM_RESPECT_USER);
            k.push(RoomWidgetUserActionMessage.RWUAM_WHISPER_USER);
            k.push(RoomWidgetUserActionMessage.RWUAM_IGNORE_USER);
            k.push(RoomWidgetUserActionMessage.RWUAM_UNIGNORE_USER);
            k.push(RoomWidgetUserActionMessage.RWUAM_KICK_USER);
            k.push(RoomWidgetUserActionMessage.RWUAM_BAN_USER_DAY);
            k.push(RoomWidgetUserActionMessage.RWUAM_BAN_USER_HOUR);
            k.push(RoomWidgetUserActionMessage.RWUAM_BAN_USER_PERM);
            k.push(RoomWidgetUserActionMessage.MUTE_USER_2MIN);
            k.push(RoomWidgetUserActionMessage.MUTE_USER_5MIN);
            k.push(RoomWidgetUserActionMessage.MUTE_USER_10MIN);
            k.push(RoomWidgetUserActionMessage.RWUAM_GIVE_RIGHTS);
            k.push(RoomWidgetUserActionMessage.RWUAM_TAKE_RIGHTS);
            k.push(RoomWidgetUserActionMessage.RWUAM_START_TRADING);
            k.push(RoomWidgetUserActionMessage.RWUAM_OPEN_HOME_PAGE);
            k.push(RoomWidgetUserActionMessage.RWUAM_PASS_CARRY_ITEM);
            k.push(RoomWidgetUserActionMessage.RWUAM_GIVE_CARRY_ITEM_TO_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_DROP_CARRY_ITEM);
            k.push(RoomWidgetFurniActionMessage.RWFAM_MOVE);
            k.push(RoomWidgetFurniActionMessage.RWFUAM_ROTATE);
            k.push(RoomWidgetFurniActionMessage.RWFAM_PICKUP);
            k.push(RoomWidgetFurniActionMessage.RWFAM_EJECT);
            k.push(RoomWidgetFurniActionMessage.RWFAM_USE);
            k.push(RoomWidgetFurniActionMessage.RWFAM_SAVE_STUFF_DATA);
            k.push(RoomWidgetRoomTagSearchMessage.RWRTSM_ROOM_TAG_SEARCH);
            k.push(RoomWidgetGetBadgeDetailsMessage.RWGOI_MESSAGE_GET_BADGE_DETAILS);
            k.push(RoomWidgetGetBadgeImageMessage.RWGOI_MESSAGE_GET_BADGE_IMAGE);
            k.push(RoomWidgetUserActionMessage.RWUAM_REPORT);
            k.push(RoomWidgetUserActionMessage.RWUAM_PICKUP_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_MOUNT_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION);
            k.push(RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION);
            k.push(RoomWidgetUserActionMessage.RWUAM_DISMOUNT_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_SADDLE_OFF);
            k.push(RoomWidgetUserActionMessage.RWUAM_TRAIN_PET);
            k.push(RoomWidgetPetCommandMessage.RWPCM_PET_COMMAND);
            k.push(RoomWidgetPetCommandMessage.RWPCM_REQUEST_PET_COMMANDS);
            k.push(RoomWidgetUserActionMessage._Str_6480);
            k.push(RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE);
            k.push(RoomWidgetChangeMottoMessage.RWVM_CHANGE_MOTTO_MESSAGE);
            k.push(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE);
            k.push(RoomWidgetPresentOpenMessage.RWPOM_OPEN_PRESENT);
            k.push(RoomWidgetUserActionMessage.RWUAM_GIVE_LIGHT_TO_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_GIVE_WATER_TO_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_TREAT_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_REPORT_CFH_OTHER);
            k.push(RoomWidgetUserActionMessage.RWUAM_AMBASSADOR_ALERT_USER);
            k.push(RoomWidgetUserActionMessage.RWUAM_AMBASSADOR_KICK_USER);
            k.push(RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_2MIN);
            k.push(RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_10MIN);
            k.push(RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_60MIN);
            k.push(RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_18HOUR);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_3:RoomUserData;
            var _local_4:RoomWidgetUserActionMessage;
            var _local_7:RoomWidgetFurniActionMessage;
            var _local_8:_Str_4831;
            var _local_9:RoomUserData;
            var _local_10:String;
            var _local_11:RoomWidgetRoomTagSearchMessage;
            var _local_12:RoomWidgetGetBadgeDetailsMessage;
            var _local_13:RoomWidgetGetBadgeImageMessage;
            var _local_14:RoomWidgetPetCommandMessage;
            var _local_15:RoomWidgetPetCommandMessage;
            var _local_16:RoomWidgetChangeMottoMessage;
            var _local_17:RoomWidgetOpenProfileMessage;
            var _local_18:RoomWidgetPresentOpenMessage;
            var _local_19:Map;
            var _local_20:Array;
            var _local_21:String;
            var _local_22:Array;
            var _local_23:String;
            var _local_24:String;
            var _local_25:InfoStandFurniData;
            if (k == null)
            {
                return null;
            }
            if (this._container == null)
            {
                return null;
            }
            var _local_2:int;
            _local_4 = (k as RoomWidgetUserActionMessage);
            if (_local_4 != null)
            {
                _local_2 = _local_4.userId;
                if (((((((((((((k.type == RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE) || (k.type == RoomWidgetUserActionMessage._Str_6480)) || (k.type == RoomWidgetUserActionMessage.RWUAM_PICKUP_PET)) || (k.type == RoomWidgetUserActionMessage.RWUAM_MOUNT_PET)) || (k.type == RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION)) || (k.type == RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION)) || (k.type == RoomWidgetUserActionMessage.RWUAM_DISMOUNT_PET)) || (k.type == RoomWidgetUserActionMessage.RWUAM_SADDLE_OFF)) || (k.type == RoomWidgetUserActionMessage.RWUAM_GIVE_CARRY_ITEM_TO_PET)) || (k.type == RoomWidgetUserActionMessage.RWUAM_GIVE_WATER_TO_PET)) || (k.type == RoomWidgetUserActionMessage.RWUAM_GIVE_LIGHT_TO_PET)) || (k.type == RoomWidgetUserActionMessage.RWUAM_TREAT_PET)))
                {
                    _local_3 = this._container.roomSession.userDataManager._Str_8631(_local_2);
                }
                else
                {
                    _local_3 = this._container.roomSession.userDataManager.getUserData(_local_2);
                }
                if (_local_3 == null)
                {
                    return null;
                }
            }
            var _local_5:int;
            var _local_6:int;
            _local_7 = (k as RoomWidgetFurniActionMessage);
            if (_local_7 != null)
            {
                _local_5 = _local_7.furniId;
                _local_6 = _local_7.furniCategory;
            }
            switch (k.type)
            {
                case RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_INFO:
                    return this._Str_23400((k as RoomWidgetRoomObjectMessage));
                case RoomWidgetRoomObjectMessage.RWROM_GET_OBJECT_NAME:
                    return this._Str_24376((k as RoomWidgetRoomObjectMessage));
                case RoomWidgetUserActionMessage.RWUAM_SEND_FRIEND_REQUEST:
                    this._container.friendList._Str_14642(_local_2, _local_3.name);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_RESPECT_USER:
                    this._container.sessionDataManager.giveRespect(_local_2);
                    break;
                case RoomWidgetUserActionMessage._Str_6480:
                    this._container.sessionDataManager.givePetRespect(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_WHISPER_USER:
                    _local_8 = new _Str_4831(_Str_4831.WHISPER, _local_3.name);
                    this._container.events.dispatchEvent(_local_8);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_IGNORE_USER:
                    this._container.sessionDataManager.ignoreUser(_local_3.name);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_UNIGNORE_USER:
                    this._container.sessionDataManager.unignoreUser(_local_3.name);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_KICK_USER:
                    this._container.roomSession._Str_15299(_local_3._Str_2394);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_BAN_USER_DAY:
                case RoomWidgetUserActionMessage.RWUAM_BAN_USER_HOUR:
                case RoomWidgetUserActionMessage.RWUAM_BAN_USER_PERM:
                    this._container.roomSession._Str_20746(_local_3._Str_2394, k.type);
                    break;
                case RoomWidgetUserActionMessage.MUTE_USER_2MIN:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 2);
                    break;
                case RoomWidgetUserActionMessage.MUTE_USER_5MIN:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 5);
                    break;
                case RoomWidgetUserActionMessage.MUTE_USER_10MIN:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 10);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_GIVE_RIGHTS:
                    this._container.roomSession._Str_20139(_local_3._Str_2394);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_TAKE_RIGHTS:
                    this._container.roomSession._Str_21257(_local_3._Str_2394);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_START_TRADING:
                    _local_9 = this._container.roomSession.userDataManager.getUserData(_local_4.userId);
                    this._container.inventory._Str_20389(_local_9._Str_2713, _local_9.name);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_OPEN_HOME_PAGE:
                    this._container.sessionDataManager.ejectAllFurniture(_local_3._Str_2394, _local_3.name);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_PICKUP_PET:
                    this._container.roomSession._Str_13781(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_MOUNT_PET:
                    this._container.roomSession._Str_21066(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_RIDING_PERMISSION:
                    this._container.roomSession._Str_21025(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_TOGGLE_PET_BREEDING_PERMISSION:
                    this._container.roomSession._Str_21562(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_DISMOUNT_PET:
                    this._container.roomSession._Str_19075(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_SADDLE_OFF:
                    this._container.roomSession._Str_21635(_local_2);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_PASS_CARRY_ITEM:
                    this._container.connection.send(new _Str_11770(_local_2));
                    break;
                case RoomWidgetUserActionMessage.RWUAM_GIVE_CARRY_ITEM_TO_PET:
                    this._container.connection.send(new _Str_10187(_local_2));
                    break;
                case RoomWidgetUserActionMessage.RWUAM_GIVE_WATER_TO_PET:
                    this._container.connection.send(new _Str_7251(_local_2, PetSupplementEnum._Str_9473));
                    break;
                case RoomWidgetUserActionMessage.RWUAM_GIVE_LIGHT_TO_PET:
                    this._container.connection.send(new _Str_7251(_local_2, PetSupplementEnum._Str_8421));
                    break;
                case RoomWidgetUserActionMessage.RWUAM_TREAT_PET:
                    this._container.connection.send(new _Str_8184(_local_2));
                    break;
                case RoomWidgetUserActionMessage.RWUAM_DROP_CARRY_ITEM:
                    this._container.connection.send(new _Str_10794());
                    break;
                case RoomWidgetFurniActionMessage.RWFUAM_ROTATE:
                    this._container.roomEngine.updateObjectWallItemData(_local_5, _local_6, RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
                    break;
                case RoomWidgetFurniActionMessage.RWFAM_MOVE:
                    this._container.roomEngine.updateObjectWallItemData(_local_5, _local_6, RoomObjectOperationEnum.OBJECT_MOVE);
                    break;
                case RoomWidgetFurniActionMessage.RWFAM_PICKUP:
                    this._Str_24845(_local_5, _local_6);
                    break;
                case RoomWidgetFurniActionMessage.RWFAM_EJECT:
                    this._container.roomEngine.updateObjectWallItemData(_local_5, _local_6, RoomObjectOperationEnum.OBJECT_EJECT);
                    break;
                case RoomWidgetFurniActionMessage.RWFAM_USE:
                    this._container.roomEngine.useRoomObjectInActiveRoom(_local_5, _local_6);
                    break;
                case RoomWidgetFurniActionMessage.RWFAM_SAVE_STUFF_DATA:
                    _local_10 = _local_7.objectData;
                    if (_local_10 != null)
                    {
                        _local_19 = new Map();
                        _local_20 = _local_10.split("\t");
                        if (_local_20 != null)
                        {
                            for each (_local_21 in _local_20)
                            {
                                _local_22 = _local_21.split("=", 2);
                                if (((!(_local_22 == null)) && (_local_22.length == 2)))
                                {
                                    _local_23 = _local_22[0];
                                    _local_24 = _local_22[1];
                                    _local_19.add(_local_23, _local_24);
                                }
                            }
                        }
                        this._container.roomEngine.modifyRoomObjectDataWithMap(_local_5, _local_6, RoomObjectOperationEnum.OBJECT_SAVE_STUFF_DATA, _local_19);
                        if (!_local_19.disposed)
                        {
                            _local_19.dispose();
                        }
                    }
                    break;
                case RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE:
                    if (((!(this._container.roomSession == null)) && (!(this._container.roomSession.userDataManager == null))))
                    {
                        this._container.roomSession.userDataManager.requestPetInfo(_local_2);
                    }
                    break;
                case RoomWidgetRoomTagSearchMessage.RWRTSM_ROOM_TAG_SEARCH:
                    _local_11 = (k as RoomWidgetRoomTagSearchMessage);
                    if (_local_11 == null)
                    {
                        return null;
                    }
                    this._container.navigator.performTagSearch(_local_11.tag);
                    break;
                case RoomWidgetGetBadgeDetailsMessage.RWGOI_MESSAGE_GET_BADGE_DETAILS:
                    _local_12 = (k as RoomWidgetGetBadgeDetailsMessage);
                    if (_local_12 == null)
                    {
                        return null;
                    }
                    this._container._Str_8097._Str_12867(_local_12.own, _local_12.groupId);
                    break;
                case RoomWidgetGetBadgeImageMessage.RWGOI_MESSAGE_GET_BADGE_IMAGE:
                    _local_13 = (k as RoomWidgetGetBadgeImageMessage);
                    if (_local_13 == null)
                    {
                        return null;
                    }
                    if (this._widget != null)
                    {
                        this._widget._Str_21919(_local_13.badgeId);
                    }
                    break;
                case RoomWidgetUserActionMessage.RWUAM_REPORT:
                    if (((this._container == null) || (this._container._Str_2602 == null))) break;
                    if (_local_3 == null) break;
                    this._container._Str_2602._Str_6694(_local_2, -1, null);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_REPORT_CFH_OTHER:
                    this._container._Str_2602._Str_6694(_local_2, 124, null);
                    break;
                case RoomWidgetPetCommandMessage.RWPCM_REQUEST_PET_COMMANDS:
                    _local_14 = (k as RoomWidgetPetCommandMessage);
                    this._container.roomSession._Str_21895(_local_14.id);
                    break;
                case RoomWidgetPetCommandMessage.RWPCM_PET_COMMAND:
                    _local_15 = (k as RoomWidgetPetCommandMessage);
                    this._container.roomSession._Str_17917(_local_15.value);
                    break;
                case RoomWidgetChangeMottoMessage.RWVM_CHANGE_MOTTO_MESSAGE:
                    _local_16 = (k as RoomWidgetChangeMottoMessage);
                    this._container.roomSession._Str_22140(_local_16.motto);
                    break;
                case RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE:
                    _local_17 = (k as RoomWidgetOpenProfileMessage);
                    if (this._container.habboTracking)
                    {
                        this._container.habboTracking.trackGoogle("extendedProfile", _local_17._Str_22577);
                    }
                    this._container.connection.send(new _Str_2553(_local_17.userId));
                    break;
                case RoomWidgetPresentOpenMessage.RWPOM_OPEN_PRESENT:
                    _local_18 = (k as RoomWidgetPresentOpenMessage);
                    if (((!(_local_18 == null)) && (!(this._widget == null))))
                    {
                        _local_25 = this._widget.furniData;
                        if (((!(_local_25 == null)) && (_local_25.id == _local_18._Str_1577)))
                        {
                            if (this._widget._Str_25620())
                            {
                                this._widget.close();
                            }
                        }
                    }
                    break;
                case RoomWidgetUserActionMessage.RWUAM_AMBASSADOR_ALERT_USER:
                    this._container.roomSession._Str_18152(_local_3._Str_2394);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_AMBASSADOR_KICK_USER:
                    this._container.roomSession._Str_15299(_local_3._Str_2394);
                    break;
                case RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_2MIN:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 2);
                    break;
                case RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_10MIN:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 10);
                    break;
                case RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_60MIN:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 60);
                    break;
                case RoomWidgetUserActionMessage.AMBASSADOR_MUTE_USER_18HOUR:
                    this._container.roomSession._Str_5984(_local_3._Str_2394, 1080);
                    break;
            }
            return null;
        }

        private function _Str_24845(furniId:int, furniCategory:int):void
        {
            if (this._container != null)
            {
                if (((_Str_6093._Str_7070(furniId)) && (this._container.catalog.buildersClubEnabled)))
                {
                    if (this._widget.furniData.availableForBuildersClub)
                    {
                        this._container.roomEngine.updateObjectWallItemData(furniId, furniCategory, RoomObjectOperationEnum.OBJECT_PICKUP);
                    }
                    else
                    {
                        this._container.windowManager.confirm("${generic.alert.title}", "${room.confirm.not_in_warehouse}", 0, function (k:_Str_2910, _arg_2:WindowEvent):void
                        {
                            k.dispose();
                            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                            {
                                _container.roomEngine.updateObjectWallItemData(furniId, furniCategory, RoomObjectOperationEnum.OBJECT_PICKUP);
                            }
                        });
                    }
                }
                else
                {
                    this._container.roomEngine.updateObjectWallItemData(furniId, furniCategory, RoomObjectOperationEnum.OBJECT_PICKUP);
                }
            }
        }

        private function _Str_24376(k:RoomWidgetRoomObjectMessage):RoomWidgetUpdateEvent
        {
            var _local_2:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IRoomObject;
            var _local_8:String;
            var _local_9:RoomUserData;
            var _local_10:int;
            var _local_11:int;
            var _local_12:IFurnitureData;
            _local_2 = this._container.roomSession.roomId;
            var _local_3:String;
            switch (k.category)
            {
                case RoomObjectCategoryEnum.CONST_10:
                case RoomObjectCategoryEnum.CONST_20:
                    if (((this._container.events == null) || (this._container.roomEngine == null)))
                    {
                        return null;
                    }
                    _local_7 = this._container.roomEngine.getRoomObject(_local_2, k.id, k.category);
                    _local_8 = _local_7.getType();
                    if (_local_8.indexOf("poster") == 0)
                    {
                        _local_10 = int(_local_8.replace("poster", ""));
                        _local_3 = (("${poster_" + _local_10) + "_name}");
                        _local_5 = _local_7.getId();
                        _local_6 = -1;
                    }
                    else
                    {
                        _local_11 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                        if (k.category == RoomObjectCategoryEnum.CONST_10)
                        {
                            _local_12 = this._container.sessionDataManager.getFloorItemData(_local_11);
                        }
                        else
                        {
                            if (k.category == RoomObjectCategoryEnum.CONST_20)
                            {
                                _local_12 = this._container.sessionDataManager.getWallItemData(_local_11);
                            }
                        }
                        if (_local_12 == null)
                        {
                            return null;
                        }
                        _local_3 = _local_12.localizedName;
                        _local_5 = _local_7.getId();
                        _local_6 = _local_12.id;
                    }
                    break;
                case RoomObjectCategoryEnum.CONST_100:
                    if ((((((this._container.roomSession == null) || (this._container.sessionDataManager == null)) || (this._container.events == null)) || (this._container.roomEngine == null)) || (this._container.friendList == null)))
                    {
                        return null;
                    }
                    _local_9 = this._container.roomSession.userDataManager.getUserDataByIndex(k.id);
                    if (_local_9 == null)
                    {
                        return null;
                    }
                    _local_3 = _local_9.name;
                    _local_4 = _local_9.type;
                    _local_5 = _local_9._Str_2713;
                    _local_6 = _local_9._Str_2394;
                    break;
            }
            if (_local_3 != null)
            {
                this._container.events.dispatchEvent(new _Str_3735(_local_6, k.category, _local_3, _local_4, _local_5));
            }
            return null;
        }

        private function _Str_23400(k:RoomWidgetRoomObjectMessage):RoomWidgetUpdateEvent
        {
            var _local_3:RoomUserData;
            var _local_2:int = this._container.roomSession.roomId;
            switch (k.category)
            {
                case RoomObjectCategoryEnum.CONST_10:
                case RoomObjectCategoryEnum.CONST_20:
                    this._Str_23142(k, _local_2);
                    break;
                case RoomObjectCategoryEnum.CONST_100:
                    if ((((((this._container.roomSession == null) || (this._container.sessionDataManager == null)) || (this._container.events == null)) || (this._container.roomEngine == null)) || (this._container.friendList == null)))
                    {
                        return null;
                    }
                    _local_3 = this._container.roomSession.userDataManager.getUserDataByIndex(k.id);
                    if (_local_3 == null)
                    {
                        return null;
                    }
                    switch (_local_3.type)
                    {
                        case RoomObjectTypeEnum.PET:
                            this._Str_25299(_local_3._Str_2394);
                            break;
                        case RoomObjectTypeEnum.HABBO:
                            this._Str_22722(_local_2, k.id, k.category, _local_3);
                            break;
                        case RoomObjectTypeEnum.BOT:
                            this._Str_22312(_local_2, k.id, k.category, _local_3);
                            break;
                        case RoomObjectTypeEnum.RENTABLE_BOT:
                            this._Str_23115(_local_2, k.id, k.category, _local_3);
                            break;
                    }
                    break;
            }
            return null;
        }

        private function _Str_25299(k:int):void
        {
            var _local_2:Boolean = this.container.config.getBoolean("petSelect.enabled");
            if (_local_2)
            {
                this._container.connection.send(new _Str_11301(k));
            }
            this._container.roomSession.userDataManager.requestPetInfo(k);
        }

        private function _Str_22312(k:int, _arg_2:int, _arg_3:int, _arg_4:RoomUserData):void
        {
            var _local_5:String = RoomWidgetUpdateInfostandUserEvent.BOT;
            var _local_6:RoomWidgetUpdateInfostandUserEvent = new RoomWidgetUpdateInfostandUserEvent(_local_5);
            _local_6.name = _arg_4.name;
            _local_6.motto = _arg_4.custom;
            _local_6._Str_2394 = _arg_4._Str_2394;
            _local_6._Str_3313 = _arg_2;
            _local_6._Str_2908 = _arg_4.type;
            var _local_7:IRoomObject = this._container.roomEngine.getRoomObject(k, _arg_2, _arg_3);
            if (_local_7 != null)
            {
                _local_6._Str_3249 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
            }
            _local_6._Str_3246 = this._container.roomSession.isRoomController;
            _local_6._Str_3672 = this._container.roomSession._Str_3672;
            _local_6.roomControllerLevel = this._container.roomSession.roomControllerLevel;
            _local_6._Str_3529 = this._container.sessionDataManager.isGodMode;
            _local_6._Str_5990 = this._container.roomSession.isRoomController;
            var _local_8:Array = new Array();
            _local_8.push(RoomWidgetUpdateInfostandUserEvent._Str_7492);
            _local_6.badges = _local_8;
            _local_6.figure = _arg_4.figure;
            this._container.events.dispatchEvent(_local_6);
        }

        private function _Str_23115(k:int, _arg_2:int, _arg_3:int, _arg_4:RoomUserData):void
        {
            var _local_5:RoomWidgetRentrableBotInfostandUpdateEvent = new RoomWidgetRentrableBotInfostandUpdateEvent();
            _local_5.name = _arg_4.name;
            _local_5.motto = _arg_4.custom;
            _local_5._Str_2394 = _arg_4._Str_2394;
            _local_5._Str_3313 = _arg_2;
            _local_5.ownerId = _arg_4.ownerId;
            _local_5.ownerName = _arg_4.ownerName;
            _local_5._Str_2899 = _arg_4._Str_2899;
            var _local_6:IRoomObject = this._container.roomEngine.getRoomObject(k, _arg_2, _arg_3);
            if (_local_6 != null)
            {
                _local_5._Str_3249 = _local_6.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
            }
            _local_5._Str_3246 = this._container.roomSession.isRoomController;
            _local_5.roomControllerLevel = this._container.roomSession.roomControllerLevel;
            _local_5._Str_3529 = this._container.sessionDataManager.isGodMode;
            var _local_7:Array = new Array();
            _local_7.push(RoomWidgetUpdateInfostandUserEvent._Str_7492);
            _local_5.badges = _local_7;
            _local_5.figure = _arg_4.figure;
            this._container.events.dispatchEvent(_local_5);
        }

        private function _Str_22722(k:int, _arg_2:int, _arg_3:int, _arg_4:RoomUserData):void
        {
            var _local_5:String;
            var _local_6:RoomWidgetUpdateInfostandUserEvent;
            var _local_9:IFriend;
            var _local_10:Boolean;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Array;
            var _local_14:Number;
            var _local_15:Boolean;
            var _local_16:Boolean;
            _local_5 = RoomWidgetUpdateInfostandUserEvent.OWN_USER;
            if (_arg_4._Str_2394 != this._container.sessionDataManager.userId)
            {
                _local_5 = RoomWidgetUpdateInfostandUserEvent.PEER;
            }
            _local_6 = new RoomWidgetUpdateInfostandUserEvent(_local_5);
            _local_6._Str_4780 = this._container.roomSession._Str_4780;
            _local_6.name = _arg_4.name;
            _local_6.motto = _arg_4.custom;
            if (this._Str_7745)
            {
                _local_6.activityPoints = _arg_4.activityPoints;
            }
            _local_6._Str_2394 = _arg_4._Str_2394;
            _local_6._Str_3313 = _arg_2;
            _local_6._Str_2908 = RoomObjectTypeEnum.HABBO;
            var _local_7:IRoomObject = this._container.roomEngine.getRoomObject(k, _arg_2, _arg_3);
            if (_local_7 != null)
            {
                _local_6._Str_3249 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT);
            }
            if (_local_5 == RoomWidgetUpdateInfostandUserEvent.OWN_USER)
            {
                _local_6.realName = this._container.sessionDataManager.realName;
                _local_6._Str_4330 = this._container.sessionDataManager._Str_11198;
            }
            _local_6._Str_3246 = this._container.roomSession.isRoomController;
            _local_6._Str_3672 = this._container.roomSession._Str_3672;
            _local_6.roomControllerLevel = this._container.roomSession.roomControllerLevel;
            _local_6._Str_3529 = this._container.sessionDataManager.isGodMode;
            _local_6._Str_18096 = this._container.sessionDataManager._Str_4050;
            if (_local_5 == RoomWidgetUpdateInfostandUserEvent.PEER)
            {
                _local_6.canBeAskedForAFriend = this._container.friendList.canBeAskedForAFriend(_arg_4._Str_2394);
                _local_9 = this._container.friendList.getFriend(_arg_4._Str_2394);
                if (_local_9 != null)
                {
                    _local_6.realName = _local_9.realName;
                    _local_6.isFriend = true;
                }
                if (_local_7 != null)
                {
                    _local_14 = _local_7.getModel().getNumber(RoomObjectVariableEnum.FIGURE_FLAT_CONTROL);
                    if (!isNaN(_local_14))
                    {
                        _local_6._Str_5599 = _local_14;
                    }
                    _local_6._Str_6394 = this._Str_23100(_local_6);
                    _local_6._Str_5990 = this._Str_22729(_local_6);
                    _local_6._Str_6701 = this._Str_23573(_local_6);
                    Logger.log(((((((("Set moderation levels to " + _local_6.name) + "Muted: ") + _local_6._Str_6394) + ", Kicked: ") + _local_6._Str_5990) + ", Banned: ") + _local_6._Str_6701));
                }
                _local_6.isIgnored = this._container.sessionDataManager.isIgnored(_arg_4.name);
                _local_6.petRespectLeft = this._container.sessionDataManager.petRespectLeft;
                _local_10 = (!(this._container.sessionDataManager.systemShutDown));
                _local_11 = this._container.roomSession._Str_3827;
                if (!_local_10)
                {
                    _local_6._Str_5751 = false;
                }
                else
                {
                    switch (_local_11)
                    {
                        default:
                            _local_6._Str_5751 = false;
                            break;
                        case RoomTradingLevelEnum._Str_14475:
                            _local_15 = ((!(_local_6.roomControllerLevel == RoomControllerLevel.NONE)) && (!(_local_6.roomControllerLevel == RoomControllerLevel.GUILD_MEMBER)));
                            _local_16 = ((!(_local_6._Str_5599 == RoomControllerLevel.NONE)) && (!(_local_6._Str_5599 == RoomControllerLevel.GUILD_MEMBER)));
                            _local_6._Str_5751 = ((_local_15) || (_local_16));
                            break;
                        case RoomTradingLevelEnum._Str_9173:
                            _local_6._Str_5751 = true;
                    }
                }
                _local_6._Str_6622 = RoomWidgetUpdateInfostandUserEvent._Str_18400;
                if (!_local_10)
                {
                    _local_6._Str_6622 = RoomWidgetUpdateInfostandUserEvent._Str_14161;
                }
                if (_local_11 != RoomTradingLevelEnum._Str_9173)
                {
                    _local_6._Str_6622 = RoomWidgetUpdateInfostandUserEvent._Str_13798;
                }
                _local_12 = this._container.sessionDataManager.userId;
                _local_13 = this._container.sessionDataManager.getUserTags(_local_12);
                this._Str_16287(_local_12, _local_13);
            }
            _local_6.groupId = int(_arg_4._Str_4592);
            _local_6._Str_5235 = this._container.sessionDataManager.getGroupBadgeId(int(_arg_4._Str_4592));
            _local_6.groupName = _arg_4.groupName;
            _local_6.badges = this._container.roomSession.userDataManager.getUserBadges(_arg_4._Str_2394);
            _local_6.figure = _arg_4.figure;
            this._container.events.dispatchEvent(_local_6);
            var _local_8:Array = this._container.sessionDataManager.getUserTags(_arg_4._Str_2394);
            this._Str_16287(_arg_4._Str_2394, _local_8);
            this._container._Str_8097._Str_14387(_arg_4._Str_2394);
            this._container.connection.send(new _Str_8049(_arg_4._Str_2394));
        }

        private function _Str_23100(userInfo:RoomWidgetUpdateInfostandUserEvent):Boolean
        {
            var settingsFunction:Function = function (k:RoomWidgetUpdateInfostandUserEvent, _arg_2:_Str_2817):Boolean
            {
                switch (_arg_2._Str_7688)
                {
                    case _Str_2817._Str_5047:
                        return _Str_9213(k);
                    default:
                        return k.roomControllerLevel >= RoomControllerLevel.ROOM_OWNER;
                }
            }
            return this._Str_18027(userInfo, settingsFunction);
        }

        private function _Str_22729(userInfo:RoomWidgetUpdateInfostandUserEvent):Boolean
        {
            var settingsFunction:Function = function (k:RoomWidgetUpdateInfostandUserEvent, _arg_2:_Str_2817):Boolean
            {
                switch (_arg_2._Str_6332)
                {
                    case _Str_2817._Str_11537:
                        return true;
                    case _Str_2817._Str_5047:
                        return _Str_9213(k);
                    default:
                        return k.roomControllerLevel >= RoomControllerLevel.ROOM_OWNER;
                }
            }
            return this._Str_18027(userInfo, settingsFunction);
        }

        private function _Str_23573(userInfo:RoomWidgetUpdateInfostandUserEvent):Boolean
        {
            var settingsFunction:Function = function (k:RoomWidgetUpdateInfostandUserEvent, _arg_2:_Str_2817):Boolean
            {
                switch (_arg_2._Str_7772)
                {
                    case _Str_2817._Str_5047:
                        return _Str_9213(k);
                    default:
                        return k.roomControllerLevel >= RoomControllerLevel.ROOM_OWNER;
                }
            }
            return this._Str_18027(userInfo, settingsFunction);
        }

        private function _Str_18027(k:RoomWidgetUpdateInfostandUserEvent, _arg_2:Function):Boolean
        {
            if (!this._container.roomSession._Str_7411)
            {
                return false;
            }
            var _local_3:Boolean;
            var _local_4:_Str_2817 = this._container.roomSession._Str_4418;
            if (_local_4 != null)
            {
                _local_3 = _arg_2(k, _local_4);
            }
            return (_local_3) && (k._Str_5599 < RoomControllerLevel.ROOM_OWNER);
        }

        private function _Str_9213(k:RoomWidgetUpdateInfostandUserEvent):Boolean
        {
            if (k._Str_3672)
            {
                return k.roomControllerLevel >= RoomControllerLevel.GUILD_ADMIN;
            }
            return k.roomControllerLevel >= RoomControllerLevel.GUEST;
        }

        private function _Str_23142(k:RoomWidgetRoomObjectMessage, _arg_2:int):void
        {
            var _local_13:int;
            var _local_14:int;
            var _local_15:IFurnitureData;
            var _local_16:int;
            var _local_17:String;
            var _local_18:String;
            var _local_19:String;
            var _local_20:IPlayListController;
            var _local_21:String;
            var _local_22:ISongInfo;
            if (((this._container.events == null) || (this._container.roomEngine == null)))
            {
                return;
            }
            if (k.id < 0)
            {
                return;
            }
            var _local_3:RoomWidgetFurniInfostandUpdateEvent = new RoomWidgetFurniInfostandUpdateEvent(RoomWidgetFurniInfostandUpdateEvent.FURNI);
            _local_3.id = k.id;
            _local_3.category = k.category;
            var _local_4:IRoomObject = this._container.roomEngine.getRoomObject(_arg_2, k.id, k.category);
            if (!_local_4)
            {
                return;
            }
            var _local_5:IRoomObjectModel = _local_4.getModel();
            if (_local_5.getString(RoomWidgetEnumItemExtradataParameter.INFOSTAND_EXTRA_PARAM) != null)
            {
                _local_3.extraParam = _local_5.getString(RoomWidgetEnumItemExtradataParameter.INFOSTAND_EXTRA_PARAM);
            }
            var _local_6:int = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT);
            var _local_7:IStuffData = StuffDataFactory._Str_6438(_local_6);
            _local_7.initializeFromRoomObjectModel(_local_5);
            _local_3.stuffData = _local_7;
            var _local_8:String = _local_4.getType();
            if (_local_8.indexOf("poster") == 0)
            {
                _local_13 = int(_local_8.replace("poster", ""));
                _local_3.name = (("${poster_" + _local_13) + "_name}");
                _local_3.description = (("${poster_" + _local_13) + "_desc}");
            }
            else
            {
                _local_14 = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                if (k.category == RoomObjectCategoryEnum.CONST_10)
                {
                    _local_15 = this._container.sessionDataManager.getFloorItemData(_local_14);
                }
                else
                {
                    if (k.category == RoomObjectCategoryEnum.CONST_20)
                    {
                        _local_15 = this._container.sessionDataManager.getWallItemData(_local_14);
                    }
                }
                if (_local_15 != null)
                {
                    _local_3.name = _local_15.localizedName;
                    _local_3.description = _local_15.description;
                    _local_3.purchaseOfferId = _local_15.purchaseOfferId;
                    _local_3.purchaseCouldBeUsedForBuyout = _local_15.purchaseCouldBeUsedForBuyout;
                    _local_3.rentOfferId = _local_15.rentOfferId;
                    _local_3.rentCouldBeUsedForBuyout = _local_15.rentCouldBeUsedForBuyout;
                    _local_3.availableForBuildersClub = _local_15.availableForBuildersClub;
                    if (((!(this._container._Str_10421 == null)) && (k.category == RoomObjectCategoryEnum.CONST_10)))
                    {
                        this._container._Str_10421._Str_15677(_local_4.getId(), _local_15.localizedName);
                    }
                }
            }
            if (_local_8.indexOf("post_it") > -1)
            {
                _local_3._Str_17541 = true;
            }
            var _local_9:int = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_EXPIRY_TIME);
            var _local_10:int = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_EXPIRTY_TIMESTAMP);
            _local_3.expiration = ((_local_9 < 0) ? _local_9 : Math.max(0, (_local_9 - ((getTimer() - _local_10) / 1000))));
            var _local_11:ImageResult = this._container.roomEngine.getRoomObjectImage(_arg_2, k.id, k.category, new Vector3d(180), 64, null);
            if ((((_local_11.data == null) || (_local_11.data.width > 140)) || (_local_11.data.height > 200)))
            {
                _local_11 = this._container.roomEngine.getRoomObjectImage(_arg_2, k.id, k.category, new Vector3d(180), 1, null);
            }
            _local_3.image = _local_11.data;
            _local_3._Str_2770 = (k.category == RoomObjectCategoryEnum.CONST_20);
            _local_3.isRoomController = this._container.roomSession.isRoomController;
            _local_3.roomControllerLevel = this._container.roomSession.roomControllerLevel;
            _local_3.isGodMode = this._container.sessionDataManager.isGodMode;
            _local_3.ownerId = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_OWNER_ID);
            _local_3.ownerName = _local_5.getString(RoomObjectVariableEnum.FURNITURE_OWNER_NAME);
            _local_3.usagePolicy = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_USAGE_POLICY);
            var _local_12:int = int(_local_5.getNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_GUILD_ID));
            if (_local_12 != 0)
            {
                _local_3.groupId = _local_12;
                this.container.connection.send(new _Str_2863(_local_12, false));
            }
            if (this._container.isOwnerOfFurniture(_local_4))
            {
                _local_3._Str_3233 = true;
            }
            this._container.events.dispatchEvent(_local_3);
            if (((!(_local_3.extraParam == null)) && (_local_3.extraParam.length > 0)))
            {
                _local_16 = -1;
                _local_17 = "";
                _local_18 = "";
                _local_19 = "";
                if (_local_3.extraParam == RoomWidgetEnumItemExtradataParameter.JUKEBOX)
                {
                    _local_20 = this._musicController._Str_6500();
                    if (_local_20 != null)
                    {
                        _local_16 = _local_20._Str_13794;
                        _local_19 = RoomWidgetSongUpdateEvent.PLAYING_CHANGED;
                    }
                }
                else
                {
                    if (_local_3.extraParam.indexOf(RoomWidgetEnumItemExtradataParameter.SONGDISK) == 0)
                    {
                        _local_21 = _local_3.extraParam.substr(RoomWidgetEnumItemExtradataParameter.SONGDISK.length);
                        _local_16 = parseInt(_local_21);
                        _local_19 = RoomWidgetSongUpdateEvent.DATA_RECEIVED;
                    }
                }
                if (_local_16 != -1)
                {
                    _local_22 = this._musicController._Str_3255(_local_16);
                    if (_local_22 != null)
                    {
                        _local_17 = _local_22.name;
                        _local_18 = _local_22.creator;
                    }
                    this._container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(_local_19, _local_16, _local_17, _local_18));
                }
            }
        }

        public function _Str_2609():Array
        {
            return [RoomSessionUserBadgesEvent.RSUBE_BADGES];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionUserBadgesEvent;
            switch (k.type)
            {
                case RoomSessionUserBadgesEvent.RSUBE_BADGES:
                    _local_2 = (k as RoomSessionUserBadgesEvent);
                    if (((!(_local_2 == null)) && (!(this._widget == null))))
                    {
                        this._widget._Str_22739(_local_2.userId, _local_2.badges);
                    }
                    return;
            }
        }

        private function _Str_7983(k:RoomSessionUserTagsEvent):void
        {
            this._Str_16287(k.userId, k.tags);
        }

        private function _Str_16287(k:int, _arg_2:Array):void
        {
            if (_arg_2 == null)
            {
                return;
            }
            var _local_3:Boolean;
            if (this._container.sessionDataManager != null)
            {
                _local_3 = (k == this._container.sessionDataManager.userId);
            }
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                this._container.events.dispatchEvent(new RoomWidgetUserTagsUpdateEvent(k, _arg_2, _local_3));
            }
        }

        private function _Str_8471(k:RoomSessionUserFigureUpdateEvent):void
        {
            if (this._container == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (k.userId < 0)
            {
                return;
            }
            var _local_2:RoomUserData = this._container.roomSession.userDataManager.getUserDataByIndex(k.userId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:int = _local_2._Str_2394;
            var _local_4:BitmapData;
            var _local_5:* = (_local_3 == this._container.sessionDataManager.userId);
            this._widget._Str_17133(_local_3, k.figure, k.activityPoints, k.customInfo, _local_5);
        }

        private function onPetInfo(k:RoomSessionPetInfoUpdateEvent):void
        {
            var _local_10:Boolean;
            var _local_11:RoomWidgetPetInfostandUpdateEvent;
            var _local_12:IRoomSession;
            var _local_2:RoomPetData = k._Str_24727;
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:RoomUserData = this._container.roomSession.userDataManager._Str_8631(_local_2.id);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:String = _local_3.figure;
            var _local_5:int = this.getPetType(_local_4);
            var _local_6:int = this._Str_25548(_local_4);
            var _local_7:String;
            if (_local_5 == PetTypeEnum.MONSTERPLANT)
            {
                if (_local_2.level >= _local_2._Str_20651)
                {
                    _local_7 = "std";
                }
                else
                {
                    _local_7 = ("grw" + _local_2.level);
                }
            }
            var _local_8:String = (_local_4 + ((_local_7 != null) ? ("/posture=" + _local_7) : ""));
            var _local_9:BitmapData = (this._cachedPetImages.getValue(_local_8) as BitmapData);
            if (_local_9 == null)
            {
                _local_9 = this.getPetImage(_local_4, _local_7);
                this._cachedPetImages.add(_local_8, _local_9);
            }
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_10 = (_local_2.ownerId == this._container.sessionDataManager.userId);
                _local_11 = new RoomWidgetPetInfostandUpdateEvent(_local_5, _local_6, _local_3.name, _local_2.id, _local_9, _local_10, _local_2.ownerId, _local_2.ownerName, _local_3._Str_2713, _local_2.rarityLevel);
                _local_11.level = _local_2.level;
                _local_11.maximumLevel = _local_2.maximumLevel;
                _local_11.experience = _local_2.experience;
                _local_11.levelExperienceGoal = _local_2.levelExperienceGoal;
                _local_11.energy = _local_2.energy;
                _local_11.maximumEnergy = _local_2.maximumEnergy;
                _local_11.happyness = _local_2.happyness;
                _local_11.maximumHappyness = _local_2.maximumHappyness;
                _local_11.respect = _local_2.respect;
                _local_11._Str_2985 = this._container.sessionDataManager._Str_2985;
                _local_11.age = _local_2.age;
                _local_11.saddle = _local_2.saddle;
                _local_11.rider = _local_2.rider;
                _local_11.breedable = _local_2.breedable;
                _local_11.fullyGrown = _local_2.fullyGrown;
                _local_11.dead = _local_2.dead;
                _local_11.rarityLevel = _local_2.rarityLevel;
                _local_11._Str_3307 = _local_2._Str_3307;
                _local_11._Str_5114 = false;
                _local_11.publiclyRideable = _local_2.publiclyRideable;
                _local_11.maximumTimeToLive = _local_2.maximumTimeToLive;
                _local_11.remainingTimeToLive = _local_2.remainingTimeToLive;
                _local_11.remainingGrowTime = _local_2.remainingGrowTime;
                _local_11.publiclyBreedable = _local_2.publiclyBreedable;
                _local_12 = this._container.roomSession;
                if (_local_10)
                {
                    _local_11._Str_5114 = true;
                }
                else
                {
                    if ((((_local_12.isRoomController) || (this._container.sessionDataManager.isGodMode)) || (_local_12.roomControllerLevel >= RoomControllerLevel.GUEST)))
                    {
                        _local_11._Str_5114 = true;
                    }
                }
                this._container.events.dispatchEvent(_local_11);
            }
        }

        private function _Str_6212(k:RoomSessionPetFigureUpdateEvent):void
        {
            var _local_4:RoomWidgetPetFigureUpdateEvent;
            var _local_2:String = k.figure;
            var _local_3:BitmapData = (this._cachedPetImages.getValue(_local_2) as BitmapData);
            if (_local_3 == null)
            {
                _local_3 = this.getPetImage(_local_2);
                this._cachedPetImages.add(_local_2, _local_3);
            }
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_4 = new RoomWidgetPetFigureUpdateEvent(k.id, _local_3);
                this._container.events.dispatchEvent(_local_4);
            }
        }

        private function onPetBreedingResult(k:RoomSessionPetBreedingResultEvent):void
        {
            var _local_2:_Str_3801;
            var _local_3:_Str_3801;
            var _local_4:_Str_4736;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = new _Str_3801();
                _local_2.stuffId = k._Str_3713.stuffId;
                _local_2.classId = k._Str_3713.classId;
                _local_2.productCode = k._Str_3713.productCode;
                _local_2.userId = k._Str_3713.userId;
                _local_2.userName = k._Str_3713.userName;
                _local_2.rarityLevel = k._Str_3713.rarityLevel;
                _local_2._Str_4788 = k._Str_3713._Str_4788;
                _local_3 = new _Str_3801();
                _local_3.stuffId = k._Str_5840.stuffId;
                _local_3.classId = k._Str_5840.classId;
                _local_3.productCode = k._Str_5840.productCode;
                _local_3.userId = k._Str_5840.userId;
                _local_3.userName = k._Str_5840.userName;
                _local_3.rarityLevel = k._Str_5840.rarityLevel;
                _local_3._Str_4788 = k._Str_5840._Str_4788;
                _local_4 = new _Str_4736(_local_2, _local_3);
                this._container.events.dispatchEvent(_local_4);
            }
        }

        private function onPetBreedingEvent(k:RoomSessionPetBreedingEvent):void
        {
            var _local_2:_Str_3919;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = new _Str_3919();
                _local_2.state = k.state;
                _local_2.ownPetId = k.ownPetId;
                _local_2.otherPetId = k.otherPetId;
                this._container.events.dispatchEvent(_local_2);
            }
        }

        private function _Str_20173(k:RoomSessionConfirmPetBreedingEvent):void
        {
            var _local_2:_Str_3575;
            var _local_3:_Str_3575;
            var _local_4:Array;
            var _local_5:_Str_5753;
            var _local_6:_Str_4624;
            var _local_7:_Str_5914;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = new _Str_3575();
                _local_2._Str_5277 = k.pet1._Str_5277;
                _local_2.name = k.pet1.name;
                _local_2.level = k.pet1.level;
                _local_2.figure = k.pet1.figure;
                _local_2.owner = k.pet1.owner;
                _local_3 = new _Str_3575();
                _local_3._Str_5277 = k.pet2._Str_5277;
                _local_3.name = k.pet2.name;
                _local_3.level = k.pet2.level;
                _local_3.figure = k.pet2.figure;
                _local_3.owner = k.pet2.owner;
                _local_4 = [];
                for each (_local_5 in k.rarityCategories)
                {
                    _local_7 = new _Str_5914();
                    _local_7._Str_12554 = _local_5._Str_12554;
                    _local_7.breeds = _local_5.breeds.concat();
                    _local_4.push(_local_7);
                }
                _local_6 = new _Str_4624(k.nestId, _local_2, _local_3, _local_4, k.resultPetTypeId);
                this._container.events.dispatchEvent(_local_6);
            }
        }

        private function _Str_20716(k:RoomSessionConfirmPetBreedingResultEvent):void
        {
            var _local_2:_Str_3962;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = new _Str_3962(k.breedingNestStuffId, k.result);
                this._container.events.dispatchEvent(_local_2);
            }
        }

        private function _Str_12211(k:RoomSessionPetCommandsUpdateEvent):void
        {
            var _local_2:RoomWidgetPetCommandsUpdateEvent;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = new RoomWidgetPetCommandsUpdateEvent(k.id, k.commands, k.enabledCommands);
                this._container.events.dispatchEvent(_local_2);
            }
        }

        private function _Str_20602(k:RoomSessionFavouriteGroupUpdateEvent):void
        {
            if (this._widget)
            {
                this._widget._Str_22447(k.roomIndex, k.habboGroupId, k.status, k.habboGroupName);
            }
        }

        public function update():void
        {
        }

        private function getPetImage(k:String, _arg_2:String=null):BitmapData
        {
            var _local_3:BitmapData;
            var _local_4:PetFigureData = new PetFigureData(k);
            var _local_5:uint;
            var _local_6:ImageResult = this._container.roomEngine.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color, new Vector3d(90), 64, null, true, _local_5, _local_4._Str_3542, _arg_2);
            if (_local_6 != null)
            {
                _local_3 = _local_6.data;
            }
            if (_local_3 == null)
            {
                _local_3 = new BitmapData(30, 30, false, 4289374890);
            }
            return _local_3;
        }

        private function getPetType(k:String):int
        {
            return this._Str_19610(k, 0);
        }

        private function _Str_25548(k:String):int
        {
            return this._Str_19610(k, 1);
        }

        private function getPetColor(k:String):int
        {
            var _local_2:Array = k.split(" ");
            if (_local_2.length > 2)
            {
                return parseInt(_local_2[2], 16);
            }
            return 0xFFFFFF;
        }

        private function _Str_19610(k:String, _arg_2:int):int
        {
            var _local_3:Array;
            if (k != null)
            {
                _local_3 = k.split(" ");
                if (_local_3.length > _arg_2)
                {
                    return int(_local_3[_arg_2]);
                }
            }
            return -1;
        }

        private function _Str_14970(k:NowPlayingEvent):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:String;
            var _local_5:ISongInfo;
            if (this._musicController != null)
            {
                _local_2 = k.id;
                _local_3 = "";
                _local_4 = "";
                if (_local_2 != -1)
                {
                    _local_5 = this._musicController._Str_3255(_local_2);
                    if (_local_5 != null)
                    {
                        _local_3 = _local_5.name;
                        _local_4 = _local_5.creator;
                    }
                }
                this._container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(RoomWidgetSongUpdateEvent.PLAYING_CHANGED, _local_2, _local_3, _local_4));
            }
        }

        private function _Str_3530(k:SongInfoReceivedEvent):void
        {
            var _local_2:ISongInfo;
            if (this._musicController != null)
            {
                _local_2 = this._musicController._Str_3255(k.id);
                if (_local_2 != null)
                {
                    this._container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(RoomWidgetSongUpdateEvent.DATA_RECEIVED, k.id, _local_2.name, _local_2.creator));
                }
            }
        }

        private function _Str_22283(k:_Str_5269):void
        {
            if (((this._widget) && (this._widget.mainWindow.visible)))
            {
                this._widget.setRelationshipStatus(k.userId, k._Str_14823);
            }
        }

        public function get _Str_7745():Boolean
        {
            return ((!(this._container == null)) && (this._container.config)) && (this._container.config.getBoolean("activity.point.display.enabled"));
        }

        public function _Str_23922(k:Map):void
        {
            if (this._container.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569))
            {
                this._container.connection.send(new _Str_5686(this._widget.furniData.id, k));
            }
        }
    }
}
