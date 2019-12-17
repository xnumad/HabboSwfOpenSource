package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.session.events.UserNameUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetStatusUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetLevelUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionNestBreedingSuccessEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListAddOrUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_6132;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetInventoryUpdatedMessage;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.ui.widget.events._Str_4828;
    import com.sulake.habbo.ui.widget.events._Str_4818;
    import com.sulake.habbo.ui.widget.events._Str_5393;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage;
    import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionDanceEvent;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_7783;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.ui.widget.events._Str_3858;

    public class AvatarInfoWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:AvatarInfoWidget;
        private var _furniListInsertListener:IMessageEvent;
        private var _respectNotificationListener:IMessageEvent;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set widget(k:AvatarInfoWidget):void
        {
            this._widget = k;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._respectNotificationListener) && (this._container.connection)))
                {
                    this._container.connection.removeMessageEvent(this._respectNotificationListener);
                }
                this.container = null;
                this._widget = null;
                if (this._furniListInsertListener != null)
                {
                    this._furniListInsertListener.dispose();
                    this._furniListInsertListener = null;
                }
                this._respectNotificationListener = null;
                this._disposed = true;
            }
        }

        public function get type():String
        {
            return RoomWidgetEnum.AVATAR_INFO;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function get roomEngine():IRoomEngine
        {
            return (this._container) ? this._container.roomEngine : null;
        }

        public function get roomSession():IRoomSession
        {
            return (this._container) ? this._container.roomSession : null;
        }

        public function get friendList():IHabboFriendsList
        {
            return (this._container) ? this._container.friendList : null;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            if ((((this._container) && (this._container.toolbar)) && (this._container.toolbar.events)))
            {
                this._container.toolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClicked);
            }
            if ((((this._container) && (this._container.sessionDataManager)) && (this._container.sessionDataManager.events)))
            {
                this._container.sessionDataManager.events.removeEventListener(UserNameUpdateEvent.UNUE_NAME_UPDATED, this._Str_21944);
            }
            if ((((this._container) && (this._container.roomSessionManager)) && (this._container.roomSessionManager.events)))
            {
                this._container.roomSessionManager.events.removeEventListener(RoomSessionPetStatusUpdateEvent.RSPFUE_PET_STATUS_UPDATE, this.onPetStatusUpdate);
                this._container.roomSessionManager.events.removeEventListener(RoomSessionPetLevelUpdateEvent.RSPLUE_PET_LEVEL_UPDATE, this.onPetLevelUpdate);
                this._container.roomSessionManager.events.removeEventListener(RoomSessionNestBreedingSuccessEvent.RSPFUE_NEST_BREEDING_SUCCESS, this._Str_20584);
            }
            if (((this._container) && (this._container.connection)))
            {
                this._container.connection.removeMessageEvent(this._furniListInsertListener);
            }
            if ((((this._container) && (this._container.connection)) && (this._respectNotificationListener)))
            {
                this._container.connection.removeMessageEvent(this._respectNotificationListener);
            }
            this._container = k;
            if (k == null)
            {
                return;
            }
            if (this._furniListInsertListener == null)
            {
                this._furniListInsertListener = new FurniListAddOrUpdateEvent(this._Str_11630);
            }
            if (((!(this._respectNotificationListener)) && (this._container.connection)))
            {
                this._respectNotificationListener = new _Str_6132(this._Str_22329);
                this._container.connection.addMessageEvent(this._respectNotificationListener);
            }
            if ((((this._container) && (this._container.toolbar)) && (this._container.toolbar.events)))
            {
                this._container.toolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClicked);
            }
            if ((((this._container) && (this._container.sessionDataManager)) && (this._container.sessionDataManager.events)))
            {
                this._container.sessionDataManager.events.addEventListener(UserNameUpdateEvent.UNUE_NAME_UPDATED, this._Str_21944);
            }
            if ((((this._container) && (this._container.roomSessionManager)) && (this._container.roomSessionManager.events)))
            {
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetStatusUpdateEvent.RSPFUE_PET_STATUS_UPDATE, this.onPetStatusUpdate);
                this._container.roomSessionManager.events.addEventListener(RoomSessionNestBreedingSuccessEvent.RSPFUE_NEST_BREEDING_SUCCESS, this._Str_20584);
                this._container.roomSessionManager.events.addEventListener(RoomSessionPetLevelUpdateEvent.RSPLUE_PET_LEVEL_UPDATE, this.onPetLevelUpdate);
            }
            if (((this._container) && (this._container.connection)))
            {
                this._container.connection.addMessageEvent(this._furniListInsertListener);
            }
        }

        private function _Str_11630(k:IMessageEvent):void
        {
            if (this._container != null)
            {
                if (this._container.events != null)
                {
                    this._container.events.dispatchEvent(new RoomWidgetInventoryUpdatedMessage(RoomWidgetInventoryUpdatedMessage.RWIUM_INVENTORY_UPDATED));
                }
            }
        }

        private function onToolbarClicked(k:HabboToolbarEvent):void
        {
            if (k._Str_3378 == HabboToolbarIconEnum.MEMENU)
            {
                if (this.container.config.getBoolean("simple.memenu.enabled"))
                {
                    this._widget._Str_19679();
                }
                else
                {
                    this._Str_19177();
                }
            }
        }

        private function _Str_21944(k:UserNameUpdateEvent):void
        {
            this._widget.close();
        }

        private function onPetStatusUpdate(k:RoomSessionPetStatusUpdateEvent):void
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:RoomUserData;
            var _local_7:_Str_4828;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = k.canBreed;
                _local_3 = k.canHarvest;
                _local_4 = k.canRevive;
                _local_5 = k.hasBreedingPermission;
                _local_6 = this._Str_19958(k._Str_2508);
                if (_local_6 == null)
                {
                    Logger.log((("Could not find pet with the id: " + k._Str_2508) + " given by petStatusUpdate"));
                    return;
                }
                _local_7 = new _Str_4828(_local_6._Str_2713, _local_2, _local_3, _local_4, _local_5);
                this._container.events.dispatchEvent(_local_7);
            }
        }

        private function onPetLevelUpdate(k:RoomSessionPetLevelUpdateEvent):void
        {
            var _local_2:int;
            var _local_3:RoomUserData;
            var _local_4:_Str_4818;
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                _local_2 = k.level;
                _local_3 = this._Str_19958(k._Str_2508);
                _local_4 = new _Str_4818(_local_3._Str_2713, _local_2);
                this._container.events.dispatchEvent(_local_4);
            }
        }

        private function _Str_19177():void
        {
            var k:int = this._container.sessionDataManager.userId;
            var _local_2:String = this._container.sessionDataManager.userName;
            var _local_3:Boolean = this._container.sessionDataManager._Str_11198;
            var _local_4:RoomUserData = this._container.roomSession.userDataManager.getUserData(k);
            if (_local_4)
            {
                this._container.events.dispatchEvent(new _Str_5393(k, _local_2, _local_4.type, _local_4._Str_2713, _local_3));
            }
        }

        public function _Str_2607():Array
        {
            var k:Array = [];
            k.push(RoomWidgetRoomObjectMessage.RWROM_GET_OWN_CHARACTER_INFO);
            k.push(RoomWidgetUserActionMessage.RWUAM_START_NAME_CHANGE);
            k.push(RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE);
            k.push(RoomWidgetUseProductMessage.RWUPM_PET_PRODUCT);
            k.push(RoomWidgetUserActionMessage.RWUAM_REQUEST_BREED_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_HARVEST_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_REVIVE_PET);
            k.push(RoomWidgetUserActionMessage.RWUAM_COMPOST_PLANT);
            return k;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(RoomSessionUserDataUpdateEvent.RSUDUE_USER_DATA_UPDATED);
            k.push(RoomSessionDanceEvent.RSDE_DANCE);
            k.push(RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY);
            k.push(RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_ROOM);
            return k;
        }

        public function processWidgetMessage(message:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var userId:int;
            var userData:RoomUserData;
            var useProductMessage:RoomWidgetUseProductMessage;
            var localization:IHabboLocalizationManager;
            if (!message)
            {
                return null;
            }
            userId = 0;
            var userAction:RoomWidgetUserActionMessage = (message as RoomWidgetUserActionMessage);
            if (userAction != null)
            {
                userId = userAction.userId;
            }
            switch (message.type)
            {
                case RoomWidgetRoomObjectMessage.RWROM_GET_OWN_CHARACTER_INFO:
                    this._Str_19177();
                    break;
                case RoomWidgetUserActionMessage.RWUAM_START_NAME_CHANGE:
                    this._container._Str_2602._Str_1131();
                    break;
                case RoomWidgetUserActionMessage.RWUAM_REQUEST_PET_UPDATE:
                    this._widget._Str_25663 = false;
                    break;
                case RoomWidgetUseProductMessage.RWUPM_PET_PRODUCT:
                    useProductMessage = (message as RoomWidgetUseProductMessage);
                    if (useProductMessage)
                    {
                        this._container.roomSession._Str_21525(useProductMessage._Str_2713, useProductMessage._Str_2508);
                    }
                    break;
                case RoomWidgetUserActionMessage.RWUAM_HARVEST_PET:
                    this._container.roomSession._Str_19090(userId);
                    break;
                case RoomWidgetUserActionMessage.RWUAM_REVIVE_PET:
                    break;
                case RoomWidgetUserActionMessage.RWUAM_COMPOST_PLANT:
                    localization = this._widget.catalog.localization;
                    this._widget.windowManager.confirm(localization.getLocalization("monsterplant.confirm.title.compost"), localization.getLocalization("monsterplant.confirm.desc.compost"), 0, function onCompostConfirmed (k:_Str_2910, _arg_2:WindowEvent):void
                    {
                        k.dispose();
                        if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
                        {
                            _container.roomSession._Str_21305(userId);
                        }
                    });
                    break;
                case RoomWidgetUserActionMessage.RWUAM_REQUEST_BREED_PET:
                    this._Str_25013(userId);
                    break;
                case RoomWidgetInventoryUpdatedMessage.RWIUM_INVENTORY_UPDATED:
                    break;
            }
            return null;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionDanceEvent;
            var _local_3:RoomUserData;
            var _local_4:RoomUserData;
            switch (k.type)
            {
                case RoomSessionUserDataUpdateEvent.RSUDUE_USER_DATA_UPDATED:
                    this._container.events.dispatchEvent(new _Str_7783());
                    for each (_local_3 in RoomSessionUserDataUpdateEvent(k)._Str_24272)
                    {
                        if (this.friendList._Str_9287().indexOf(_local_3.name) > -1)
                        {
                            this._widget._Str_21156(_local_3, _local_3._Str_2713);
                        }
                    }
                    return;
                case RoomSessionDanceEvent.RSDE_DANCE:
                    _local_2 = (k as RoomSessionDanceEvent);
                    if ((((((_local_2) && (this._widget)) && (this.container)) && (this.container.roomSession)) && (this.container.roomSession.userDataManager)))
                    {
                        _local_4 = this.container.roomSession.userDataManager.getUserData(this.container.sessionDataManager.userId);
                        if (((_local_4) && (_local_2.userId == _local_4._Str_2713)))
                        {
                            this._widget._Str_4107 = (!(_local_2._Str_8263 == 0));
                        }
                    }
                    return;
                case RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_INVENTORY:
                    this._Str_23199((k as RoomEngineUseProductEvent).inventoryStripId, (k as RoomEngineUseProductEvent).furnitureTypeId);
                    return;
                case RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_ROOM:
                    this._Str_23807((k as RoomEngineUseProductEvent)._Str_1577);
                    return;
            }
        }

        private function _Str_25013(k:int):void
        {
            Logger.log(("Show breed menu. finally: " + k));
            if ((((this._container == null) || (this._container.roomSession == null)) || (this._container.roomEngine == null)))
            {
                return;
            }
            if (this._container.roomSession.userDataManager == null)
            {
                return;
            }
            var _local_2:int = this._container.roomSession.roomId;
            var _local_3:int = this._container.sessionDataManager.userId;
            var _local_4:RoomUserData = this._container.roomSession.userDataManager._Str_6958(k, RoomObjectTypeEnum.PET);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:Array = _local_4.figure.split(" ");
            var _local_6:int = ((_local_5.length > 0) ? _local_5[0] : -1);
            this._Str_25028(_local_2, k, _local_6, _local_4._Str_2713, _local_3);
        }

        public function update():void
        {
        }

        private function _Str_20584(k:RoomSessionNestBreedingSuccessEvent):void
        {
            if (((!(this._container == null)) && (!(this._container.events == null))))
            {
                this._widget._Str_24481(k._Str_2508, k.rarityCategory);
            }
        }

        public function getFurniData(k:IRoomObject):IFurnitureData
        {
            var _local_2:IFurnitureData;
            var _local_3:int;
            if (k)
            {
                _local_3 = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_TYPE_ID);
                _local_2 = this._container.sessionDataManager.getFloorItemData(_local_3);
            }
            return _local_2;
        }

        private function _Str_23199(k:int, _arg_2:int):void
        {
            if ((((this._container == null) || (this._container.roomSession == null)) || (this._container.roomEngine == null)))
            {
                return;
            }
            if (this._container.roomSession.userDataManager == null)
            {
                return;
            }
            var _local_3:int = this._container.roomSession.roomId;
            var _local_4:int = this._container.sessionDataManager.userId;
            var _local_5:IFurnitureData = this._container.sessionDataManager.getFloorItemData(_arg_2);
            if (!_local_5)
            {
                return;
            }
            var _local_6:Array = _local_5.customParams.split(" ");
            var _local_7:int = ((_local_6.length > 0) ? parseInt(_local_6[0]) : -1);
            if (_local_7 == -1)
            {
                return;
            }
            this._Str_21985(_local_3, _arg_2, _local_7, _local_5.category, _local_4, k);
        }

        private function _Str_23807(k:int):void
        {
            if ((((this._container == null) || (this._container.roomSession == null)) || (this._container.roomEngine == null)))
            {
                return;
            }
            if (this._container.roomSession.userDataManager == null)
            {
                return;
            }
            var _local_2:int = this._container.roomSession.roomId;
            var _local_3:IRoomObject = this._container.roomEngine.getRoomObject(_local_2, k, RoomObjectCategoryEnum.CONST_10);
            var _local_4:Boolean = this._container.isOwnerOfFurniture(_local_3);
            if (!_local_4)
            {
                return;
            }
            var _local_5:int = this._container.getFurnitureOwnerId(_local_3);
            var _local_6:IFurnitureData = this.getFurniData(_local_3);
            var _local_7:Array = _local_6.customParams.split(" ");
            var _local_8:int = ((_local_7.length > 0) ? parseInt(_local_7[0]) : -1);
            if (_local_8 == -1)
            {
                return;
            }
            this._Str_21985(_local_2, k, _local_8, _local_6.category, _local_5);
        }

        private function _Str_21985(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int=-1):void
        {
            var _local_8:IRoomObject;
            var _local_12:RoomUserData;
            var _local_13:Boolean;
            var _local_14:Array;
            var _local_15:int;
            var _local_7:Array = [];
            var _local_9:int = this._container.roomEngine.getRoomObjectCount(k, RoomObjectCategoryEnum.CONST_100);
            var _local_10:int = 7;
            var _local_11:int;
            for (;_local_11 < _local_9;_local_11++)
            {
                _local_8 = this._container.roomEngine.getRoomObjectWithIndex(k, _local_11, RoomObjectCategoryEnum.CONST_100);
                _local_12 = this._container.roomSession.userDataManager.getUserDataByIndex(_local_8.getId());
                _local_13 = false;
                if (((_local_12 == null) || (!(_local_12.type == RoomObjectTypeEnum.PET))))
                {
                }
                else
                {
                    if (_local_12.ownerId == _arg_5)
                    {
                        if (((_local_12._Str_4799) && (_arg_4 == FurniCategory._Str_6096)))
                        {
                            _local_13 = true;
                        }
                        _local_14 = _local_12.figure.split(" ");
                        _local_15 = ((_local_14.length > 0) ? _local_14[0] : -1);
                        if (_local_15 == _arg_3)
                        {
                            if (_arg_4 == FurniCategory._Str_6915)
                            {
                                if (!_local_12.canRevive)
                                {
                                    continue;
                                }
                            }
                            if (_arg_4 == FurniCategory._Str_8726)
                            {
                                if ((((_local_12._Str_3897 < _local_10) || (_local_12.canRevive)) || (_local_12.canBreed)))
                                {
                                    continue;
                                }
                            }
                            if (_arg_4 == FurniCategory._Str_9449)
                            {
                                if (((_local_12._Str_3897 >= _local_10) || (_local_12.canRevive)))
                                {
                                    continue;
                                }
                            }
                            _local_7.push(new _Str_3858(_local_12._Str_2713, RoomObjectCategoryEnum.CONST_100, _local_12.name, _arg_2, _local_8.getId(), _arg_6, _local_13));
                        }
                    }
                }
            }
            this._widget._Str_23386(_local_7);
        }

        private function _Str_25028(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            var _local_7:IRoomObject;
            var _local_10:RoomUserData;
            var _local_11:RoomUserData;
            var _local_12:Array;
            var _local_13:int;
            var _local_6:Array = [];
            var _local_8:int = this._container.roomEngine.getRoomObjectCount(k, RoomObjectCategoryEnum.CONST_100);
            var _local_9:int;
            while (_local_9 < _local_8)
            {
                _local_7 = this._container.roomEngine.getRoomObjectWithIndex(k, _local_9, RoomObjectCategoryEnum.CONST_100);
                _local_10 = this._container.roomSession.userDataManager.getUserDataByIndex(_local_7.getId());
                if (((_local_10 == null) || (!(_local_10.type == RoomObjectTypeEnum.PET))))
                {
                }
                else
                {
                    if (!_local_10.canBreed)
                    {
                    }
                    else
                    {
                        if (((!(_local_10.hasBreedingPermission)) && (!(_local_10.ownerId == _arg_5))))
                        {
                        }
                        else
                        {
                            _local_11 = this._container.roomSession.userDataManager.getUserData(_local_10.ownerId);
                            if (_local_11 == null)
                            {
                            }
                            else
                            {
                                _local_12 = _local_10.figure.split(" ");
                                _local_13 = ((_local_12.length > 0) ? _local_12[0] : -1);
                                if (((_local_13 == _arg_3) && (!(_local_10._Str_2713 == _arg_4))))
                                {
                                    _local_6.push(new _Str_3858(_local_10._Str_2713, RoomObjectCategoryEnum.CONST_100, _local_10.name, _arg_4, _local_7.getId()));
                                }
                            }
                        }
                    }
                }
                _local_9++;
            }
            this._widget._Str_24967(_local_6);
        }

        private function _Str_19958(k:int):RoomUserData
        {
            var _local_5:IRoomObject;
            var _local_6:RoomUserData;
            var _local_2:int = this._container.roomSession.roomId;
            var _local_3:int = this._container.roomEngine.getRoomObjectCount(_local_2, RoomObjectCategoryEnum.CONST_100);
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = this._container.roomEngine.getRoomObjectWithIndex(_local_2, _local_4, RoomObjectCategoryEnum.CONST_100);
                _local_6 = this._container.roomSession.userDataManager.getUserDataByIndex(_local_5.getId());
                if (((_local_6 == null) || (!(_local_6.type == RoomObjectTypeEnum.PET))))
                {
                }
                else
                {
                    if (_local_6._Str_2394 == k)
                    {
                        return _local_6;
                    }
                }
                _local_4++;
            }
            return null;
        }

        public function _Str_22329(k:_Str_6132):void
        {
            var _local_2:int = k.getParser().code;
            switch (_local_2)
            {
                case 4:
                case 5:
                    this._container.sessionDataManager.giveRespectFailed();
                    return;
            }
        }
    }
}
