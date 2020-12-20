package com.sulake.habbo.room
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.habbo.communication.messages.incoming.room.layout.RoomEntryTileMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomPropertyMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.FloorHeightMapEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.HeightMapEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.HeightMapUpdateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.RoomVisualizationSettingsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.FurnitureAliasesMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectsMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectAddMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectUpdateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectDataUpdateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectsDataUpdateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectRemoveMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemsEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemAddMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemRemoveMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemUpdateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemDataUpdateMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UsersEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserRemoveMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.ExpressionMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.DanceMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.AvatarEffectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.SleepMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.CarryObjectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.UseObjectMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.engine.SlideObjectBundleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.ChatMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.WhisperMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.ShoutMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat.UserTypingMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.DiceValueMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.OneWayDoorStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetExperienceEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.YouArePlayingGameMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session.GamePlayerValueMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetFigureUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.users.IgnoreResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionStartedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionEndedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionErrorMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.GetFurnitureAliasesMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.engine.GetRoomEntryDataMessageComposer;
    import com.sulake.habbo.communication.messages.parser.room.engine.FurnitureAliasesMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.HeightMapMessageParser;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.communication.messages.parser.room.engine.HeightMapUpdateMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomVisualizationSettingsParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomPropertyMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.FloorHeightMapMessageParser;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.communication.messages.parser.room.layout.RoomEntryTileMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectMessageData;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectAddMessageParser;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectUpdateMessageParser;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectDataUpdateMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ObjectData;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsDataUpdateMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectRemoveMessageParser;
    import flash.utils.setTimeout;
    import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemsMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemAddMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemRemoveMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemUpdateMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemDataUpdateMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserMessageData;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserUpdateMessageData;
    import com.sulake.habbo.communication.messages.incoming.room.engine.AvatarActionMessageData;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserUpdateMessageParser;
    import com.sulake.room.IRoomInstance;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserRemoveMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetFigureUpdateParser;
    import com.sulake.habbo.communication.messages.parser.room.action.ExpressionMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.action.DanceMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.action.AvatarEffectMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.action.SleepMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.action.CarryObjectMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.action.UseObjectMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine.SlideObjectBundleMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.SlideObjectMessageData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.communication.messages.parser.room.chat.ChatMessageParser;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.room.chat.UserTypingMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetExperienceParser;
    import com.sulake.habbo.communication.messages.parser.room.furniture.DiceValueMessageParser;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.habbo.communication.messages.parser.room.furniture.OneWayDoorStatusMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.session.YouArePlayingGameMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.session.GamePlayerValueMessageParser;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser;
    import com.sulake.habbo.avatar.enum.AvatarGuideStatus;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;

    public class RoomMessageHandler 
    {
        private var _connection:IConnection = null;
        private var _roomCreator:IRoomCreator = null;
        private var _planeParser:RoomPlaneParser = null;
        private var _latestEntryTileEvent:RoomEntryTileMessageEvent = null;
        private var _ownUserId:int = -1;
        private var _initialConnection:Boolean = true;
        private var _passiveObjectRunningId:int = -1000000000;
        private var _currentRoomId:int = 0;
        private var _tempViralHolder:Object;
        private var _guideId:int = -1;
        private var _requesterId:int = -1;

        public function RoomMessageHandler(k:IRoomCreator)
        {
            this._tempViralHolder = new Object();
            super();
            this._roomCreator = k;
            this._planeParser = new RoomPlaneParser();
            this._initialConnection = true;
        }

        public function dispose():void
        {
            this._connection = null;
            this._roomCreator = null;
            if (this._planeParser != null)
            {
                this._planeParser.dispose();
                this._planeParser = null;
            }
            this._latestEntryTileEvent = null;
        }

        public function setCurrentRoom(k:int):void
        {
            if (this._currentRoomId != 0)
            {
                if (this._roomCreator != null)
                {
                    this._roomCreator.disposeRoom(this._currentRoomId);
                }
            }
            this._currentRoomId = k;
            this._latestEntryTileEvent = null;
        }

        public function resetCurrentRoom():void
        {
            this._currentRoomId = 0;
            this._latestEntryTileEvent = null;
        }

        private function getRoomId(k:int):int
        {
            return this._currentRoomId;
        }

        public function set connection(k:IConnection):void
        {
            if (this._connection != null)
            {
                return;
            }
            if (k != null)
            {
                this._connection = k;
                k.addMessageEvent(new UserObjectEvent(this.onOwnUserEvent));
                k.addMessageEvent(new RoomReadyMessageEvent(this.onRoomReady));
                k.addMessageEvent(new RoomPropertyMessageEvent(this.onRoomProperty));
                k.addMessageEvent(new RoomEntryTileMessageEvent(this.onEntryTileData));
                k.addMessageEvent(new FloorHeightMapEvent(this.onFloorHeightMap));
                k.addMessageEvent(new HeightMapEvent(this.onHeightMap));
                k.addMessageEvent(new HeightMapUpdateMessageEvent(this.onHeightMapUpdate));
                k.addMessageEvent(new RoomVisualizationSettingsEvent(this.onRoomVisualizationSettings));
                k.addMessageEvent(new FurnitureAliasesMessageEvent(this.onFurnitureAliases));
                k.addMessageEvent(new ObjectsMessageEvent(this.onObjects));
                k.addMessageEvent(new ObjectAddMessageEvent(this.onObjectAdd));
                k.addMessageEvent(new ObjectUpdateMessageEvent(this.onObjectUpdate));
                k.addMessageEvent(new ObjectDataUpdateMessageEvent(this.onObjectDataUpdate));
                k.addMessageEvent(new ObjectsDataUpdateMessageEvent(this.onObjectsDataUpdate));
                k.addMessageEvent(new ObjectRemoveMessageEvent(this.onObjectRemove));
                k.addMessageEvent(new ItemsEvent(this.onItems));
                k.addMessageEvent(new ItemAddMessageEvent(this.onItemAdd));
                k.addMessageEvent(new ItemRemoveMessageEvent(this.onItemRemove));
                k.addMessageEvent(new ItemUpdateMessageEvent(this.onItemUpdate));
                k.addMessageEvent(new ItemDataUpdateMessageEvent(this.onItemDataUpdate));
                k.addMessageEvent(new UsersEvent(this.onUsers));
                k.addMessageEvent(new UserUpdateEvent(this.onUserUpdate));
                k.addMessageEvent(new UserRemoveMessageEvent(this.onUserRemove));
                k.addMessageEvent(new UserChangeMessageEvent(this.onUserChange));
                k.addMessageEvent(new ExpressionMessageEvent(this.onExpression));
                k.addMessageEvent(new DanceMessageEvent(this.onDance));
                k.addMessageEvent(new AvatarEffectMessageEvent(this.onAvatarEffect));
                k.addMessageEvent(new SleepMessageEvent(this.onAvatarSleep));
                k.addMessageEvent(new CarryObjectMessageEvent(this.onCarryObject));
                k.addMessageEvent(new UseObjectMessageEvent(this.onUseObject));
                k.addMessageEvent(new SlideObjectBundleMessageEvent(this.onSlideUpdate));
                k.addMessageEvent(new ChatMessageEvent(this.onChat));
                k.addMessageEvent(new WhisperMessageEvent(this.onChat));
                k.addMessageEvent(new ShoutMessageEvent(this.onChat));
                k.addMessageEvent(new UserTypingMessageEvent(this.onTypingStatus));
                k.addMessageEvent(new DiceValueMessageEvent(this.onDiceValue));
                k.addMessageEvent(new OneWayDoorStatusMessageEvent(this.onOneWayDoorStatus));
                k.addMessageEvent(new PetExperienceEvent(this.onPetExperience));
                k.addMessageEvent(new YouArePlayingGameMessageEvent(this.onPlayingGame));
                k.addMessageEvent(new GamePlayerValueMessageEvent(this.onGamePlayerNumberValue));
                k.addMessageEvent(new PetFigureUpdateEvent(this.onPetFigureUpdate));
                k.addMessageEvent(new IgnoreResultMessageEvent(this.onIgnoreResult));
                k.addMessageEvent(new GuideSessionStartedMessageEvent(this.onGuideSessionStarted));
                k.addMessageEvent(new GuideSessionEndedMessageEvent(this.onGuideSessionEnded));
                k.addMessageEvent(new GuideSessionErrorMessageEvent(this.onGuideSessionError));
            }
        }

        private function onOwnUserEvent(k:IMessageEvent):void
        {
            var _local_2:UserObjectEvent = (k as UserObjectEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:UserObjectMessageParser = _local_2.getParser();
            if (_local_3 != null)
            {
                this._ownUserId = _local_3.id;
            }
        }

        private function onRoomReady(k:IMessageEvent):void
        {
            var _local_2:RoomReadyMessageEvent = (k as RoomReadyMessageEvent);
            if ((((_local_2 == null) || (_local_2.getParser() == null)) || (k.connection == null)))
            {
                return;
            }
            var _local_3:RoomReadyMessageParser = _local_2.getParser();
            if (this._currentRoomId != _local_3.roomId)
            {
                this.setCurrentRoom(_local_3.roomId);
            }
            var _local_4:String = _local_3.roomType;
            if (this._roomCreator != null)
            {
                this._roomCreator.setWorldType(_local_3.roomId, _local_4);
            }
            if (this._initialConnection)
            {
                k.connection.send(new GetFurnitureAliasesMessageComposer());
                this._initialConnection = false;
            }
            else
            {
                k.connection.send(new GetRoomEntryDataMessageComposer());
            }
        }

        private function onFurnitureAliases(k:IMessageEvent):void
        {
            var _local_2:FurnitureAliasesMessageEvent;
            var _local_3:FurnitureAliasesMessageParser;
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            if (this._roomCreator != null)
            {
                _local_2 = (k as FurnitureAliasesMessageEvent);
                if (((_local_2 == null) || (_local_2.getParser() == null)))
                {
                    return;
                }
                _local_3 = _local_2.getParser();
                if (_local_3 != null)
                {
                    _local_4 = _local_3.aliasCount;
                    _local_5 = 0;
                    while (_local_5 < _local_4)
                    {
                        _local_6 = _local_3.getName(_local_5);
                        _local_7 = _local_3.getAlias(_local_5);
                        this._roomCreator.setRoomObjectAlias(_local_6, _local_7);
                        _local_5++;
                    }
                }
            }
            k.connection.send(new GetRoomEntryDataMessageComposer());
        }

        private function onHeightMap(k:IMessageEvent):void
        {
            var _local_8:int;
            var _local_9:Number;
            var _local_10:Boolean;
            var _local_11:Boolean;
            var _local_2:HeightMapEvent = (k as HeightMapEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:HeightMapMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.width;
            var _local_5:int = _local_3.height;
            var _local_6:FurniStackingHeightMap = new FurniStackingHeightMap(_local_4, _local_5);
            var _local_7:int;
            while (_local_7 < _local_5)
            {
                _local_8 = 0;
                while (_local_8 < _local_4)
                {
                    _local_9 = _local_3.getTileHeight(_local_8, _local_7);
                    _local_10 = _local_3.getStackingBlocked(_local_8, _local_7);
                    _local_11 = _local_3.isRoomTile(_local_8, _local_7);
                    _local_6._Str_3982(_local_8, _local_7, _local_9);
                    _local_6.setStackingBlocked(_local_8, _local_7, _local_10);
                    _local_6.setIsRoomTile(_local_8, _local_7, _local_11);
                    _local_8++;
                }
                _local_7++;
            }
            this._roomCreator.setFurniStackingHeightMap(this._currentRoomId, _local_6);
        }

        private function onHeightMapUpdate(k:IMessageEvent):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_2:HeightMapUpdateMessageEvent = (k as HeightMapUpdateMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:HeightMapUpdateMessageParser = _local_2.getParser();
            var _local_4:FurniStackingHeightMap = this._roomCreator.getFurniStackingHeightMap(this._currentRoomId);
            if (_local_4 == null)
            {
                return;
            }
            while (_local_3.next())
            {
                _local_5 = _local_3.x;
                _local_6 = _local_3.y;
                _local_4._Str_3982(_local_5, _local_6, _local_3.tileHeight);
                _local_4.setStackingBlocked(_local_5, _local_6, _local_3.isStackingBlocked);
                _local_4.setIsRoomTile(_local_5, _local_6, _local_3.isRoomTile);
            }
            this._roomCreator.refreshTileObjectMap(this._currentRoomId, "RoomMessageHandler.onHeightMapUpdate()");
        }

        private function onRoomVisualizationSettings(k:IMessageEvent):void
        {
            var _local_2:RoomVisualizationSettingsEvent = (k as RoomVisualizationSettingsEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:RoomVisualizationSettingsParser = _local_2.getParser();
            var _local_4:* = (!(_local_3.wallsHidden));
            var _local_5:Boolean = true;
            var _local_6:Number = _local_3.wallThicknessMultiplier;
            var _local_7:Number = _local_3.floorThicknessMultiplier;
            if (this._roomCreator != null)
            {
                this._roomCreator.updateObjectRoomVisibilities(this._currentRoomId, _local_4, _local_5);
                this._roomCreator.updateObjectRoomPlaneThicknesses(this._currentRoomId, _local_6, _local_7);
            }
        }

        private function onRoomProperty(k:IMessageEvent):void
        {
            var _local_2:RoomPropertyMessageEvent = (k as RoomPropertyMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:RoomPropertyMessageParser = _local_2.getParser();
            var _local_4:String = _local_3.floorType;
            var _local_5:String = _local_3.wallType;
            var _local_6:String = _local_3.landscapeType;
            if (this._roomCreator != null)
            {
                this._roomCreator.updateObjectRoom(this._currentRoomId, _local_4, _local_5, _local_6);
            }
        }

        private function onEntryTileData(k:RoomEntryTileMessageEvent):void
        {
            this._latestEntryTileEvent = k;
        }

        private function onFloorHeightMap(k:IMessageEvent):void
        {
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_2:FloorHeightMapEvent = (k as FloorHeightMapEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:FloorHeightMapMessageParser = _local_2.getParser();
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_4:LegacyWallGeometry = this._roomCreator.getLegacyGeometry(this._currentRoomId);
            if (_local_4 == null)
            {
                return;
            }
            this._planeParser.reset();
            var _local_5:int = _local_3.width;
            var _local_6:int = _local_3.height;
            this._planeParser.initializeTileMap(_local_5, _local_6);
            var _local_7:Number = -1;
            var _local_8:Number = -1;
            var _local_9:Number = 0;
            var _local_10:Number = 0;
            var _local_11:RoomEntryTileMessageParser;
            if (this._latestEntryTileEvent != null)
            {
                _local_11 = this._latestEntryTileEvent.getParser();
            }
            var _local_12:FurniStackingHeightMap = this._roomCreator.getFurniStackingHeightMap(this._currentRoomId);
            if (_local_12 == null)
            {
                return;
            }
            var _local_13:int;
            while (_local_13 < _local_6)
            {
                _local_17 = 0;
                while (_local_17 < _local_5)
                {
                    _local_18 = _local_3.getTileHeight(_local_17, _local_13);
                    if ((((((_local_13 > 0) && (_local_13 < (_local_6 - 1))) || ((_local_17 > 0) && (_local_17 < (_local_5 - 1)))) && (!(_local_18 == RoomPlaneParser.TILE_BLOCKED))) && ((_local_11 == null) || ((_local_17 == _local_11.x) && (_local_13 == _local_11.y)))))
                    {
                        if ((((_local_3.getTileHeight(_local_17, (_local_13 - 1)) == RoomPlaneParser.TILE_BLOCKED) && (_local_3.getTileHeight((_local_17 - 1), _local_13) == RoomPlaneParser.TILE_BLOCKED)) && (_local_3.getTileHeight(_local_17, (_local_13 + 1)) == RoomPlaneParser.TILE_BLOCKED)))
                        {
                            _local_7 = (_local_17 + 0.5);
                            _local_8 = _local_13;
                            _local_9 = _local_18;
                            _local_10 = 90;
                        }
                        if ((((_local_3.getTileHeight(_local_17, (_local_13 - 1)) == RoomPlaneParser.TILE_BLOCKED) && (_local_3.getTileHeight((_local_17 - 1), _local_13) == RoomPlaneParser.TILE_BLOCKED)) && (_local_3.getTileHeight((_local_17 + 1), _local_13) == RoomPlaneParser.TILE_BLOCKED)))
                        {
                            _local_7 = _local_17;
                            _local_8 = (_local_13 + 0.5);
                            _local_9 = _local_18;
                            _local_10 = 180;
                        }
                    }
                    this._planeParser._Str_3982(_local_17, _local_13, _local_18);
                    _local_17++;
                }
                _local_13++;
            }
            this._planeParser._Str_3982(Math.floor(_local_7), Math.floor(_local_8), _local_9);
            this._planeParser.initializeFromTileData(_local_2.getParser().fixedWallsHeight);
            this._planeParser._Str_3982(Math.floor(_local_7), Math.floor(_local_8), (_local_9 + this._planeParser.wallHeight));
            _local_4.scale = _local_3.scale;
            _local_4.initialize(_local_5, _local_6, this._planeParser.floorHeight);
            var _local_14:int = (_local_3.height - 1);
            while (_local_14 >= 0)
            {
                _local_19 = (_local_3.width - 1);
                while (_local_19 >= 0)
                {
                    _local_4._Str_3982(_local_19, _local_14, this._planeParser.getTileHeight(_local_19, _local_14));
                    _local_19--;
                }
                _local_14--;
            }
            var _local_15:XML = this._planeParser.getXML();
            var _local_16:XML = new (XML)((("<doors>" + (((((((('<door x="' + _local_7) + '" y="') + _local_8) + '" z="') + _local_9) + '" dir="') + _local_10) + '"/>')) + "</doors>"));
            _local_15.appendChild(_local_16);
            this._roomCreator.initializeRoom(this._currentRoomId, _local_15);
            if (this._tempViralHolder.objectData)
            {
                this.addActiveObject(this._currentRoomId, this._tempViralHolder.objectData);
                this._tempViralHolder.objectData = null;
            }
            else
            {
                this._tempViralHolder.floorReady = true;
            }
        }

        private function onObjects(k:IMessageEvent):void
        {
            var _local_6:ObjectMessageData;
            var _local_2:ObjectsMessageEvent = (k as ObjectsMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ObjectsMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.getObjectCount();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_6 = _local_3.getObject(_local_5);
                this.addActiveObject(this._currentRoomId, _local_6);
                _local_5++;
            }
        }

        private function onObjectAdd(k:IMessageEvent):void
        {
            var _local_2:ObjectAddMessageEvent = (k as ObjectAddMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ObjectAddMessageParser = _local_2.getParser();
            var _local_4:ObjectMessageData = _local_3.data;
            this.addActiveObject(this._currentRoomId, _local_4);
        }

        private function onObjectUpdate(k:IMessageEvent):void
        {
            var _local_5:IVector3d;
            var _local_6:IVector3d;
            var _local_2:ObjectUpdateMessageEvent = (k as ObjectUpdateMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:ObjectUpdateMessageParser = _local_2.getParser();
            var _local_4:ObjectMessageData = _local_3.data;
            if (_local_4 != null)
            {
                _local_5 = new Vector3d(_local_4.x, _local_4.y, _local_4.z);
                _local_6 = new Vector3d(_local_4.dir);
                this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4.id, _local_5, _local_6, _local_4.state, _local_4.data, _local_4.extra);
                this._roomCreator.updateObjectFurnitureHeight(this._currentRoomId, _local_4.id, _local_4.sizeZ);
                this._roomCreator.updateObjectFurnitureExpiryTime(this._currentRoomId, _local_4.id, _local_4.expiryTime);
            }
        }

        private function onObjectDataUpdate(k:IMessageEvent):void
        {
            var _local_2:ObjectDataUpdateMessageEvent = (k as ObjectDataUpdateMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:ObjectDataUpdateMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.id;
            var _local_5:int = _local_3.state;
            var _local_6:IStuffData = _local_3.data;
            this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4, null, null, _local_5, _local_6);
        }

        private function onObjectsDataUpdate(k:IMessageEvent):void
        {
            var _local_5:ObjectData;
            var _local_6:int;
            var _local_7:int;
            var _local_8:IStuffData;
            var _local_2:ObjectsDataUpdateMessageEvent = (k as ObjectsDataUpdateMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:ObjectsDataUpdateMessageParser = _local_2.getParser();
            var _local_4:int;
            while (_local_4 < _local_3.objectCount)
            {
                _local_5 = _local_3._Str_24113(_local_4);
                if (_local_5 != null)
                {
                    _local_6 = _local_5.id;
                    _local_7 = _local_5.state;
                    _local_8 = _local_5.data;
                    this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_6, null, null, _local_7, _local_8);
                }
                _local_4++;
            }
        }

        private function onObjectRemove(event:IMessageEvent):void
        {
            var parser:ObjectRemoveMessageParser;
            var id:int;
            var objectRemoveEvent:ObjectRemoveMessageEvent = (event as ObjectRemoveMessageEvent);
            if (((objectRemoveEvent == null) || (objectRemoveEvent.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            parser = objectRemoveEvent.getParser();
            id = parser.id;
            var delay:int = parser.delay;
            if (delay > 0)
            {
                setTimeout(function ():void
                {
                    _roomCreator.disposeObjectFurniture(_currentRoomId, id, ((parser.isExpired) ? -1 : parser.pickerId), true);
                }, delay);
            }
            else
            {
                this._roomCreator.disposeObjectFurniture(this._currentRoomId, id, ((parser.isExpired) ? -1 : parser.pickerId), true);
            }
        }

        private function addActiveObject(k:int, _arg_2:ObjectMessageData):void
        {
            if (((_arg_2 == null) || (this._roomCreator == null)))
            {
                return;
            }
            var _local_3:IVector3d = new Vector3d(_arg_2.x, _arg_2.y, _arg_2.z);
            var _local_4:IVector3d = new Vector3d(_arg_2.dir);
            if (_arg_2.staticClass != null)
            {
                this._roomCreator.addObjectFurnitureByName(k, _arg_2.id, _arg_2.staticClass, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2.extra);
            }
            else
            {
                this._roomCreator.addObjectFurniture(k, _arg_2.id, _arg_2.type, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2.extra, _arg_2.expiryTime, _arg_2.usagePolicy, _arg_2.ownerId, _arg_2.ownerName, true, true, _arg_2.sizeZ);
            }
        }

        private function onItems(k:IMessageEvent):void
        {
            var _local_6:ItemMessageData;
            var _local_2:ItemsEvent = (k as ItemsEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ItemsMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.getItemCount();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_6 = _local_3.getItem(_local_5);
                this.addWallItem(this._currentRoomId, _local_6);
                _local_5++;
            }
        }

        private function onItemAdd(k:IMessageEvent):void
        {
            var _local_2:ItemAddMessageEvent = (k as ItemAddMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ItemAddMessageParser = _local_2.getParser();
            var _local_4:ItemMessageData = _local_3.data;
            if (_local_4 != null)
            {
                this.addWallItem(this._currentRoomId, _local_4);
            }
        }

        private function onItemRemove(k:IMessageEvent):void
        {
            var _local_2:ItemRemoveMessageEvent = (k as ItemRemoveMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:ItemRemoveMessageParser = _local_2.getParser();
            this._roomCreator.disposeObjectWallItem(this._currentRoomId, _local_3.itemId, _local_3.pickerId);
        }

        private function onItemUpdate(k:IMessageEvent):void
        {
            var _local_6:IVector3d;
            var _local_7:IVector3d;
            var _local_2:ItemUpdateMessageEvent = (k as ItemUpdateMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ItemUpdateMessageParser = _local_2.getParser();
            var _local_4:LegacyWallGeometry = this._roomCreator.getLegacyGeometry(this._currentRoomId);
            if (((this._roomCreator == null) || (_local_4 == null)))
            {
                return;
            }
            var _local_5:ItemMessageData = _local_3.data;
            if (_local_5 != null)
            {
                _local_6 = _local_4.getLocation(_local_5.wallX, _local_5.wallY, _local_5.localX, _local_5.localY, _local_5.dir);
                _local_7 = new Vector3d(_local_4.getDirection(_local_5.dir));
                this._roomCreator.updateObjectWallItem(this._currentRoomId, _local_5.id, _local_6, _local_7, _local_5.state, _local_5.data);
                this._roomCreator.updateObjectWallItemExpiryTime(this._currentRoomId, _local_5.id, _local_5.secondsToExpiration);
            }
        }

        private function onItemDataUpdate(k:IMessageEvent):void
        {
            var _local_2:ItemDataUpdateMessageEvent = (k as ItemDataUpdateMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ItemDataUpdateMessageParser = _local_2.getParser();
            this._roomCreator.updateObjectWallItemData(this._currentRoomId, _local_3.id, _local_3.itemData);
        }

        private function addWallItem(k:int, _arg_2:ItemMessageData):void
        {
            if (((_arg_2 == null) || (this._roomCreator == null)))
            {
                return;
            }
            var _local_3:LegacyWallGeometry = this._roomCreator.getLegacyGeometry(k);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:IVector3d;
            if (!_arg_2.isOldFormat)
            {
                _local_4 = _local_3.getLocation(_arg_2.wallX, _arg_2.wallY, _arg_2.localX, _arg_2.localY, _arg_2.dir);
            }
            else
            {
                _local_4 = _local_3.getLocationOldFormat(_arg_2.y, _arg_2.z, _arg_2.dir);
            }
            var _local_5:IVector3d = new Vector3d(_local_3.getDirection(_arg_2.dir));
            this._roomCreator.addObjectWallItem(k, _arg_2.id, _arg_2.type, _local_4, _local_5, _arg_2.state, _arg_2.data, _arg_2.usagePolicy, _arg_2.ownerId, _arg_2.ownerName, _arg_2.secondsToExpiration);
        }

        private function onUsers(k:IMessageEvent):void
        {
            var _local_5:UserMessageData;
            var _local_6:IVector3d;
            var _local_7:IVector3d;
            var _local_8:int;
            var _local_2:UsersEvent = (k as UsersEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:UsersMessageParser = _local_2.getParser();
            var _local_4:int;
            while (_local_4 < _local_3.getUserCount())
            {
                _local_5 = _local_3.getUser(_local_4);
                if (_local_5 != null)
                {
                    _local_6 = new Vector3d(_local_5.x, _local_5.y, _local_5.z);
                    _local_7 = new Vector3d(_local_5.dir);
                    _local_8 = _local_5.userType;
                    this._roomCreator.addObjectUser(this._currentRoomId, _local_5.roomIndex, _local_6, _local_7, _local_5.dir, _local_8, _local_5.figure);
                    if (_local_5.id == this._ownUserId)
                    {
                        this._roomCreator.setOwnUserId(this._currentRoomId, _local_5.roomIndex);
                        this._roomCreator.updateObjectUserOwnUserAvatar(this._currentRoomId, _local_5.roomIndex);
                    }
                    this._roomCreator.updateObjectUserFigure(this._currentRoomId, _local_5.roomIndex, _local_5.figure, _local_5.sex, _local_5.subType, _local_5.isRiding);
                    if (RoomObjectUserTypes.getName(_local_8) == RoomObjectUserTypes.PET)
                    {
                        if (this._roomCreator.getPetTypeId(_local_5.figure) == PetTypeEnum.MONSTERPLANT)
                        {
                            this._roomCreator.updateObjectUserPosture(this._currentRoomId, _local_5.roomIndex, _local_5.petPosture);
                        }
                    }
                    if (this._roomCreator.configuration.getBoolean("avatar.ignored.bubble.enabled"))
                    {
                        this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_5.roomIndex, RoomObjectVariableEnum.FIGURE_IS_MUTED, Number(this._roomCreator.sessionDataManager.isIgnored(_local_5.name)));
                    }
                }
                _local_4++;
            }
            this.updateGuideMarker();
        }

        private function onUserUpdate(k:IMessageEvent):void
        {
            var _local_7:UserUpdateMessageData;
            var _local_8:Number;
            var _local_9:IVector3d;
            var _local_10:IVector3d;
            var _local_11:IVector3d;
            var _local_12:Boolean;
            var _local_13:Boolean;
            var _local_14:String;
            var _local_15:String;
            var _local_16:Boolean;
            var _local_17:Boolean;
            var _local_18:uint;
            var _local_19:AvatarActionMessageData;
            var _local_2:UserUpdateEvent = (k as UserUpdateEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:UserUpdateMessageParser = _local_2.getParser();
            var _local_4:IRoomInstance = this._roomCreator.getRoom(this._currentRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:Number = _local_4.getNumber(RoomVariableEnum.ROOM_Z_SCALE);
            var _local_6:int;
            while (_local_6 < _local_3.userUpdateCount)
            {
                _local_7 = _local_3._Str_24400(_local_6);
                if (_local_7 != null)
                {
                    _local_8 = _local_7._Str_23720;
                    if (_local_5 != 0)
                    {
                        _local_8 = (_local_8 / _local_5);
                    }
                    _local_9 = new Vector3d(_local_7.x, _local_7.y, (_local_7.z + _local_8));
                    _local_10 = new Vector3d(_local_7.dir);
                    _local_11 = null;
                    if (_local_7.isMoving)
                    {
                        _local_11 = new Vector3d(_local_7._Str_24054, _local_7._Str_24331, _local_7._Str_25822);
                    }
                    this._roomCreator.updateObjectUser(this._currentRoomId, _local_7.id, _local_9, _local_11, _local_7.canStandUp, _local_8, _local_10, _local_7.dirHead);
                    _local_12 = true;
                    _local_13 = false;
                    _local_14 = RoomObjectVariableEnum.STD;
                    _local_15 = "";
                    this._roomCreator.updateObjectUserFlatControl(this._currentRoomId, _local_7.id, null);
                    _local_16 = false;
                    _local_17 = false;
                    _local_18 = _local_7.actions.length;
                    for each (_local_19 in _local_7.actions)
                    {
                        switch (_local_19.actionType)
                        {
                            case "flatctrl":
                                this._roomCreator.updateObjectUserFlatControl(this._currentRoomId, _local_7.id, _local_19.actionParameter);
                                break;
                            case "sign":
                                if (_local_18 == 1)
                                {
                                    _local_12 = false;
                                }
                                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_7.id, RoomObjectVariableEnum.FIGURE_SIGN, int(_local_19.actionParameter));
                                break;
                            case "gst":
                                if (_local_18 == 1)
                                {
                                    _local_12 = false;
                                }
                                this._roomCreator.updateObjectPetGesture(this._currentRoomId, _local_7.id, _local_19.actionParameter);
                                break;
                            case "wav":
                            case "mv":
                                _local_17 = true;
                                _local_13 = true;
                                _local_14 = _local_19.actionType;
                                _local_15 = _local_19.actionParameter;
                                break;
                            case "swim":
                                _local_16 = true;
                                _local_13 = true;
                                _local_14 = _local_19.actionType;
                                _local_15 = _local_19.actionParameter;
                                break;
                            case "trd":
                                break;
                            default:
                                _local_13 = true;
                                _local_14 = _local_19.actionType;
                                _local_15 = _local_19.actionParameter;
                        }
                    }
                    if (((!(_local_17)) && (_local_16)))
                    {
                        _local_13 = true;
                        _local_14 = "float";
                    }
                    if (_local_13)
                    {
                        this._roomCreator.updateObjectUserPosture(this._currentRoomId, _local_7.id, _local_14, _local_15);
                    }
                    else
                    {
                        if (_local_12)
                        {
                            this._roomCreator.updateObjectUserPosture(this._currentRoomId, _local_7.id, RoomObjectVariableEnum.STD, "");
                        }
                    }
                }
                _local_6++;
            }
            this.updateGuideMarker();
        }

        private function onUserRemove(k:IMessageEvent):void
        {
            var _local_2:UserRemoveMessageEvent = (k as UserRemoveMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:UserRemoveMessageParser = _local_2.getParser();
            this._roomCreator.disposeObjectUser(this._currentRoomId, _local_3.id);
            this.updateGuideMarker();
        }

        private function onUserChange(k:IMessageEvent):void
        {
            var _local_2:UserChangeMessageEvent = (k as UserChangeMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            this._roomCreator.updateObjectUserFigure(this._currentRoomId, _local_2.id, _local_2.figure, _local_2.sex);
        }

        private function onPetFigureUpdate(k:IMessageEvent):void
        {
            var _local_2:PetFigureUpdateEvent = (k as PetFigureUpdateEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PetFigureUpdateParser = _local_2.getParser();
            this._roomCreator.updateObjectUserFigure(this._currentRoomId, _local_3.roomIndex, _local_3.figureData.figuredata, "", "", _local_3.isRiding);
        }

        private function onExpression(k:IMessageEvent):void
        {
            var _local_2:ExpressionMessageEvent = (k as ExpressionMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:ExpressionMessageParser = _local_2.getParser();
            if (_local_3 == null)
            {
                return;
            }
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_EXPRESSION, _local_3.expressionType);
        }

        private function onDance(k:IMessageEvent):void
        {
            var _local_2:DanceMessageEvent = (k as DanceMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:DanceMessageParser = _local_2.getParser();
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_DANCE, _local_3._Str_8263);
        }

        private function onAvatarEffect(k:IMessageEvent):void
        {
            var _local_2:AvatarEffectMessageEvent = (k as AvatarEffectMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:AvatarEffectMessageParser = _local_2.getParser();
            this._roomCreator.updateObjectUserEffect(this._currentRoomId, _local_3.userId, _local_3.effectId, _local_3.delayMilliSeconds);
        }

        private function onAvatarSleep(k:IMessageEvent):void
        {
            var _local_2:SleepMessageEvent = (k as SleepMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:SleepMessageParser = _local_2.getParser();
            var _local_4:int = 1;
            if (!_local_3.sleeping)
            {
                _local_4 = 0;
            }
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_SLEEP, _local_4);
        }

        private function onCarryObject(k:IMessageEvent):void
        {
            var _local_2:CarryObjectMessageParser;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is CarryObjectMessageEvent))
            {
                _local_2 = (k as CarryObjectMessageEvent).getParser();
                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_2.userId, RoomObjectVariableEnum.FIGURE_CARRY_OBJECT, _local_2.itemType);
            }
        }

        private function onUseObject(k:IMessageEvent):void
        {
            var _local_2:UseObjectMessageParser;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is UseObjectMessageEvent))
            {
                _local_2 = (k as UseObjectMessageEvent).getParser();
                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_2.userId, RoomObjectVariableEnum.FIGURE_USE_OBJECT, _local_2.itemType);
            }
        }

        private function onSlideUpdate(k:IMessageEvent):void
        {
            var _local_2:SlideObjectBundleMessageParser;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:SlideObjectMessageData;
            var _local_6:SlideObjectMessageData;
            var _local_7:IRoomObject;
            var _local_8:String;
            var _local_9:IRoomInstance;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is SlideObjectBundleMessageEvent))
            {
                _local_2 = (k as SlideObjectBundleMessageEvent).getParser();
                this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_2.id, null, null, 1, null);
                this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_2.id, null, null, 2, null);
                _local_3 = _local_2.objectList;
                _local_4 = 0;
                while (_local_4 < _local_3.length)
                {
                    _local_5 = _local_3[_local_4];
                    if (_local_5 != null)
                    {
                        this._roomCreator.updateObjectFurnitureLocation(this._currentRoomId, _local_5.id, _local_5.loc, _local_5.target);
                    }
                    _local_4++;
                }
                if (_local_2.avatar != null)
                {
                    _local_6 = _local_2.avatar;
                    this._roomCreator.updateObjectUser(this._currentRoomId, _local_6.id, _local_6.loc, _local_6.target);
                    if (this._roomCreator)
                    {
                        _local_9 = this._roomCreator.getRoom(this._currentRoomId);
                        if (_local_9)
                        {
                            _local_7 = _local_9.getObject(_local_6.id, RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
                        }
                    }
                    if (((!(_local_7 == null)) && (!(_local_7.getType() == RoomObjectUserTypes.MONSTERPLANT))))
                    {
                        switch (_local_6._Str_21300)
                        {
                            case SlideObjectMessageData.MV:
                                _local_8 = "mv";
                                break;
                            case SlideObjectMessageData.SLD:
                                _local_8 = "std";
                                break;
                        }
                        this._roomCreator.updateObjectUserPosture(this._currentRoomId, _local_6.id, _local_8);
                    }
                }
            }
        }

        private function onChat(k:IMessageEvent):void
        {
            var _local_2:ChatMessageParser;
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:IRoomSession = this._roomCreator.roomSessionManager.getSession(this._currentRoomId);
            if ((k is ChatMessageEvent))
            {
                _local_2 = (k as ChatMessageEvent).getParser();
            }
            else
            {
                if ((k is WhisperMessageEvent))
                {
                    _local_2 = (k as WhisperMessageEvent).getParser();
                    if ((((_local_2) && (_local_3)) && (_local_2.userId == _local_3.ownUserRoomId)))
                    {
                        return;
                    }
                }
                else
                {
                    if ((k is ShoutMessageEvent))
                    {
                        _local_2 = (k as ShoutMessageEvent).getParser();
                    }
                }
            }
            if (_local_2 == null)
            {
                return;
            }
            this._roomCreator.updateObjectUserGesture(this._currentRoomId, _local_2.userId, _local_2.gesture);
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_2.userId, RoomObjectVariableEnum.FIGURE_TALK, Math.ceil((_local_2.text.length / 10)));
        }

        private function onTypingStatus(k:IMessageEvent):void
        {
            var _local_2:UserTypingMessageEvent = (k as UserTypingMessageEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:UserTypingMessageParser = _local_2.getParser();
            var _local_4:int = 1;
            if (!_local_3.isTyping)
            {
                _local_4 = 0;
            }
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_IS_TYPING, _local_4);
        }

        private function onPetExperience(k:PetExperienceEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:PetExperienceParser = k.getParser();
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_2.petRoomIndex, RoomObjectVariableEnum.FIGURE_GAINED_EXPERIENCE, _local_2._Str_18578);
        }

        private function onDiceValue(k:IMessageEvent):void
        {
            var _local_2:DiceValueMessageEvent = (k as DiceValueMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:DiceValueMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.id;
            var _local_5:int = _local_3.value;
            var _local_6:IStuffData = new LegacyStuffData();
            this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4, null, null, _local_5, _local_6);
        }

        private function onOneWayDoorStatus(k:IMessageEvent):void
        {
            var _local_2:OneWayDoorStatusMessageEvent = (k as OneWayDoorStatusMessageEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:OneWayDoorStatusMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.id;
            var _local_5:int = _local_3.status;
            var _local_6:IStuffData = new LegacyStuffData();
            this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4, null, null, _local_5, _local_6);
        }

        private function onPlayingGame(k:YouArePlayingGameMessageEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:YouArePlayingGameMessageParser = k.getParser();
            var _local_3:Boolean = _local_2.isPlaying;
            this._roomCreator.setIsPlayingGame(this._currentRoomId, _local_3);
        }

        private function onGamePlayerNumberValue(k:IMessageEvent):void
        {
            var _local_2:GamePlayerValueMessageParser;
            var _local_3:int;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is GamePlayerValueMessageEvent))
            {
                _local_2 = (k as GamePlayerValueMessageEvent).getParser();
                _local_3 = this.getRoomId(0);
                this._roomCreator.updateObjectUserAction(_local_3, _local_2.userId, RoomObjectVariableEnum.FIGURE_NUMBER_VALUE, _local_2.value);
            }
        }

        private function onIgnoreResult(k:IMessageEvent):void
        {
            if (!this._roomCreator.configuration.getBoolean("avatar.ignored.bubble.enabled"))
            {
                return;
            }
            var _local_2:IgnoreResultMessageEvent = (k as IgnoreResultMessageEvent);
            var _local_3:RoomUserData = this._roomCreator.roomSessionManager.getSession(this._currentRoomId).userDataManager.getUserDataByName(_local_2.name);
            if (_local_3 != null)
            {
                switch (_local_2.result)
                {
                    case 1:
                    case 2:
                        this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.roomObjectId, RoomObjectVariableEnum.FIGURE_IS_MUTED, 1);
                        return;
                    case 3:
                        this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.roomObjectId, RoomObjectVariableEnum.FIGURE_IS_MUTED, 0);
                        return;
                }
            }
        }

        private function onGuideSessionStarted(k:IMessageEvent):void
        {
            var _local_2:GuideSessionStartedMessageParser = (k.parser as GuideSessionStartedMessageParser);
            this._guideId = _local_2.guideUserId;
            this._requesterId = _local_2.requesterUserId;
            this.updateGuideMarker();
        }

        private function onGuideSessionEnded(k:IMessageEvent):void
        {
            this.removeGuideMarker();
        }

        private function onGuideSessionError(k:IMessageEvent):void
        {
            this.removeGuideMarker();
        }

        private function updateGuideMarker():void
        {
            var k:int = this._roomCreator.sessionDataManager.userId;
            this.setUserGuideStatus(this._guideId, ((this._requesterId == k) ? AvatarGuideStatus.GUIDE : AvatarGuideStatus.NONE));
            this.setUserGuideStatus(this._requesterId, ((this._guideId == k) ? AvatarGuideStatus.REQUESTER : AvatarGuideStatus.NONE));
        }

        private function removeGuideMarker():void
        {
            this.setUserGuideStatus(this._guideId, AvatarGuideStatus.NONE);
            this.setUserGuideStatus(this._requesterId, AvatarGuideStatus.NONE);
            this._guideId = -1;
            this._requesterId = -1;
        }

        private function setUserGuideStatus(k:int, _arg_2:int):void
        {
            if (((!(this._roomCreator)) || (!(this._roomCreator.roomSessionManager))))
            {
                return;
            }
            var _local_3:IRoomSession = this._roomCreator.roomSessionManager.getSession(this._currentRoomId);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:RoomUserData = _local_3.userDataManager.getUserDataByType(k, RoomObjectTypeEnum.HABBO);
            if (_local_4 != null)
            {
                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_4.roomObjectId, RoomObjectVariableEnum.FIGURE_GUIDE_STATUS, _arg_2);
            }
        }
    }
}
