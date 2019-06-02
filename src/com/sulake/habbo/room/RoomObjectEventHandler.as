package com.sulake.habbo.room
{
    import com.sulake.room.renderer.IRoomRenderingCanvasMouseListener;
    import com.sulake.core.utils.Map;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.object.RoomObjectOperationEnum;
    import com.sulake.habbo.room.utils.SelectedRoomObjectData;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.room.messages.RoomObjectSelectedMessage;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.room.utils.RoomEnterEffect;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectStateChangedEvent;
    import com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent;
    import com.sulake.habbo.room.events.RoomObjectMoveEvent;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.habbo.room.events.RoomObjectFloorHoleEvent;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
    import com.sulake.habbo.room.events.RoomObjectBadgeAssetEvent;
    import com.sulake.habbo.room.events.RoomObjectPlaySoundIdEvent;
    import com.sulake.habbo.room.events.RoomObjectSamplePlaybackEvent;
    import com.sulake.habbo.room.events.RoomObjectHSLColorEnableEvent;
    import com.sulake.habbo.room.events.RoomObjectDataRequestEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectWallMouseEvent;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage;
    import com.sulake.room.IRoomInstance;
    import com.sulake.habbo.room.utils.TileObjectMap;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10477;
    import com.sulake.habbo.communication.messages.outgoing._Str_295._Str_4406;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.room.events.RoomEngineRoomAdEvent;
    import com.sulake.habbo.room.events.RoomObjectSoundMachineEvent;
    import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
    import com.sulake.habbo.room.events.RoomEnginePlaySoundEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectSamplePlaybackEvent;
    import com.sulake.habbo.room.events.RoomObjectHSLColorEnabledEvent;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
    import com.sulake.habbo.communication.messages.outgoing._Str_79._Str_10602;
    import com.sulake.habbo.room.messages.RoomObjectVisibilityUpdateMessage;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_5686;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_8026;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_7684;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_9462;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_5937;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_12057;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedOnUserEvent;
    import com.sulake.habbo.window.enum._Str_3023;
    import com.sulake.habbo.room.enum.RoomObjectPlacementSource;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_8042;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_8136;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11777;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_6790;
    import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_3382;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10710;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_12401;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11935;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11639;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_12182;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10136;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10097;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10640;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_9799;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10596;

    public class RoomObjectEventHandler implements IRoomRenderingCanvasMouseListener 
    {
        private var _roomEngine:IRoomEngineServices = null;
        private var _eventIds:Map = null;
        private var _selectedAvatarId:int = -1;
        private var _selectedObjectId:int = -1;
        private var _selectedObjectCategory:int = -2;
        private var _whereYouClickIsWhereYouGo:Boolean = true;
        private var _objectPlacementSource:String;

        public function RoomObjectEventHandler(k:IRoomEngineServices)
        {
            this._eventIds = new Map();
            this._roomEngine = k;
        }

        protected function get roomEngine():IRoomEngineServices
        {
            return this._roomEngine;
        }

        public function dispose():void
        {
            if (this._eventIds != null)
            {
                this._eventIds.dispose();
                this._eventIds = null;
            }
            this._roomEngine = null;
        }

        public function initializeRoomObjectInsert(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:String=null, _arg_7:IStuffData=null, _arg_8:int=-1, _arg_9:int=-1, _arg_10:String=null):Boolean
        {
            this._objectPlacementSource = k;
            var _local_11:IVector3d = new Vector3d(-100, -100);
            var _local_12:IVector3d = new Vector3d(0);
            this.setSelectedObjectData(_arg_2, _arg_3, _arg_4, _local_11, _local_12, RoomObjectOperationEnum.OBJECT_PLACE, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10);
            if (this._roomEngine != null)
            {
                this._roomEngine.setObjectMoverIconSprite(_arg_5, _arg_4, false, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10);
                this._roomEngine.setObjectMoverIconSpriteVisible(false);
            }
            return true;
        }

        public function cancelRoomObjectInsert(k:int):Boolean
        {
            this.resetSelectedObjectData(k);
            return true;
        }

        private function getSelectedObjectData(k:int):SelectedRoomObjectData
        {
            if (this._roomEngine == null)
            {
                return null;
            }
            var _local_2:ISelectedRoomObjectData = this._roomEngine.getSelectedObjectData(k);
            return _local_2 as SelectedRoomObjectData;
        }

        private function setSelectedObjectData(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:String, _arg_7:int=0, _arg_8:String=null, _arg_9:IStuffData=null, _arg_10:int=-1, _arg_11:int=-1, _arg_12:String=null):void
        {
            this.resetSelectedObjectData(k);
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_13:SelectedRoomObjectData = new SelectedRoomObjectData(_arg_2, _arg_3, _arg_6, _arg_4, _arg_5, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12);
            this._roomEngine.setSelectedObjectData(k, _local_13);
        }

        private function updateSelectedObjectData(k:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:String, _arg_7:int=0, _arg_8:String=null, _arg_9:IStuffData=null, _arg_10:int=-1, _arg_11:int=-1, _arg_12:String=null):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_13:SelectedRoomObjectData = new SelectedRoomObjectData(_arg_2, _arg_3, _arg_6, _arg_4, _arg_5, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12);
            this._roomEngine.setSelectedObjectData(k, _local_13);
        }

        private function resetSelectedObjectData(k:int):void
        {
            var _local_3:IRoomObjectController;
            var _local_4:int;
            var _local_5:int;
            if (this._roomEngine == null)
            {
                return;
            }
            if (this._roomEngine != null)
            {
                this._roomEngine.removeObjectMoverIconSprite();
            }
            var _local_2:SelectedRoomObjectData = this.getSelectedObjectData(k);
            if (_local_2 != null)
            {
                if (((_local_2.operation == RoomObjectOperationEnum.OBJECT_MOVE) || (_local_2.operation == RoomObjectOperationEnum.OBJECT_MOVE_TO)))
                {
                    _local_3 = (this._roomEngine.getRoomObject(k, _local_2.id, _local_2.category) as IRoomObjectController);
                    if (((!(_local_3 == null)) && (!(_local_2.operation == RoomObjectOperationEnum.OBJECT_MOVE_TO))))
                    {
                        _local_3.setLocation(_local_2.loc);
                        _local_3.setDirection(_local_2.dir);
                    }
                    this.setObjectAlphaMultiplier(_local_3, 1);
                    if (_local_2.category == RoomObjectCategoryEnum.CONST_20)
                    {
                        this._roomEngine.updateObjectRoomWindow(k, _local_2.id, true);
                    }
                    this.updateSelectedObjectData(k, _local_2.id, _local_2.category, _local_2.loc, _local_2.dir, RoomObjectOperationEnum.OBJECT_MOVE, _local_2.typeId, _local_2._Str_4766, _local_2.stuffData, _local_2.state, _local_2._Str_15896, _local_2.posture);
                }
                if (_local_2.operation == RoomObjectOperationEnum.OBJECT_PLACE)
                {
                    _local_4 = _local_2.id;
                    _local_5 = _local_2.category;
                    switch (_local_5)
                    {
                        case RoomObjectCategoryEnum.CONST_10:
                            this._roomEngine.disposeObjectFurniture(k, _local_4);
                            break;
                        case RoomObjectCategoryEnum.CONST_20:
                            this._roomEngine.disposeObjectWallItem(k, _local_4);
                            break;
                        case RoomObjectCategoryEnum.CONST_100:
                            this._roomEngine.disposeObjectUser(k, _local_4);
                            break;
                    }
                }
                this._roomEngine.setSelectedObjectData(k, null);
            }
        }

        public function setSelectedObject(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:IRoomObjectController;
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_4:IEventDispatcher = this._roomEngine.events;
            if (_local_4 == null)
            {
                return;
            }
            switch (_arg_3)
            {
                case RoomObjectCategoryEnum.CONST_100:
                case RoomObjectCategoryEnum.CONST_10:
                case RoomObjectCategoryEnum.CONST_20:
                    if (_arg_3 == RoomObjectCategoryEnum.CONST_100)
                    {
                        this.deselectObject(k);
                        this.setSelectedAvatar(k, _arg_2, true);
                    }
                    else
                    {
                        this.setSelectedAvatar(k, 0, false);
                        if (_arg_2 != this._selectedObjectId)
                        {
                            this.deselectObject(k);
                            _local_5 = (this._roomEngine.getRoomObject(k, _arg_2, _arg_3) as IRoomObjectController);
                            if (((!(_local_5 == null)) && (!(_local_5.getEventHandler() == null))))
                            {
                                _local_5.getEventHandler().processUpdateMessage(new RoomObjectSelectedMessage(true));
                                this._selectedObjectId = _arg_2;
                                this._selectedObjectCategory = _arg_3;
                            }
                        }
                    }
                    _local_4.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.SELECTED, k, _arg_2, _arg_3));
                    return;
            }
        }

        private function deselectObject(k:int):void
        {
            var _local_2:IRoomObjectController;
            if (this._selectedObjectId != -1)
            {
                _local_2 = (this._roomEngine.getRoomObject(k, this._selectedObjectId, this._selectedObjectCategory) as IRoomObjectController);
                if (((!(_local_2 == null)) && (!(_local_2.getEventHandler() == null))))
                {
                    _local_2.getEventHandler().processUpdateMessage(new RoomObjectSelectedMessage(false));
                    this._selectedObjectId = -1;
                    this._selectedObjectCategory = RoomObjectCategoryEnum.CONST_MIN2;
                }
            }
        }

        public function processRoomCanvasMouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomObject, _arg_3:IRoomGeometry):void
        {
            if (RoomEnterEffect.isRunning())
            {
                return;
            }
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            var _local_4:String = _arg_2.getType();
            var _local_5:int = this._roomEngine.getRoomObjectCategory(_local_4);
            var _local_6:int = _local_5;
            if (_local_5 != RoomObjectCategoryEnum.CONST_0)
            {
                if (!this._roomEngine.getActiveRoomIsPlayingGame())
                {
                    _local_5 = RoomObjectCategoryEnum.CONST_MIN2;
                }
                else
                {
                    if (_local_5 != RoomObjectCategoryEnum.CONST_100)
                    {
                        _local_5 = RoomObjectCategoryEnum.CONST_MIN2;
                    }
                }
            }
            var _local_7:String = this.getMouseEventId(_local_5, k.type);
            if (_local_7 == k.eventId)
            {
                if ((((((k.type == MouseEvent.CLICK) || (k.type == MouseEvent.DOUBLE_CLICK)) || (k.type == MouseEvent.MOUSE_DOWN)) || (k.type == MouseEvent.MOUSE_UP)) || (k.type == MouseEvent.MOUSE_MOVE)))
                {
                    return;
                }
            }
            else
            {
                if (k.eventId != null)
                {
                    this.setMouseEventId(_local_5, k.type, k.eventId);
                }
            }
            if (_arg_2.getMouseHandler() != null)
            {
                _arg_2.getMouseHandler().mouseEvent(k, _arg_3);
            }
        }

        public function handleRoomObjectEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            if ((k is RoomObjectMouseEvent))
            {
                this.handleRoomObjectMouseMove((k as RoomObjectMouseEvent), _arg_2);
                return;
            }
            switch (k.type)
            {
                case RoomObjectStateChangedEvent.STATE_CHANGE:
                    this._Str_23428((k as RoomObjectStateChangedEvent), _arg_2);
                    return;
                case RoomObjectStateChangedEvent.STATE_RANDOM:
                    this._Str_24913((k as RoomObjectStateChangedEvent), _arg_2);
                    return;
                case RoomObjectDimmerStateUpdateEvent.DIMMER_STATE:
                    this.handleRoomObjectDataRequestEvent(k, _arg_2);
                    return;
                case RoomObjectMoveEvent.ROME_POSITION_CHANGED:
                    this.handleSelectedObjectRemove(k, _arg_2);
                    return;
                case RoomObjectMoveEvent.ROME_OBJECT_REMOVED:
                    this._Str_25365(k, _arg_2);
                    return;
                case RoomObjectWidgetRequestEvent.OPEN_WIDGET:
                case RoomObjectWidgetRequestEvent.CLOSE_WIDGET:
                case RoomObjectWidgetRequestEvent.OPEN_FURNI_CONTEXT_MENU:
                case RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU:
                case RoomObjectWidgetRequestEvent.PLACEHOLDER:
                case RoomObjectWidgetRequestEvent.CREDITFURNI:
                case RoomObjectWidgetRequestEvent.STICKIE:
                case RoomObjectWidgetRequestEvent.PRESENT:
                case RoomObjectWidgetRequestEvent.TROPHY:
                case RoomObjectWidgetRequestEvent.TEASER:
                case RoomObjectWidgetRequestEvent.ECOTRONBOX:
                case RoomObjectWidgetRequestEvent.DIMMER:
                case RoomObjectWidgetRequestEvent.WIDGET_REMOVE_DIMMER:
                case RoomObjectWidgetRequestEvent.CLOTHING_CHANGE:
                case RoomObjectWidgetRequestEvent.JUKEBOX_PLAYLIST_EDITOR:
                case RoomObjectWidgetRequestEvent.MANNEQUIN:
                case RoomObjectWidgetRequestEvent.PET_PRODUCT_MENU:
                case RoomObjectWidgetRequestEvent.GUILD_FURNI_CONTEXT_MENU:
                case RoomObjectWidgetRequestEvent.MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG:
                case RoomObjectWidgetRequestEvent.PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG:
                case RoomObjectWidgetRequestEvent.BACKGROUND_COLOR:
                case RoomObjectWidgetRequestEvent.MYSTERYBOX_OPEN_DIALOG:
                case RoomObjectWidgetRequestEvent.EFFECTBOX_OPEN_DIALOG:
                case RoomObjectWidgetRequestEvent.MYSTERYTROPHY_OPEN_DIALOG:
                case RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_OPEN:
                case RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_ENGRAVING:
                case RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_FAILED:
                case RoomObjectWidgetRequestEvent.FRIEND_FURNITURE_CONFIRM:
                case RoomObjectWidgetRequestEvent.FRIEND_FURNITURE_ENGRAVING:
                case RoomObjectWidgetRequestEvent.BADGE_DISPLAY_ENGRAVING:
                case RoomObjectWidgetRequestEvent.HIGH_SCORE_DISPLAY:
                case RoomObjectWidgetRequestEvent.HIDE_HIGH_SCORE_DISPLAY:
                case RoomObjectWidgetRequestEvent.INERNAL_LINK:
                case RoomObjectWidgetRequestEvent.ROOM_LINK:
                    this.handleObjectRoomAdEvent(k, _arg_2);
                    return;
                case RoomObjectFurnitureActionEvent.DICE_ACTIVATE:
                case RoomObjectFurnitureActionEvent.DICE_OFF:
                case RoomObjectFurnitureActionEvent.USE_HABBOWHEEL:
                case RoomObjectFurnitureActionEvent.STICKIE:
                case RoomObjectFurnitureActionEvent.ENTER_ONEWAYDOOR:
                    this.handleObjectSoundMachineEvent(k, _arg_2);
                    return;
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_INIT:
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_START:
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_STOP:
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_DISPOSE:
                    this.handleObjectJukeboxEvent(k, _arg_2);
                    return;
                case RoomObjectFurnitureActionEvent.JUKEBOX_INIT:
                case RoomObjectFurnitureActionEvent.JUKEBOX_START:
                case RoomObjectFurnitureActionEvent.JUKEBOX_MACHINE_STOP:
                case RoomObjectFurnitureActionEvent.JUKEBOX_DISPOSE:
                    this.handleObjectGroupBadgeEvent(k, _arg_2);
                    return;
                case RoomObjectFloorHoleEvent.ROFHO_ADD_HOLE:
                case RoomObjectFloorHoleEvent.ROFHO_REMOVE_HOLE:
                    this.handleRoomActionMouseRequestEvent(k, _arg_2);
                    return;
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_CLICK:
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_DOUBLE_CLICK:
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_SHOW:
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_HIDE:
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_LOAD_IMAGE:
                    this.handleObjectActionEvent(k, _arg_2);
                    return;
                case RoomObjectBadgeAssetEvent.ROGBE_LOAD_BADGE:
                    this.handleObjectFloorHoleEvent(k, _arg_2);
                    return;
                case RoomObjectFurnitureActionEvent.MOUSE_ARROW:
                case RoomObjectFurnitureActionEvent.MOUSE_BUTTON:
                    this.handleObjectDimmerStateEvent(k, _arg_2);
                    return;
                case RoomObjectPlaySoundIdEvent.ROPSIE_PLAY_SOUND:
                case RoomObjectPlaySoundIdEvent.ROPSIE_PLAY_SOUND_AT_PITCH:
                    this.handleRoomObjectPlaySoundEvent(RoomObjectPlaySoundIdEvent(k), _arg_2);
                    return;
                case RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_INITIALIZED:
                case RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_DISPOSED:
                case RoomObjectSamplePlaybackEvent.ROPSPE_PLAY_SAMPLE:
                    this.handleRoomObjectSamplePlaybackEvent(RoomObjectSamplePlaybackEvent(k), _arg_2);
                    return;
                case RoomObjectHSLColorEnableEvent.ROHSLCEE_ROOM_BACKGROUND_COLOR:
                    this.handleRoomObjectHSLColorEnableEvent(RoomObjectHSLColorEnableEvent(k), _arg_2);
                    return;
                case RoomObjectDataRequestEvent.RODRE_CURRENT_USER_ID:
                case RoomObjectDataRequestEvent.RODRE_URL_PREFIX:
                    this.handleSelectedObjectMove(k, _arg_2);
                    return;
                default:
                    Logger.log("*** Unhandled room object event in RoomObjectEventHandler::handleRoomObjectEvent !!! ***");
            }
        }

        private function setMouseEventId(k:int, _arg_2:String, _arg_3:String):void
        {
            var _local_4:Map = (this._eventIds.getValue(String(k)) as Map);
            if (_local_4 == null)
            {
                _local_4 = new Map();
                this._eventIds.add(k, _local_4);
            }
            _local_4.remove(_arg_2);
            _local_4.add(_arg_2, _arg_3);
        }

        private function getMouseEventId(k:int, _arg_2:String):String
        {
            var _local_3:Map = (this._eventIds.getValue(String(k)) as Map);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:String = (_local_3.getValue(_arg_2) as String);
            return _local_4;
        }

        private function handleRoomObjectMouseMove(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            switch (k.type)
            {
                case RoomObjectMouseEvent.ROE_MOUSE_CLICK:
                    this.handleRoomObjectMouseEnter(k, _arg_2);
                    return;
                case RoomObjectMouseEvent.ROE_MOUSE_MOVE:
                    this.handleRoomObjectMouseLeave(k, _arg_2);
                    return;
                case RoomObjectMouseEvent.ROE_MOUSE_DOWN:
                    this.handleObjectPlace(k, _arg_2);
                    return;
                case RoomObjectMouseEvent.ROE_MOUSE_ENTER:
                    this.handleRoomObjectMouseDown(k, _arg_2);
                    return;
                case RoomObjectMouseEvent.ROE_MOUSE_LEAVE:
                    this.handleObjectMove(k, _arg_2);
                    return;
            }
        }

        private function handleRoomObjectMouseEnter(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_14:Boolean;
            var _local_15:String;
            var _local_16:String;
            if (k == null)
            {
                return;
            }
            var _local_3:Boolean;
            var _local_4:String = RoomObjectOperationEnum.OBJECT_UNDEFINED;
            var _local_5:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_5 != null)
            {
                _local_4 = _local_5.operation;
            }
            if (this._whereYouClickIsWhereYouGo)
            {
                if (((_local_4 == null) || (_local_4 == RoomObjectOperationEnum.OBJECT_UNDEFINED)))
                {
                    _local_3 = this.handleMoveTargetFurni(_arg_2, k);
                }
            }
            var _local_6:int = k._Str_1577;
            var _local_7:String = k.objectType;
            var _local_8:int = this._roomEngine.getRoomObjectCategory(_local_7);
            var _local_9:String = k.eventId;
            var _local_10:RoomObjectTileMouseEvent = (k as RoomObjectTileMouseEvent);
            var _local_11:RoomObjectWallMouseEvent = (k as RoomObjectWallMouseEvent);
            var _local_12:Boolean;
            var _local_13:IEventDispatcher = this._roomEngine.events;
            switch (_local_4)
            {
                case RoomObjectOperationEnum.OBJECT_MOVE:
                    if (_local_8 == RoomObjectCategoryEnum.CONST_0)
                    {
                        if (_local_5 != null)
                        {
                            this.updateObjectWallItemData(_arg_2, _local_5.id, _local_5.category, RoomObjectOperationEnum.OBJECT_MOVE_TO);
                        }
                    }
                    else
                    {
                        if (_local_8 == RoomObjectCategoryEnum.CONST_100)
                        {
                            if (((!(_local_5 == null)) && (_local_7 == RoomObjectUserTypes.MONSTERPLANT)))
                            {
                                this.updateObjectWallItemData(_arg_2, _local_5.id, _local_5.category, RoomObjectOperationEnum.OBJECT_MOVE_TO);
                            }
                            if (_local_9 != null)
                            {
                                this.setMouseEventId(RoomObjectCategoryEnum.CONST_0, MouseEvent.CLICK, _local_9);
                            }
                            this.placeObjectOnUser(_arg_2, _local_6, _local_8);
                        }
                    }
                    _local_12 = true;
                    if (_local_6 != -1)
                    {
                        this.setSelectedObject(_arg_2, _local_6, _local_8);
                    }
                    break;
                case RoomObjectOperationEnum.OBJECT_PLACE:
                    if (_local_8 == RoomObjectCategoryEnum.CONST_0)
                    {
                        this._Str_19271(_arg_2, (!(_local_10 == null)), (!(_local_11 == null)));
                    }
                    else
                    {
                        if (_local_8 == RoomObjectCategoryEnum.CONST_100)
                        {
                            switch (_local_7)
                            {
                                case RoomObjectUserTypes.MONSTERPLANT:
                                case RoomObjectUserTypes.RENTABLE_BOT:
                                    this._Str_19271(_arg_2, (!(_local_10 == null)), (!(_local_11 == null)));
                                    break;
                                default:
                                    if (_local_9 != null)
                                    {
                                        this.setMouseEventId(RoomObjectCategoryEnum.CONST_0, MouseEvent.CLICK, _local_9);
                                    }
                                    this.placeObjectOnUser(_arg_2, _local_6, _local_8);
                            }
                        }
                    }
                    break;
                case RoomObjectOperationEnum.OBJECT_UNDEFINED:
                    if (_local_8 == RoomObjectCategoryEnum.CONST_0)
                    {
                        if (((!(_local_10 == null)) && (!(_local_3))))
                        {
                            this.handleClickOnTile(_arg_2, _local_10);
                        }
                    }
                    else
                    {
                        this.setSelectedObject(_arg_2, _local_6, _local_8);
                        _local_14 = false;
                        if (_local_8 == RoomObjectCategoryEnum.CONST_100)
                        {
                            if (((((k.ctrlKey) && (!(k.altKey))) && (!(k.shiftKey))) && (_local_7 == RoomObjectUserTypes.RENTABLE_BOT)))
                            {
                                this.updateObjectWallItemData(_arg_2, _local_6, _local_8, RoomObjectOperationEnum.OBJECT_PICKUP_BOT);
                            }
                            else
                            {
                                if (((((k.ctrlKey) && (!(k.altKey))) && (!(k.shiftKey))) && (_local_7 == RoomObjectUserTypes.MONSTERPLANT)))
                                {
                                    this.updateObjectWallItemData(_arg_2, _local_6, _local_8, RoomObjectOperationEnum.OBJECT_PICKUP_PET);
                                }
                                else
                                {
                                    if (((((!(k.ctrlKey)) && (!(k.altKey))) && (k.shiftKey)) && (_local_7 == RoomObjectUserTypes.MONSTERPLANT)))
                                    {
                                        this.updateObjectWallItemData(_arg_2, _local_6, _local_8, RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
                                    }
                                    else
                                    {
                                        this.handleClickOnAvatar(_local_6, k);
                                    }
                                }
                            }
                            if (!this._roomEngine.getActiveRoomIsPlayingGame())
                            {
                                _local_3 = true;
                            }
                            else
                            {
                                _local_14 = true;
                            }
                        }
                        else
                        {
                            if (((_local_8 == RoomObjectCategoryEnum.CONST_10) || (_local_8 == RoomObjectCategoryEnum.CONST_20)))
                            {
                                if (((((k.altKey) || (k.ctrlKey)) || (k.shiftKey)) && (!(this._roomEngine.setIsSelectedObjectInValidPosition))))
                                {
                                    if ((((!(k.ctrlKey)) && (!(k.altKey))) && (k.shiftKey)))
                                    {
                                        if (_local_8 == RoomObjectCategoryEnum.CONST_10)
                                        {
                                            if (_local_13 != null)
                                            {
                                                _local_13.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.REQUEST_ROTATE, _arg_2, _local_6, _local_8));
                                            }
                                        }
                                    }
                                    else
                                    {
                                        if ((((k.ctrlKey) && (!(k.altKey))) && (!(k.shiftKey))))
                                        {
                                            this.updateObjectWallItemData(_arg_2, _local_6, _local_8, RoomObjectOperationEnum.OBJECT_PICKUP);
                                        }
                                    }
                                    if (!this._roomEngine.getActiveRoomIsPlayingGame())
                                    {
                                        _local_3 = true;
                                    }
                                    else
                                    {
                                        _local_14 = true;
                                    }
                                }
                            }
                        }
                        if (_local_9 != null)
                        {
                            if (_local_3)
                            {
                                this.setMouseEventId(RoomObjectCategoryEnum.CONST_0, MouseEvent.CLICK, _local_9);
                            }
                            if (_local_14)
                            {
                                this.setMouseEventId(RoomObjectCategoryEnum.CONST_MIN2, MouseEvent.CLICK, _local_9);
                            }
                        }
                    }
                    break;
            }
            if (_local_8 == RoomObjectCategoryEnum.CONST_0)
            {
                _local_15 = this.getMouseEventId(RoomObjectCategoryEnum.CONST_MIN2, MouseEvent.CLICK);
                _local_16 = this.getMouseEventId(RoomObjectCategoryEnum.CONST_100, MouseEvent.CLICK);
                if ((((!(_local_15 == _local_9)) && (!(_local_16 == _local_9))) && (!(_local_12))))
                {
                    this.deselectObject(_arg_2);
                    if (_local_13 != null)
                    {
                        _local_13.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.DESELECTED, _arg_2, -1, RoomObjectCategoryEnum.CONST_MIN2));
                    }
                    this.setSelectedAvatar(_arg_2, 0, false);
                }
            }
        }

        private function handleRoomObjectMouseLeave(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_7:IRoomObjectController;
            var _local_8:RoomObjectTileCursorUpdateMessage;
            if (k == null)
            {
                return;
            }
            var _local_3:String = RoomObjectOperationEnum.OBJECT_UNDEFINED;
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_4 != null)
            {
                _local_3 = _local_4.operation;
            }
            var _local_5:String = k.objectType;
            var _local_6:int = this._roomEngine.getRoomObjectCategory(_local_5);
            if (this._roomEngine != null)
            {
                _local_7 = this._roomEngine.getTileCursor(_arg_2);
                if (((!(_local_7 == null)) && (!(_local_7.getEventHandler() == null))))
                {
                    if ((k is RoomObjectTileMouseEvent))
                    {
                        _local_8 = this.handleMouseOverTile((k as RoomObjectTileMouseEvent), _arg_2);
                    }
                    else
                    {
                        if (((!(k.object == null)) && (!(k.object.getId() == -1))))
                        {
                            if (this._whereYouClickIsWhereYouGo)
                            {
                                _local_8 = this.handleMouseOverObject(_local_6, _arg_2, k);
                            }
                        }
                        else
                        {
                            _local_8 = new RoomObjectTileCursorUpdateMessage(null, 0, false, k.eventId);
                        }
                    }
                    _local_7.getEventHandler().processUpdateMessage(_local_8);
                }
            }
            switch (_local_3)
            {
                case RoomObjectOperationEnum.OBJECT_MOVE:
                    if (_local_6 == RoomObjectCategoryEnum.CONST_0)
                    {
                        this._Str_24048(k, _arg_2);
                    }
                    return;
                case RoomObjectOperationEnum.OBJECT_PLACE:
                    if (_local_6 == RoomObjectCategoryEnum.CONST_0)
                    {
                        this._Str_22548(k, _arg_2);
                    }
            }
        }

        private function handleMouseOverTile(k:RoomObjectTileMouseEvent, _arg_2:int):RoomObjectTileCursorUpdateMessage
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IRoomInstance;
            var _local_8:TileObjectMap;
            var _local_9:IRoomObject;
            var _local_10:FurniStackingHeightMap;
            var _local_11:Number;
            var _local_12:Number;
            if (this._whereYouClickIsWhereYouGo)
            {
                return new RoomObjectTileCursorUpdateMessage(new Vector3d(k.tileXAsInt, k.tileYAsInt, k.tileZAsInt), 0, true, k.eventId);
            }
            var _local_3:IRoomObjectController = this._roomEngine.getTileCursor(_arg_2);
            if (((!(_local_3 == null)) && (!(_local_3.getEventHandler() == null))))
            {
                _local_4 = k.tileXAsInt;
                _local_5 = k.tileYAsInt;
                _local_6 = k.tileZAsInt;
                _local_7 = this._roomEngine.getRoom(_arg_2);
                if (_local_7 != null)
                {
                    _local_8 = this._roomEngine._Str_15934(_arg_2);
                    if (_local_8)
                    {
                        _local_9 = _local_8.getObjectInTile(_local_4, _local_5);
                        _local_10 = this._roomEngine.getFurniStackingHeightMap(_arg_2);
                        if (_local_10)
                        {
                            if ((((_local_9) && (_local_9.getModel())) && (_local_9.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_IS_VARIABLE_HEIGHT) > 0)))
                            {
                                _local_11 = _local_10._Str_2754(_local_4, _local_5);
                                _local_12 = this._roomEngine.getLegacyGeometry(_arg_2)._Str_2754(_local_4, _local_5);
                                return new RoomObjectTileCursorUpdateMessage(new Vector3d(_local_4, _local_5, _local_6), (_local_11 - _local_12), true, k.eventId);
                            }
                            return new RoomObjectTileCursorUpdateMessage(new Vector3d(_local_4, _local_5, _local_6), 0, true, k.eventId);
                        }
                    }
                }
            }
            return null;
        }

        private function handleMouseOverObject(k:int, _arg_2:int, _arg_3:RoomObjectMouseEvent):RoomObjectTileCursorUpdateMessage
        {
            var _local_5:Vector3d;
            var _local_6:FurniStackingHeightMap;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Number;
            var _local_4:IRoomObject;
            if (k == RoomObjectCategoryEnum.CONST_10)
            {
                _local_4 = this._roomEngine.getRoomObject(_arg_2, _arg_3._Str_1577, RoomObjectCategoryEnum.CONST_10);
                if (_local_4)
                {
                    _local_5 = this.getActiveSurfaceLocation(_local_4, _arg_3);
                    if (_local_5)
                    {
                        _local_6 = this._roomEngine.getFurniStackingHeightMap(_arg_2);
                        if (_local_6)
                        {
                            _local_7 = _local_5.x;
                            _local_8 = _local_5.y;
                            _local_9 = _local_5.z;
                            return new RoomObjectTileCursorUpdateMessage(new Vector3d(_local_7, _local_8, _local_4.getLocation().z), _local_9, true, _arg_3.eventId);
                        }
                    }
                }
            }
            return null;
        }

        private function handleRoomObjectMouseDown(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_3:String = k.objectType;
            var _local_4:int = k._Str_1577;
            var _local_5:int = this._roomEngine.getRoomObjectCategory(_local_3);
            if (_local_5 != RoomObjectCategoryEnum.CONST_0)
            {
                if (_local_5 == RoomObjectCategoryEnum.CONST_100)
                {
                    this.handleMouseEnterAvatar(_local_4, k, _arg_2);
                }
            }
            var _local_6:IEventDispatcher = this._roomEngine.events;
            if (_local_6 != null)
            {
                _local_6.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.MOUSE_ENTER, _arg_2, k._Str_1577, this._roomEngine.getRoomObjectCategory(k.objectType)));
            }
        }

        private function handleObjectMove(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_6:IRoomObjectController;
            var _local_7:RoomObjectDataUpdateMessage;
            var _local_3:String = k.objectType;
            var _local_4:int = this._roomEngine.getRoomObjectCategory(_local_3);
            if (_local_4 != RoomObjectCategoryEnum.CONST_0)
            {
                if (_local_4 == RoomObjectCategoryEnum.CONST_100)
                {
                    _local_6 = this._roomEngine.getTileCursor(_arg_2);
                    if (_local_6)
                    {
                        _local_7 = new RoomObjectDataUpdateMessage(0, null);
                        _local_6.getEventHandler().processUpdateMessage(_local_7);
                    }
                }
            }
            var _local_5:IEventDispatcher = this._roomEngine.events;
            if (_local_5 != null)
            {
                _local_5.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.MOUSE_LEAVE, _arg_2, k._Str_1577, this._roomEngine.getRoomObjectCategory(k.objectType)));
            }
        }

        private function handleObjectPlace(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_8:IEventDispatcher;
            if (k == null)
            {
                return;
            }
            var _local_3:String = RoomObjectOperationEnum.OBJECT_UNDEFINED;
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_4 != null)
            {
                _local_3 = _local_4.operation;
            }
            var _local_5:int = k._Str_1577;
            var _local_6:String = k.objectType;
            var _local_7:int = this._roomEngine.getRoomObjectCategory(_local_6);
            switch (_local_3)
            {
                case RoomObjectOperationEnum.OBJECT_UNDEFINED:
                    if ((((_local_7 == RoomObjectCategoryEnum.CONST_10) || (_local_7 == RoomObjectCategoryEnum.CONST_20)) || (_local_6 == RoomObjectUserTypes.MONSTERPLANT)))
                    {
                        if ((((((k.altKey) && (!(k.ctrlKey))) && (!(k.shiftKey))) || (this.decorateModeMove(k))) && (!(this._roomEngine.setIsSelectedObjectInValidPosition))))
                        {
                            _local_8 = this._roomEngine.events;
                            if (_local_8 != null)
                            {
                                _local_8.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.REQUEST_MOVE, _arg_2, _local_5, _local_7));
                            }
                        }
                    }
                    return;
            }
        }

        private function decorateModeMove(k:RoomObjectMouseEvent):Boolean
        {
            return (this._roomEngine.getIsSelectedObjectInValidPosition) && (!((k.ctrlKey) || (k.shiftKey)));
        }

        private function _Str_24048(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_6:Boolean;
            var _local_7:FurniStackingHeightMap;
            var _local_8:RoomObjectTileMouseEvent;
            var _local_9:RoomObjectWallMouseEvent;
            var _local_10:IVector3d;
            var _local_11:IVector3d;
            var _local_12:IVector3d;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            if (((k == null) || (this._roomEngine == null)))
            {
                return;
            }
            var _local_3:IEventDispatcher = this._roomEngine.events;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IRoomObjectController = (this._roomEngine.getRoomObject(_arg_2, _local_4.id, _local_4.category) as IRoomObjectController);
            if (_local_5 != null)
            {
                _local_6 = true;
                if (((_local_4.category == RoomObjectCategoryEnum.CONST_10) || (_local_4.category == RoomObjectCategoryEnum.CONST_100)))
                {
                    _local_7 = this._roomEngine.getFurniStackingHeightMap(_arg_2);
                    _local_8 = (k as RoomObjectTileMouseEvent);
                    if (!((!(_local_8 == null)) && (this.handleFurnitureMove(_local_5, _local_4, (_local_8.tileX + 0.5), (_local_8.tileY + 0.5), _local_7))))
                    {
                        this.handleFurnitureMove(_local_5, _local_4, _local_4.loc.x, _local_4.loc.y, _local_7);
                        _local_6 = false;
                    }
                }
                else
                {
                    if (_local_4.category == RoomObjectCategoryEnum.CONST_20)
                    {
                        _local_6 = false;
                        _local_9 = (k as RoomObjectWallMouseEvent);
                        if (_local_9 != null)
                        {
                            _local_10 = _local_9._Str_7031;
                            _local_11 = _local_9.wallWidth;
                            _local_12 = _local_9.wallHeight;
                            _local_13 = _local_9.x;
                            _local_14 = _local_9.y;
                            _local_15 = _local_9.direction;
                            if (this.handleWallItemMove(_local_5, _local_4, _local_10, _local_11, _local_12, _local_13, _local_14, _local_15))
                            {
                                _local_6 = true;
                            }
                        }
                        if (!_local_6)
                        {
                            _local_5.setLocation(_local_4.loc);
                            _local_5.setDirection(_local_4.dir);
                        }
                        this._roomEngine.updateObjectRoomWindow(_arg_2, _local_4.id, _local_6);
                    }
                }
                if (_local_6)
                {
                    this.setObjectAlphaMultiplier(_local_5, 0.5);
                    this._roomEngine.setObjectMoverIconSpriteVisible(false);
                }
                else
                {
                    this.setObjectAlphaMultiplier(_local_5, 0);
                    this._roomEngine.setObjectMoverIconSpriteVisible(true);
                }
            }
        }

        private function _Str_22548(k:RoomObjectMouseEvent, _arg_2:int):void
        {
            var _local_8:IRoomObject;
            var _local_9:IRoomObjectModelController;
            var _local_10:Array;
            var _local_11:IVector3d;
            var _local_12:Boolean;
            var _local_13:FurniStackingHeightMap;
            var _local_14:IVector3d;
            var _local_15:IVector3d;
            var _local_16:IVector3d;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:Number;
            if (((k == null) || (this._roomEngine == null)))
            {
                return;
            }
            var _local_3:IEventDispatcher = this._roomEngine.events;
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IRoomObjectController = (this._roomEngine.getRoomObject(_arg_2, _local_4.id, _local_4.category) as IRoomObjectController);
            var _local_6:RoomObjectTileMouseEvent = (k as RoomObjectTileMouseEvent);
            var _local_7:RoomObjectWallMouseEvent = (k as RoomObjectWallMouseEvent);
            if (_local_5 == null)
            {
                if (((_local_4.category == RoomObjectCategoryEnum.CONST_10) && (!(_local_6 == null))))
                {
                    this._roomEngine.addObjectFurniture(_arg_2, _local_4.id, _local_4.typeId, _local_4.loc, _local_4.dir, 0, _local_4.stuffData, Number(_local_4._Str_4766), -1, 0, 0, "", false);
                }
                else
                {
                    if (((_local_4.category == RoomObjectCategoryEnum.CONST_20) && (!(_local_7 == null))))
                    {
                        this._roomEngine.addObjectWallItem(_arg_2, _local_4.id, _local_4.typeId, _local_4.loc, _local_4.dir, 0, _local_4._Str_4766, 0);
                    }
                    else
                    {
                        if (((_local_4.category == RoomObjectCategoryEnum.CONST_100) && (!(_local_6 == null))))
                        {
                            this._roomEngine.addObjectUser(_arg_2, _local_4.id, new Vector3d(), new Vector3d(180), 180, _local_4.typeId, _local_4._Str_4766);
                            _local_8 = this._roomEngine.getRoomObject(_arg_2, _local_4.id, _local_4.category);
                            if (_local_8)
                            {
                                _local_9 = (_local_8.getModel() as IRoomObjectModelController);
                                if (((!(_local_9 == null)) && (!(_local_4.posture == null))))
                                {
                                    _local_9.setString(RoomObjectVariableEnum.FIGURE_POSTURE, _local_4.posture);
                                }
                            }
                        }
                    }
                }
                _local_5 = (this._roomEngine.getRoomObject(_arg_2, _local_4.id, _local_4.category) as IRoomObjectController);
                if (_local_5 != null)
                {
                    if (_local_4.category == RoomObjectCategoryEnum.CONST_10)
                    {
                        if (_local_5.getModel() != null)
                        {
                            _local_10 = _local_5.getModel().getNumberArray(RoomObjectVariableEnum.FURNITURE_ALLOWED_DIRECTIONS);
                            if (((!(_local_10 == null)) && (_local_10.length > 0)))
                            {
                                _local_11 = new Vector3d(_local_10[0]);
                                _local_5.setDirection(_local_11);
                                this.updateSelectedObjectData(_arg_2, _local_4.id, _local_4.category, _local_4.loc, _local_11, _local_4.operation, _local_4.typeId, _local_4._Str_4766, _local_4.stuffData, _local_4.state, _local_4._Str_15896, _local_4.posture);
                                _local_4 = this.getSelectedObjectData(_arg_2);
                                if (_local_4 == null)
                                {
                                    return;
                                }
                            }
                        }
                    }
                }
                this.setObjectAlphaMultiplier(_local_5, 0.5);
                this._roomEngine.setObjectMoverIconSpriteVisible(true);
            }
            if (_local_5 != null)
            {
                _local_12 = true;
                _local_13 = this._roomEngine.getFurniStackingHeightMap(_arg_2);
                if (_local_4.category == RoomObjectCategoryEnum.CONST_10)
                {
                    if (!((!(_local_6 == null)) && (this.handleFurnitureMove(_local_5, _local_4, (_local_6.tileX + 0.5), (_local_6.tileY + 0.5), _local_13))))
                    {
                        this._roomEngine.disposeObjectFurniture(_arg_2, _local_4.id);
                        _local_12 = false;
                    }
                }
                else
                {
                    if (_local_4.category == RoomObjectCategoryEnum.CONST_20)
                    {
                        _local_12 = false;
                        if (_local_7 != null)
                        {
                            _local_14 = _local_7._Str_7031;
                            _local_15 = _local_7.wallWidth;
                            _local_16 = _local_7.wallHeight;
                            _local_17 = _local_7.x;
                            _local_18 = _local_7.y;
                            _local_19 = _local_7.direction;
                            if (this.handleWallItemMove(_local_5, _local_4, _local_14, _local_15, _local_16, _local_17, _local_18, _local_19))
                            {
                                _local_12 = true;
                            }
                        }
                        if (!_local_12)
                        {
                            this._roomEngine.disposeObjectWallItem(_arg_2, _local_4.id);
                        }
                        this._roomEngine.updateObjectRoomWindow(_arg_2, _local_4.id, _local_12);
                    }
                    else
                    {
                        if (_local_4.category == RoomObjectCategoryEnum.CONST_100)
                        {
                            if (!((!(_local_6 == null)) && (this.handleUserPlace(_local_5, (_local_6.tileX + 0.5), (_local_6.tileY + 0.5), this._roomEngine.getLegacyGeometry(_arg_2)))))
                            {
                                this._roomEngine.disposeObjectUser(_arg_2, _local_4.id);
                                _local_12 = false;
                            }
                        }
                    }
                }
                this._roomEngine.setObjectMoverIconSpriteVisible((!(_local_12)));
            }
        }

        private function handleMoveTargetFurni(k:int, _arg_2:RoomObjectEvent):Boolean
        {
            var _local_3:IRoomObject = this._roomEngine.getRoomObject(k, _arg_2._Str_1577, RoomObjectCategoryEnum.CONST_10);
            var _local_4:Vector3d = this.getActiveSurfaceLocation(_local_3, (_arg_2 as RoomObjectMouseEvent));
            if (_local_4)
            {
                this.walkTo(_local_4.x, _local_4.y);
                return true;
            }
            return false;
        }

        private function getActiveSurfaceLocation(k:IRoomObject, _arg_2:RoomObjectMouseEvent):Vector3d
        {
            var _local_4:IRoomObjectModel;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Number;
            var _local_10:int;
            var _local_11:int;
            var _local_12:Boolean;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:int;
            var _local_19:int;
            var _local_20:Boolean;
            var _local_21:Number;
            var _local_22:int;
            if (((k == null) || (_arg_2 == null)))
            {
                return null;
            }
            var _local_3:IFurnitureData = this._roomEngine.sessionDataManager.getFloorItemDataByName(k.getType());
            if (_local_3 == null)
            {
                return null;
            }
            if ((((_local_3.canStandOn) || (_local_3.canSitOn)) || (_local_3.canLayOn)))
            {
                _local_4 = k.getModel();
                if (_local_4 == null)
                {
                    return null;
                }
                _local_5 = k.getLocation().x;
                _local_6 = k.getLocation().y;
                _local_7 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
                _local_8 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
                _local_9 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z);
                _local_10 = k.getDirection().x;
                if (((_local_10 == 90) || (_local_10 == 270)))
                {
                    _local_22 = _local_7;
                    _local_7 = _local_8;
                    _local_8 = _local_22;
                }
                if (_local_7 < 1)
                {
                    _local_7 = 1;
                }
                if (_local_8 < 1)
                {
                    _local_8 = 1;
                }
                if (this._roomEngine.getActiveRoomActiveCanvas() == null)
                {
                    return null;
                }
                _local_11 = this._roomEngine.getActiveRoomActiveCanvas().geometry.scale;
                _local_12 = _local_3.canSitOn;
                _local_13 = ((_local_12) ? 0.5 : 0);
                _local_14 = ((((_local_11 / 2) + _arg_2.spriteOffsetX) + _arg_2.localX) / (_local_11 / 4));
                _local_15 = (((_arg_2.spriteOffsetY + _arg_2.localY) + (((_local_9 - _local_13) * _local_11) / 2)) / (_local_11 / 4));
                _local_16 = ((_local_14 + (2 * _local_15)) / 4);
                _local_17 = ((_local_14 - (2 * _local_15)) / 4);
                _local_18 = Math.floor((_local_5 + _local_16));
                _local_19 = Math.floor(((_local_6 - _local_17) + 1));
                _local_20 = false;
                if (((_local_18 < _local_5) || (_local_18 >= (_local_5 + _local_7))))
                {
                    _local_20 = true;
                }
                else
                {
                    if (((_local_19 < _local_6) || (_local_19 >= (_local_6 + _local_8))))
                    {
                        _local_20 = true;
                    }
                }
                _local_21 = ((_local_12) ? (_local_9 - 0.5) : _local_9);
                if (!_local_20)
                {
                    return new Vector3d(_local_18, _local_19, _local_21);
                }
            }
            return null;
        }

        protected function _Str_23428(k:RoomObjectStateChangedEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            this.changeObjectState(_arg_2, k._Str_1577, k.objectType, k.param, false);
        }

        private function _Str_24913(k:RoomObjectStateChangedEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            this.changeObjectState(_arg_2, k._Str_1577, k.objectType, k.param, true);
        }

        private function handleObjectRoomAdEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            var _local_7:String;
            var _local_8:String;
            var _local_9:int;
            if (((this._roomEngine == null) || (k == null)))
            {
                return;
            }
            var _local_3:int = k._Str_1577;
            var _local_4:String = k.objectType;
            var _local_5:int = this._roomEngine.getRoomObjectCategory(_local_4);
            var _local_6:IEventDispatcher = this._roomEngine.events;
            if (_local_6 != null)
            {
                switch (k.type)
                {
                    case RoomObjectWidgetRequestEvent.OPEN_WIDGET:
                        _local_7 = IRoomObjectController(k.object).getEventHandler().widget;
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.OPEN_WIDGET, _arg_2, _local_3, _local_5, _local_7));
                        return;
                    case RoomObjectWidgetRequestEvent.CLOSE_WIDGET:
                        _local_7 = IRoomObjectController(k.object).getEventHandler().widget;
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.CLOSE_WIDGET, _arg_2, _local_3, _local_5, _local_7));
                        return;
                    case RoomObjectWidgetRequestEvent.OPEN_FURNI_CONTEXT_MENU:
                        _local_8 = IRoomObjectController(k.object).getEventHandler().contextMenu;
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_OPEN_FURNI_CONTEXT_MENU, _arg_2, _local_3, _local_5, _local_8));
                        return;
                    case RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_CLOSE_FURNI_CONTEXT_MENU, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.PLACEHOLDER:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PLACEHOLDER, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.CREDITFURNI:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_CREDITFURNI, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.STICKIE:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_STICKIE, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.PRESENT:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PRESENT, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.TROPHY:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_TROPHY, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.TEASER:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_TEASER, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.ECOTRONBOX:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ECOTRONBOX, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.DIMMER:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_DIMMER, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.WIDGET_REMOVE_DIMMER:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REMOVE_DIMMER, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.CLOTHING_CHANGE:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_CLOTHING_CHANGE, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.JUKEBOX_PLAYLIST_EDITOR:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_PLAYLIST_EDITOR, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.MANNEQUIN:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MANNEQUIN, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.PET_PRODUCT_MENU:
                        _local_6.dispatchEvent(new RoomEngineUseProductEvent(RoomEngineUseProductEvent.ROSM_USE_PRODUCT_FROM_ROOM, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.GUILD_FURNI_CONTEXT_MENU:
                        _local_9 = k.object.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_GUILD_CUSTOMIZED_GUILD_ID);
                        this._roomEngine.connection.send(new _Str_10477(k._Str_1577, _local_9));
                        return;
                    case RoomObjectWidgetRequestEvent.MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.ROWRE_REQUEST_MONSTERPLANT_SEED_PLANT_CONFIRMATION_DIALOG, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.ROWRE_REQUEST_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.BACKGROUND_COLOR:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BACKGROUND_COLOR, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.MYSTERYBOX_OPEN_DIALOG:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MYSTERYBOX_OPEN_DIALOG, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.EFFECTBOX_OPEN_DIALOG:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_EFFECTBOX_OPEN_DIALOG, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.MYSTERYTROPHY_OPEN_DIALOG:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_MYSTERYTROPHY_OPEN_DIALOG, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_OPEN:
                        this._roomEngine.connection.send(new _Str_4406(k._Str_1577, 0));
                        return;
                    case RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_ENGRAVING:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.ACHIEVEMENT_RESOLUTION_FAILED:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.FRIEND_FURNITURE_CONFIRM:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_FRIEND_FURNITURE_CONFIRM, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.FRIEND_FURNITURE_ENGRAVING:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.BADGE_DISPLAY_ENGRAVING:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BADGE_DISPLAY_ENGRAVING, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.HIGH_SCORE_DISPLAY:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIGH_SCORE_DISPLAY, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.HIDE_HIGH_SCORE_DISPLAY:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.INERNAL_LINK:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_INTERNAL_LINK, _arg_2, _local_3, _local_5));
                        return;
                    case RoomObjectWidgetRequestEvent.ROOM_LINK:
                        _local_6.dispatchEvent(new RoomEngineTriggerWidgetEvent(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_ROOM_LINK, _arg_2, _local_3, _local_5));
                        return;
                }
            }
        }

        private function handleObjectActionEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            var _local_6:String;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:String;
            var _local_11:String;
            if ((((this._roomEngine == null) || (this._roomEngine.events == null)) || (k == null)))
            {
                return;
            }
            var _local_3:int = k._Str_1577;
            var _local_4:String = k.objectType;
            var _local_5:int = this._roomEngine.getRoomObjectCategory(_local_4);
            var _local_7:RoomObjectRoomAdEvent = (k as RoomObjectRoomAdEvent);
            switch (k.type)
            {
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_CLICK:
                    this._roomEngine.events.dispatchEvent(k);
                    if (((!(_local_7 == null)) && (!(this._roomEngine.toolbar == null))))
                    {
                        if (_local_7.clickUrl == "NAVIGATOR_GAMES")
                        {
                            this._roomEngine.toolbar.toggleWindowVisibility("GAMES");
                        }
                        else
                        {
                            if (_local_7.clickUrl.indexOf("GAME_CENTER:") == 0)
                            {
                                _local_8 = _local_7.clickUrl.split(":");
                                this._roomEngine.gameEngine.showGameCenterByGameName("showGameCenter.billboard", _local_8[1]);
                            }
                            else
                            {
                                if (_local_7.clickUrl != "")
                                {
                                    (this._roomEngine as Component).context.createLinkEvent(_local_7.clickUrl);
                                }
                            }
                        }
                    }
                    _local_6 = RoomEngineRoomAdEvent.FURNI_CLICK;
                    break;
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_DOUBLE_CLICK:
                    if (((!(_local_7 == null)) && (!(this._roomEngine.catalog == null))))
                    {
                        _local_9 = _local_7.clickUrl;
                        _local_10 = "CATALOG_PAGE:";
                        if (((_local_9) && (_local_9.indexOf(_local_10) == 0)))
                        {
                            _local_11 = _local_9.substr(_local_10.length);
                            this._roomEngine.catalog.openCatalogPage(_local_11);
                        }
                    }
                    _local_6 = RoomEngineRoomAdEvent.FURNI_DOUBLE_CLICK;
                    break;
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_SHOW:
                    _local_6 = RoomEngineRoomAdEvent.TOOLTIP_SHOW;
                    break;
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_HIDE:
                    _local_6 = RoomEngineRoomAdEvent.TOOLTIP_HIDE;
                    break;
                case RoomObjectRoomAdEvent.RORAE_ROOM_AD_LOAD_IMAGE:
                    if (_local_7 != null)
                    {
                        this._roomEngine._Str_20364(_arg_2, _local_3, _local_5, _local_7.imageUrl, _local_7.clickUrl);
                    }
                    break;
            }
            if (_local_6 == null)
            {
                return;
            }
            this._roomEngine.events.dispatchEvent(new RoomEngineObjectEvent(_local_6, _arg_2, _local_3, _local_5));
        }

        private function handleObjectSoundMachineEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            this.useObject(_arg_2, k._Str_1577, k.objectType, k.type);
        }

        private function handleObjectJukeboxEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:int = this._roomEngine.getRoomObjectCategory(k.objectType);
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_4 != null)
            {
                if (((_local_4.category == _local_3) && (_local_4.id == k._Str_1577)))
                {
                    if (_local_4.operation == RoomObjectOperationEnum.OBJECT_PLACE)
                    {
                        return;
                    }
                }
            }
            switch (k.type)
            {
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_INIT:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.SOUND_MACHINE_INIT, _arg_2, k._Str_1577, _local_3));
                    return;
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_START:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.SOUND_MACHINE_SWITCHED_ON, _arg_2, k._Str_1577, _local_3));
                    return;
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_STOP:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.SOUND_MACHINE_SWITCHED_OFF, _arg_2, k._Str_1577, _local_3));
                    return;
                case RoomObjectFurnitureActionEvent.SOUND_MACHINE_DISPOSE:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.SOUND_MACHINE_DISPOSE, _arg_2, k._Str_1577, _local_3));
                    return;
            }
        }

        private function handleObjectGroupBadgeEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:int = this._roomEngine.getRoomObjectCategory(k.objectType);
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(_arg_2);
            if (_local_4 != null)
            {
                if (((_local_4.category == _local_3) && (_local_4.id == k._Str_1577)))
                {
                    if (_local_4.operation == RoomObjectOperationEnum.OBJECT_PLACE)
                    {
                        return;
                    }
                }
            }
            switch (k.type)
            {
                case RoomObjectFurnitureActionEvent.JUKEBOX_INIT:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.JUKEBOX_INIT, _arg_2, k._Str_1577, _local_3));
                    return;
                case RoomObjectFurnitureActionEvent.JUKEBOX_START:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.JUKEBOX_SWITCHED_ON, _arg_2, k._Str_1577, _local_3));
                    return;
                case RoomObjectFurnitureActionEvent.JUKEBOX_MACHINE_STOP:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.JUKEBOX_SWITCHED_OFF, _arg_2, k._Str_1577, _local_3));
                    return;
                case RoomObjectFurnitureActionEvent.JUKEBOX_DISPOSE:
                    this._roomEngine.events.dispatchEvent(new RoomObjectSoundMachineEvent(RoomObjectSoundMachineEvent.JUKEBOX_DISPOSE, _arg_2, k._Str_1577, _local_3));
                    return;
            }
        }

        private function handleObjectFloorHoleEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            var _local_6:RoomObjectBadgeAssetEvent;
            if ((((this._roomEngine == null) || (this._roomEngine.events == null)) || (k == null)))
            {
                return;
            }
            var _local_3:int = k._Str_1577;
            var _local_4:String = k.objectType;
            var _local_5:int = this._roomEngine.getRoomObjectCategory(_local_4);
            if (k.type == RoomObjectBadgeAssetEvent.ROGBE_LOAD_BADGE)
            {
                _local_6 = (k as RoomObjectBadgeAssetEvent);
                if (_local_6 != null)
                {
                    this._roomEngine.requestBadgeImageAsset(_arg_2, _local_3, _local_5, _local_6.badgeId, _local_6._Str_14095);
                }
            }
        }

        private function handleRoomActionMouseRequestEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomObjectFloorHoleEvent.ROFHO_ADD_HOLE:
                    this._roomEngine.addFloorHole(_arg_2, k._Str_1577);
                    return;
                case RoomObjectFloorHoleEvent.ROFHO_REMOVE_HOLE:
                    this._roomEngine.removeFloorHole(_arg_2, k._Str_1577);
                    return;
            }
        }

        private function handleObjectDimmerStateEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            this._roomEngine.requestMouseCursor(k.type, k._Str_1577, k.objectType);
        }

        private function handleRoomObjectDataRequestEvent(k:RoomObjectEvent, _arg_2:int):void
        {
            var _local_4:RoomObjectDimmerStateUpdateEvent;
            var _local_5:RoomEngineDimmerStateEvent;
            if (k == null)
            {
                return;
            }
            var _local_3:int = k._Str_1577;
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                switch (k.type)
                {
                    case RoomObjectDimmerStateUpdateEvent.DIMMER_STATE:
                        _local_4 = (k as RoomObjectDimmerStateUpdateEvent);
                        if (_local_4 != null)
                        {
                            _local_5 = new RoomEngineDimmerStateEvent(_arg_2, _local_4.state, _local_4._Str_14686, _local_4._Str_6815, _local_4.color, _local_4._Str_5123);
                            this._roomEngine.events.dispatchEvent(_local_5);
                        }
                        return;
                }
            }
        }

        private function handleRoomObjectPlaySoundEvent(k:RoomObjectPlaySoundIdEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:int = this._roomEngine.getRoomObjectCategory(k.objectType);
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                switch (k.type)
                {
                    case RoomObjectPlaySoundIdEvent.ROPSIE_PLAY_SOUND:
                        this._roomEngine.events.dispatchEvent(new RoomEnginePlaySoundEvent(RoomEnginePlaySoundEvent.PLAY_SOUND, _arg_2, k._Str_1577, _local_3, k.soundId, k._Str_4740));
                        return;
                    case RoomObjectPlaySoundIdEvent.ROPSIE_PLAY_SOUND_AT_PITCH:
                        this._roomEngine.events.dispatchEvent(new RoomEnginePlaySoundEvent(RoomEnginePlaySoundEvent.PLAY_SOUND_AT_PITCH, _arg_2, k._Str_1577, _local_3, k.soundId, k._Str_4740));
                        return;
                }
            }
        }

        private function handleRoomObjectSamplePlaybackEvent(k:RoomObjectSamplePlaybackEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            var _local_3:int = this._roomEngine.getRoomObjectCategory(k.objectType);
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                switch (k.type)
                {
                    case RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_INITIALIZED:
                        this._roomEngine.events.dispatchEvent(new RoomEngineObjectSamplePlaybackEvent(RoomEngineObjectSamplePlaybackEvent.REOSPE_ROOM_OBJECT_INITIALIZED, _arg_2, k._Str_1577, _local_3, k._Str_6992, k._Str_4740));
                        return;
                    case RoomObjectSamplePlaybackEvent.ROPSPE_ROOM_OBJECT_DISPOSED:
                        this._roomEngine.events.dispatchEvent(new RoomEngineObjectSamplePlaybackEvent(RoomEngineObjectSamplePlaybackEvent.REOSPE_ROOM_OBJECT_DISPOSED, _arg_2, k._Str_1577, _local_3, k._Str_6992, k._Str_4740));
                        return;
                    case RoomObjectSamplePlaybackEvent.ROPSPE_PLAY_SAMPLE:
                        this._roomEngine.events.dispatchEvent(new RoomEngineObjectSamplePlaybackEvent(RoomEngineObjectSamplePlaybackEvent.REOSPE_PLAY_SAMPLE, _arg_2, k._Str_1577, _local_3, k._Str_6992, k._Str_4740));
                        return;
                    case RoomObjectSamplePlaybackEvent.ROPSPE_CHANGE_PITCH:
                        this._roomEngine.events.dispatchEvent(new RoomEngineObjectSamplePlaybackEvent(RoomEngineObjectSamplePlaybackEvent.REOSPE_CHANGE_PITCH, _arg_2, k._Str_1577, _local_3, k._Str_6992, k._Str_4740));
                        return;
                }
            }
        }

        private function handleRoomObjectHSLColorEnableEvent(k:RoomObjectHSLColorEnableEvent, _arg_2:int):void
        {
            if (k == null)
            {
                return;
            }
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                switch (k.type)
                {
                    case RoomObjectHSLColorEnableEvent.ROHSLCEE_ROOM_BACKGROUND_COLOR:
                        this._roomEngine.events.dispatchEvent(new RoomObjectHSLColorEnabledEvent(RoomObjectHSLColorEnabledEvent.ROOM_BACKGROUND_COLOR, _arg_2, k.enable, k.hue, k.saturation, k.lightness));
                        return;
                }
            }
        }

        private function handleSelectedObjectMove(k:RoomObjectEvent, _arg_2:int):void
        {
            if ((((this._roomEngine == null) || (k == null)) || (k.object == null)))
            {
                return;
            }
            var _local_3:IRoomObjectModelController = (k.object.getModel() as IRoomObjectModelController);
            switch (k.type)
            {
                case RoomObjectDataRequestEvent.RODRE_CURRENT_USER_ID:
                    _local_3.setNumber(RoomObjectVariableEnum.SESSION_CURRENT_USER_ID, this._roomEngine.sessionDataManager.userId);
                    return;
                case RoomObjectDataRequestEvent.RODRE_URL_PREFIX:
                    _local_3.setString(RoomObjectVariableEnum.SESSION_URL_PREFIX, this._roomEngine.configuration.getProperty("url.prefix"));
                    return;
            }
        }

        private function handleSelectedObjectRemove(k:RoomObjectEvent, _arg_2:int):void
        {
            var _local_8:IVector3d;
            var _local_9:RoomObjectUpdateMessage;
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_3:int = k._Str_1577;
            var _local_4:String = k.objectType;
            var _local_5:int = this._roomEngine.getRoomObjectCategory(_local_4);
            var _local_6:IRoomObjectController = (this._roomEngine.getRoomObject(_arg_2, _local_3, _local_5) as IRoomObjectController);
            var _local_7:IRoomObjectController = this._roomEngine.getSelectionArrow(_arg_2);
            if ((((!(_local_6 == null)) && (!(_local_7 == null))) && (!(_local_7.getEventHandler() == null))))
            {
                _local_8 = _local_6.getLocation();
                _local_9 = new RoomObjectUpdateMessage(_local_8, null);
                _local_7.getEventHandler().processUpdateMessage(_local_9);
            }
        }

        private function _Str_25365(k:RoomObjectEvent, _arg_2:int):void
        {
            this.setSelectedAvatar(_arg_2, 0, false);
        }

        private function handleFurnitureMove(k:IRoomObjectController, _arg_2:SelectedRoomObjectData, _arg_3:int, _arg_4:int, _arg_5:FurniStackingHeightMap):Boolean
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            var _local_6:Vector3d = new Vector3d();
            _local_6.assign(k.getDirection());
            k.setDirection(_arg_2.dir);
            var _local_7:Vector3d = new Vector3d(_arg_3, _arg_4, 0);
            var _local_8:Vector3d = new Vector3d();
            _local_8.assign(k.getDirection());
            var _local_9:Vector3d = this._Str_21004(k, _local_7, _arg_2.loc, _arg_2.dir, _arg_5);
            if (_local_9 == null)
            {
                _local_8.x = this.getValidRoomObjectDirection(k, true);
                k.setDirection(_local_8);
                _local_9 = this._Str_21004(k, _local_7, _arg_2.loc, _arg_2.dir, _arg_5);
            }
            if (_local_9 == null)
            {
                k.setDirection(_local_6);
                return false;
            }
            k.setLocation(_local_9);
            if (_local_8)
            {
                k.setDirection(_local_8);
            }
            return true;
        }

        private function handleWallItemMove(k:IRoomObjectController, _arg_2:SelectedRoomObjectData, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:Number, _arg_7:Number, _arg_8:Number):Boolean
        {
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            var _local_9:Vector3d = new Vector3d(_arg_8);
            var _local_10:Vector3d = this._Str_25568(k, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_2);
            if (_local_10 == null)
            {
                return false;
            }
            k.setLocation(_local_10);
            k.setDirection(_local_9);
            return true;
        }

        private function handleUserPlace(k:IRoomObjectController, _arg_2:int, _arg_3:int, _arg_4:LegacyWallGeometry):Boolean
        {
            if (!_arg_4._Str_10375(_arg_2, _arg_3))
            {
                return false;
            }
            k.setLocation(new Vector3d(_arg_2, _arg_3, _arg_4._Str_2754(_arg_2, _arg_3)));
            return true;
        }

        private function _Str_22517(k:IRoomObject, _arg_2:IVector3d, _arg_3:FurniStackingHeightMap):Boolean
        {
            var _local_12:Boolean;
            if ((((k == null) || (k.getModel() == null)) || (_arg_2 == null)))
            {
                return false;
            }
            var _local_4:IVector3d = k.getDirection();
            var _local_5:IVector3d = k.getLocation();
            if (((_local_4 == null) || (_local_5 == null)))
            {
                return false;
            }
            if ((_local_4.x % 180) == (_arg_2.x % 180))
            {
                return true;
            }
            var _local_6:int = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
            var _local_7:int = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
            if (_local_6 < 1)
            {
                _local_6 = 1;
            }
            if (_local_7 < 1)
            {
                _local_7 = 1;
            }
            var _local_8:int = _local_6;
            var _local_9:int = _local_7;
            var _local_10:int;
            var _local_11:int = ((int((_arg_2.x + 45)) % 360) / 90);
            if (((_local_11 == 1) || (_local_11 == 3)))
            {
                _local_10 = _local_6;
                _local_6 = _local_7;
                _local_7 = _local_10;
            }
            _local_11 = ((int((_local_4.x + 45)) % 360) / 90);
            if (((_local_11 == 1) || (_local_11 == 3)))
            {
                _local_10 = _local_8;
                _local_8 = _local_9;
                _local_9 = _local_10;
            }
            if (((!(_arg_3 == null)) && (!(_local_5 == null))))
            {
                _local_12 = (k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_ALWAYS_STACKABLE) == 1);
                if (_arg_3.validateLocation(_local_5.x, _local_5.y, _local_6, _local_7, _local_5.x, _local_5.y, _local_8, _local_9, _local_12, _local_5.z))
                {
                    return true;
                }
                return false;
            }
            return false;
        }

        private function _Str_21004(k:IRoomObject, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:FurniStackingHeightMap):Vector3d
        {
            var _local_15:Vector3d;
            var stackable:Boolean;
            if ((((k == null) || (k.getModel() == null)) || (_arg_2 == null)))
            {
                return null;
            }
            var _local_6:IVector3d = k.getDirection();
            if (_local_6 == null)
            {
                return null;
            }
            if (((_arg_3 == null) || (_arg_4 == null)))
            {
                return null;
            }
            if (((_arg_2.x == _arg_3.x) && (_arg_2.y == _arg_3.y)))
            {
                if (_local_6.x == _arg_4.x)
                {
                    _local_15 = new Vector3d();
                    _local_15.assign(_arg_3);
                    return _local_15;
                }
            }
            var sizeX:int = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
            var sizeY:int = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y);
            if (sizeX < 1)
            {
                sizeX = 1;
            }
            if (sizeY < 1)
            {
                sizeY = 1;
            }
            var _local_9:int = _arg_3.x;
            var _local_10:int = _arg_3.y;
            var _local_11:int = sizeX;
            var _local_12:int = sizeY;
            var _local_13:int;
            var _local_14:int = ((int((_local_6.x + 45)) % 360) / 90);
            if (((_local_14 == 1) || (_local_14 == 3)))
            {
                _local_13 = sizeX;
                sizeX = sizeY;
                sizeY = _local_13;
            }
            _local_14 = ((int((_arg_4.x + 45)) % 360) / 90);
            if (((_local_14 == 1) || (_local_14 == 3)))
            {
                _local_13 = _local_11;
                _local_11 = _local_12;
                _local_12 = _local_13;
            }
            if (((!(_arg_5 == null)) && (!(_arg_2 == null))))
            {
                stackable = (k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_ALWAYS_STACKABLE) == 1);
                if (_arg_5.validateLocation(_arg_2.x, _arg_2.y, sizeX, sizeY, _local_9, _local_10, _local_11, _local_12, stackable))
                {
                    return new Vector3d(_arg_2.x, _arg_2.y, _arg_5._Str_2754(_arg_2.x, _arg_2.y));
                }
                return null;
            }
            return null;
        }

        private function _Str_25568(k:IRoomObject, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:Number, _arg_7:SelectedRoomObjectData):Vector3d
        {
            if (((((((k == null) || (k.getModel() == null)) || (_arg_2 == null)) || (_arg_3 == null)) || (_arg_4 == null)) || (_arg_7 == null)))
            {
                return null;
            }
            var _local_8:Number = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X);
            var _local_9:Number = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z);
            var _local_10:Number = k.getModel().getNumber(RoomObjectVariableEnum.FURNITURE_CENTER_Z);
            if (((((_arg_5 < (_local_8 / 2)) || (_arg_5 > (_arg_3.length - (_local_8 / 2)))) || (_arg_6 < _local_10)) || (_arg_6 > (_arg_4.length - (_local_9 - _local_10)))))
            {
                if (((_arg_5 < (_local_8 / 2)) && (_arg_5 <= (_arg_3.length - (_local_8 / 2)))))
                {
                    _arg_5 = (_local_8 / 2);
                }
                else
                {
                    if (((_arg_5 >= (_local_8 / 2)) && (_arg_5 > (_arg_3.length - (_local_8 / 2)))))
                    {
                        _arg_5 = (_arg_3.length - (_local_8 / 2));
                    }
                }
                if (((_arg_6 < _local_10) && (_arg_6 <= (_arg_4.length - (_local_9 - _local_10)))))
                {
                    _arg_6 = _local_10;
                }
                else
                {
                    if (((_arg_6 >= _local_10) && (_arg_6 > (_arg_4.length - (_local_9 - _local_10)))))
                    {
                        _arg_6 = (_arg_4.length - (_local_9 - _local_10));
                    }
                }
            }
            if (((((_arg_5 < (_local_8 / 2)) || (_arg_5 > (_arg_3.length - (_local_8 / 2)))) || (_arg_6 < _local_10)) || (_arg_6 > (_arg_4.length - (_local_9 - _local_10)))))
            {
                return null;
            }
            var _local_11:Vector3d = Vector3d.sum(Vector3d.product(_arg_3, (_arg_5 / _arg_3.length)), Vector3d.product(_arg_4, (_arg_6 / _arg_4.length)));
            _local_11 = Vector3d.sum(_arg_2, _local_11);
            return _local_11;
        }

        private function setObjectAlphaMultiplier(k:IRoomObjectController, _arg_2:Number):void
        {
            if (((!(k == null)) && (!(k.getModelController() == null))))
            {
                k.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER, _arg_2);
            }
        }

        public function setSelectedAvatar(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            var _local_4:int = RoomObjectCategoryEnum.CONST_100;
            var _local_5:IRoomObjectController = (this._roomEngine.getRoomObject(k, this._selectedAvatarId, _local_4) as IRoomObjectController);
            if (((!(_local_5 == null)) && (!(_local_5.getEventHandler() == null))))
            {
                _local_5.getEventHandler().processUpdateMessage(new RoomObjectAvatarSelectedMessage(false));
                this._selectedAvatarId = -1;
            }
            var _local_6:Boolean;
            if (_arg_3)
            {
                _local_5 = (this._roomEngine.getRoomObject(k, _arg_2, _local_4) as IRoomObjectController);
                if (((!(_local_5 == null)) && (!(_local_5.getEventHandler() == null))))
                {
                    _local_5.getEventHandler().processUpdateMessage(new RoomObjectAvatarSelectedMessage(true));
                    _local_6 = true;
                    this._selectedAvatarId = _arg_2;
                    try
                    {
                        this._roomEngine.connection.send(new _Str_10602(_local_5.getLocation().x, _local_5.getLocation().y));
                    }
                    catch(e:Error)
                    {
                    }
                }
            }
            var _local_7:IRoomObjectController = this._roomEngine.getSelectionArrow(k);
            if (((!(_local_7 == null)) && (!(_local_7.getEventHandler() == null))))
            {
                if (((_local_6) && (!(this._roomEngine.getActiveRoomIsPlayingGame()))))
                {
                    _local_7.getEventHandler().processUpdateMessage(new RoomObjectVisibilityUpdateMessage(RoomObjectVisibilityUpdateMessage.ROVUM_ENABLED));
                }
                else
                {
                    _local_7.getEventHandler().processUpdateMessage(new RoomObjectVisibilityUpdateMessage(RoomObjectVisibilityUpdateMessage.ROVUM_DISABLED));
                }
            }
        }

        public function getSelectedAvatarId():int
        {
            return this._selectedAvatarId;
        }

        private function getValidRoomObjectDirection(k:IRoomObjectController, _arg_2:Boolean):int
        {
            var _local_6:int;
            var _local_7:int;
            if (((k == null) || (k.getModel() == null)))
            {
                return 0;
            }
            var _local_3:Array;
            var _local_4:String = k.getType();
            if (k.getModel() != null)
            {
                if (_local_4 == RoomObjectUserTypes.MONSTERPLANT)
                {
                    _local_3 = k.getModel().getNumberArray(RoomObjectVariableEnum.PET_ALLOWED_DIRECTIONS);
                }
                else
                {
                    _local_3 = k.getModel().getNumberArray(RoomObjectVariableEnum.FURNITURE_ALLOWED_DIRECTIONS);
                }
            }
            var _local_5:int = k.getDirection().x;
            if (((!(_local_3 == null)) && (_local_3.length > 0)))
            {
                _local_6 = _local_3.indexOf(_local_5);
                if (_local_6 < 0)
                {
                    _local_6 = 0;
                    _local_7 = 0;
                    while (_local_7 < _local_3.length)
                    {
                        if (_local_5 <= _local_3[_local_7])
                        {
                            break;
                        }
                        _local_6++;
                        _local_7++;
                    }
                    _local_6 = (_local_6 % _local_3.length);
                }
                if (_arg_2)
                {
                    _local_6 = ((_local_6 + 1) % _local_3.length);
                }
                else
                {
                    _local_6 = (((_local_6 - 1) + _local_3.length) % _local_3.length);
                }
                _local_5 = _local_3[_local_6];
            }
            return _local_5;
        }

        public function modifyRoomObjectData(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Map):Boolean
        {
            if (this._roomEngine == null)
            {
                return false;
            }
            var _local_6:IRoomObjectController = (this._roomEngine.getRoomObject(k, _arg_2, _arg_3) as IRoomObjectController);
            if (_local_6 == null)
            {
                return false;
            }
            switch (_arg_4)
            {
                case RoomObjectOperationEnum.OBJECT_SAVE_STUFF_DATA:
                    if (this._roomEngine.connection)
                    {
                        this._roomEngine.connection.send(new _Str_5686(_arg_2, _arg_5));
                    }
                    break;
                default:
                    Logger.log(("could not modify room object data, unknown operation " + _arg_4));
            }
            return true;
        }

        public function updateObjectWallItemData(k:int, _arg_2:int, _arg_3:int, _arg_4:String):Boolean
        {
            var _local_12:SelectedRoomObjectData;
            var _local_13:int;
            var _local_14:LegacyWallGeometry;
            var _local_15:String;
            if (this._roomEngine == null)
            {
                return false;
            }
            var _local_5:IRoomObjectController = (this._roomEngine.getRoomObject(k, _arg_2, _arg_3) as IRoomObjectController);
            if (_local_5 == null)
            {
                return false;
            }
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Boolean = true;
            var _local_10:IRoomSession;
            var _local_11:RoomUserData;
            switch (_arg_4)
            {
                case RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE:
                case RoomObjectOperationEnum.OBJECT_ROTATE_NEGATIVE:
                    if (this._roomEngine.connection)
                    {
                        if (_arg_4 == RoomObjectOperationEnum.OBJECT_ROTATE_NEGATIVE)
                        {
                            _local_8 = this.getValidRoomObjectDirection(_local_5, false);
                        }
                        else
                        {
                            _local_8 = this.getValidRoomObjectDirection(_local_5, true);
                        }
                        _local_6 = _local_5.getLocation().x;
                        _local_7 = _local_5.getLocation().y;
                        if (this._Str_22517(_local_5, new Vector3d(_local_8), this._roomEngine.getFurniStackingHeightMap(k)))
                        {
                            _local_8 = int((_local_8 / 45));
                            if (_local_5.getType() == RoomObjectUserTypes.MONSTERPLANT)
                            {
                                _local_10 = this._roomEngine.roomSessionManager.getSession(k);
                                if (_local_10 != null)
                                {
                                    _local_11 = _local_10.userDataManager.getUserDataByIndex(_arg_2);
                                    if (_local_11 != null)
                                    {
                                        this._roomEngine.connection.send(new _Str_8026(_local_11._Str_2394, _local_6, _local_7, _local_8));
                                    }
                                }
                            }
                            else
                            {
                                this._roomEngine.connection.send(new _Str_7684(_arg_2, _local_6, _local_7, _local_8));
                            }
                        }
                    }
                    break;
                case RoomObjectOperationEnum.OBJECT_EJECT:
                case RoomObjectOperationEnum.OBJECT_PICKUP:
                    if (this._roomEngine.connection)
                    {
                        this._roomEngine.connection.send(new _Str_9462(_arg_2, _arg_3));
                    }
                    break;
                case RoomObjectOperationEnum.OBJECT_PICKUP_PET:
                    if (this._roomEngine.connection)
                    {
                        _local_10 = this._roomEngine.roomSessionManager.getSession(k);
                        if (_local_10 != null)
                        {
                            _local_11 = _local_10.userDataManager.getUserDataByIndex(_arg_2);
                            _local_10._Str_13781(_local_11._Str_2394);
                        }
                    }
                    break;
                case RoomObjectOperationEnum.OBJECT_PICKUP_BOT:
                    if (this._roomEngine.connection)
                    {
                        _local_10 = this._roomEngine.roomSessionManager.getSession(k);
                        if (_local_10 != null)
                        {
                            _local_11 = _local_10.userDataManager.getUserDataByIndex(_arg_2);
                            if (_local_11 != null)
                            {
                                this._roomEngine.connection.send(new _Str_5937(_local_11._Str_2394));
                            }
                        }
                    }
                    break;
                case RoomObjectOperationEnum.OBJECT_MOVE:
                    _local_9 = false;
                    this.setObjectAlphaMultiplier(_local_5, 0.5);
                    this.setSelectedObjectData(k, _local_5.getId(), _arg_3, _local_5.getLocation(), _local_5.getDirection(), _arg_4);
                    this._roomEngine.setObjectMoverIconSprite(_local_5.getId(), _arg_3, true);
                    this._roomEngine.setObjectMoverIconSpriteVisible(false);
                    break;
                case RoomObjectOperationEnum.OBJECT_MOVE_TO:
                    _local_12 = this.getSelectedObjectData(k);
                    this.updateSelectedObjectData(k, _local_12.id, _local_12.category, _local_12.loc, _local_12.dir, RoomObjectOperationEnum.OBJECT_MOVE_TO, _local_12.typeId, _local_12._Str_4766, _local_12.stuffData, _local_12.state, _local_12._Str_15896, _local_12.posture);
                    this.setObjectAlphaMultiplier(_local_5, 1);
                    this._roomEngine.removeObjectMoverIconSprite();
                    if (this._roomEngine.connection)
                    {
                        if (_arg_3 == RoomObjectCategoryEnum.CONST_10)
                        {
                            _local_8 = (int(_local_5.getDirection().x) % 360);
                            _local_6 = _local_5.getLocation().x;
                            _local_7 = _local_5.getLocation().y;
                            _local_8 = int((_local_8 / 45));
                            this._roomEngine.connection.send(new _Str_7684(_arg_2, _local_6, _local_7, _local_8));
                        }
                        else
                        {
                            if (_arg_3 == RoomObjectCategoryEnum.CONST_100)
                            {
                                _local_8 = (int(_local_5.getDirection().x) % 360);
                                _local_6 = _local_5.getLocation().x;
                                _local_7 = _local_5.getLocation().y;
                                _local_8 = int((_local_8 / 45));
                                _local_13 = parseInt(_local_5.getModel().getString(RoomObjectVariableEnum.RACE));
                                _local_10 = this._roomEngine.roomSessionManager.getSession(k);
                                if (_local_10 != null)
                                {
                                    _local_11 = _local_10.userDataManager.getUserDataByIndex(_arg_2);
                                    if (_local_11 != null)
                                    {
                                        this._roomEngine.connection.send(new _Str_8026(_local_11._Str_2394, _local_6, _local_7, _local_8));
                                    }
                                }
                            }
                            else
                            {
                                if (_arg_3 == RoomObjectCategoryEnum.CONST_20)
                                {
                                    _local_8 = (int(_local_5.getDirection().x) % 360);
                                    _local_14 = this._roomEngine.getLegacyGeometry(k);
                                    if (((this._roomEngine.connection) && (_local_14)))
                                    {
                                        _local_15 = _local_14.getOldLocationString(_local_5.getLocation(), _local_8);
                                        if (_local_15 != null)
                                        {
                                            this._roomEngine.connection.send(new _Str_12057(_arg_2, RoomObjectCategoryEnum.CONST_20, _local_15));
                                        }
                                    }
                                }
                            }
                        }
                    }
                    break;
            }
            if (_local_9)
            {
                this.resetSelectedObjectData(k);
            }
            return true;
        }

        private function placeObjectOnUser(k:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(k);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:IRoomObjectController = (this._roomEngine.getRoomObject(k, _arg_2, _arg_3) as IRoomObjectController);
            if (_local_5 == null)
            {
                return;
            }
            if (((this._roomEngine) && (this._roomEngine.events)))
            {
                this._roomEngine.events.dispatchEvent(new RoomEngineObjectPlacedOnUserEvent(RoomEngineObjectEvent.PLACED_ON_USER, k, _arg_2, _arg_3, _local_4.id, _local_4.category));
            }
        }

        private function _Str_19271(k:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_7:IRoomObjectController;
            var _local_14:IVector3d;
            var _local_15:LegacyWallGeometry;
            var _local_16:Boolean;
            var _local_4:SelectedRoomObjectData = this.getSelectedObjectData(k);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:int = _local_4.id;
            var _local_6:int = _local_4.category;
            var _local_8:String = "";
            var _local_9:Number = 0;
            var _local_10:Number = 0;
            var _local_11:Number = 0;
            var _local_12:int;
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                _local_7 = (this._roomEngine.getRoomObject(k, _local_5, _local_6) as IRoomObjectController);
                if (_local_7 != null)
                {
                    _local_12 = _local_7.getDirection().x;
                    _local_14 = _local_7.getLocation();
                    if (((_local_6 == RoomObjectCategoryEnum.CONST_10) || (_local_6 == RoomObjectCategoryEnum.CONST_100)))
                    {
                        _local_9 = _local_14.x;
                        _local_10 = _local_14.y;
                        _local_11 = _local_14.z;
                    }
                    else
                    {
                        if (_local_6 == RoomObjectCategoryEnum.CONST_20)
                        {
                            _local_9 = _local_14.x;
                            _local_10 = _local_14.y;
                            _local_11 = _local_14.z;
                            _local_15 = this._roomEngine.getLegacyGeometry(k);
                            if (_local_15 != null)
                            {
                                _local_8 = _local_15.getOldLocationString(_local_14, _local_12);
                            }
                        }
                    }
                    _local_12 = ((((_local_12 / 45) % 8) + 8) % 8);
                    if (((_local_7.getType() == "free_placement_room") && (this.roomEngine.getRoom(k).getObjectCountForType("free_placement_room", RoomObjectCategoryEnum.CONST_10) > 1)))
                    {
                        this.roomEngine.windowManager.alert("One free placement furni already in room!", "There can be only one free_placement_room furni in a room. See intraweb for instructions on how to use it.", _Str_3023.NULL, null);
                        return;
                    }
                    if (((_local_5 < 0) && (_local_6 == RoomObjectCategoryEnum.CONST_100)))
                    {
                        _local_5 = (_local_5 * -1);
                    }
                    if ((((this._roomEngine.catalog == null) || (this._roomEngine.catalog.catalogType == CatalogType.NORMAL)) || (!(this._objectPlacementSource == RoomObjectPlacementSource.CATALOG))))
                    {
                        if (((_local_6 == RoomObjectCategoryEnum.CONST_100) && (_local_4.typeId == RoomObjectTypeEnum.PET)))
                        {
                            this._roomEngine.connection.send(new _Str_8042(_local_5, int(_local_9), int(_local_10)));
                        }
                        else
                        {
                            if (((_local_6 == RoomObjectCategoryEnum.CONST_100) && (_local_4.typeId == RoomObjectTypeEnum.RENTABLE_BOT)))
                            {
                                this._roomEngine.connection.send(new _Str_8136(_local_5, int(_local_9), int(_local_10)));
                            }
                            else
                            {
                                if (_local_7.getModelController().getString(RoomObjectVariableEnum.FURNITURE_IS_STICKIE) != null)
                                {
                                    this._roomEngine.connection.send(new _Str_11777(_local_5, _local_8));
                                }
                                else
                                {
                                    this._roomEngine.connection.send(new _Str_6790(_local_5, _local_6, _local_8, int(_local_9), int(_local_10), _local_12));
                                }
                            }
                        }
                    }
                }
            }
            var _local_13:SelectedRoomObjectData = new SelectedRoomObjectData(_local_4.id, _local_4.category, null, null, null);
            this._roomEngine.setPlacedObjectData(k, _local_13);
            this.resetSelectedObjectData(k);
            if (((this._roomEngine) && (this._roomEngine.events)))
            {
                _local_16 = ((_local_7) && (_local_7.getId() == _local_4.id));
                this._roomEngine.events.dispatchEvent(new RoomEngineObjectPlacedEvent(RoomEngineObjectEvent.PLACED, k, _local_5, _local_6, _local_8, _local_9, _local_10, _local_11, _local_12, _local_16, _arg_2, _arg_3, _local_4._Str_4766));
            }
        }

        private function changeObjectState(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:int = this._roomEngine.getRoomObjectCategory(_arg_3);
            this._Str_15499(k, _arg_2, _local_6, _arg_4, _arg_5);
        }

        private function _Str_15499(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean):Boolean
        {
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                if (_arg_3 == RoomObjectCategoryEnum.CONST_10)
                {
                    if (!_arg_5)
                    {
                        this._roomEngine.connection.send(new _Str_3382(_arg_2, _arg_4));
                    }
                    else
                    {
                        this._roomEngine.connection.send(new _Str_10710(_arg_2, _arg_4));
                    }
                }
                else
                {
                    if (_arg_3 == RoomObjectCategoryEnum.CONST_20)
                    {
                        this._roomEngine.connection.send(new _Str_12401(_arg_2, _arg_4));
                    }
                }
            }
            return true;
        }

        private function useObject(k:int, _arg_2:int, _arg_3:String, _arg_4:String):void
        {
            if (((!(this._roomEngine == null)) && (!(this._roomEngine.connection == null))))
            {
                switch (_arg_4)
                {
                    case RoomObjectFurnitureActionEvent.DICE_ACTIVATE:
                        this._roomEngine.connection.send(new _Str_11935(_arg_2));
                        return;
                    case RoomObjectFurnitureActionEvent.DICE_OFF:
                        this._roomEngine.connection.send(new _Str_11639(_arg_2));
                        return;
                    case RoomObjectFurnitureActionEvent.USE_HABBOWHEEL:
                        this._roomEngine.connection.send(new _Str_12182(_arg_2));
                        return;
                    case RoomObjectFurnitureActionEvent.STICKIE:
                        this._roomEngine.connection.send(new _Str_10136(_arg_2));
                        return;
                    case RoomObjectFurnitureActionEvent.ENTER_ONEWAYDOOR:
                        this._roomEngine.connection.send(new _Str_10097(_arg_2));
                        return;
                }
            }
        }

        public function modifyWallItemData(k:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean
        {
            if (((this._roomEngine == null) || (this._roomEngine.connection == null)))
            {
                return false;
            }
            this._roomEngine.connection.send(new _Str_10640(_arg_2, _arg_3, _arg_4));
            return true;
        }

        public function deleteWallItem(k:int, _arg_2:int):Boolean
        {
            if (((this._roomEngine == null) || (this._roomEngine.connection == null)))
            {
                return false;
            }
            this._roomEngine.connection.send(new _Str_9799(_arg_2));
            return true;
        }

        private function handleClickOnTile(k:int, _arg_2:RoomObjectTileMouseEvent):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            if (this._roomEngine.getIsSelectedObjectInValidPosition)
            {
                return;
            }
            if (!this._roomEngine.roomSessionManager)
            {
                return;
            }
            var _local_3:IRoomSession = this._roomEngine.roomSessionManager.getSession(k);
            if (((!(_local_3 == null)) && (_local_3._Str_4780)))
            {
                return;
            }
			HabboGamesCom.log("RoomObjectEventHandler: Clicked!");
			if (this._roomEngine.setIsSelectedObjectInValidPosition)
            {
				HabboGamesCom.log("RoomObjectEventHandler: First boolean set | this._roomEngine.playerUnderCursor = " + this._roomEngine.playerUnderCursor);
                if (this._roomEngine.playerUnderCursor >= 0)
                {
                    this._roomEngine.gameEngine._SafeStr_7623(this._roomEngine.playerUnderCursor, _arg_2.altKey, _arg_2.shiftKey);
                }
                else
                {
                    this._roomEngine.gameEngine._SafeStr_7622(_arg_2);
                }
            }
            else
            {
				this.walkTo(_arg_2.tileXAsInt, _arg_2.tileYAsInt);
            }
        }

        private function walkTo(k:int, _arg_2:int):void
        {
            if (this._roomEngine.connection)
            {
                this._roomEngine.connection.send(new _Str_10596(k, _arg_2));
            }
        }

        private function handleClickOnAvatar(k:int, _arg_2:RoomObjectMouseEvent):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            if (this.roomEngine.getIsSelectedObjectInValidPosition)
            {
                return;
            }
			
			//Added for snowstorm.
            if (this._roomEngine.setIsSelectedObjectInValidPosition)
            {
                this._roomEngine.gameEngine._SafeStr_7623(k, _arg_2.altKey, _arg_2.shiftKey);
            }
        }

        private function handleMouseEnterAvatar(k:int, _arg_2:RoomObjectMouseEvent, _arg_3:int):void
        {
            var _local_4:IRoomObjectController;
            var _local_5:IRoomObjectController;
            var _local_6:RoomObjectUpdateMessage;
            var _local_7:IVector3d;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
			
            if (this._roomEngine == null)
            {
                return;
            }
            if (this.roomEngine.getIsSelectedObjectInValidPosition)
            {
                return;
            }
			
			//Added for snowstorm.
			if (this._roomEngine.setIsSelectedObjectInValidPosition)
            {
                _local_4 = this._roomEngine.getTileCursor(_arg_3);
                if (((!(_local_4 == null)) && (!(_local_4.getEventHandler() == null))))
                {
                    _local_5 = (this._roomEngine.getRoomObject(_arg_3, k, RoomObjectCategoryEnum.CONST_100) as IRoomObjectController);
                    _local_6 = null;
                    if (_local_5 != null)
                    {
                        _local_7 = _local_5.getLocation();
                        _local_8 = _local_7.x;
                        _local_9 = _local_7.y;
                        _local_10 = _local_7.z;
                        _local_6 = new RoomObjectUpdateMessage(new Vector3d(_local_8, _local_9, _local_10), null);
                        _local_4.getEventHandler().processUpdateMessage(_local_6);
                    }
                }
                this._roomEngine.gameEngine._SafeStr_7625(k, _arg_2.altKey, _arg_2.shiftKey);
            }
        }
    }
}
