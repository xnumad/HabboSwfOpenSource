package com.sulake.habbo.room
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.habbo.communication.messages.incoming._Str_446._Str_4976;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3407;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7999;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4279;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7242;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7777;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4196;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_6253;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7849;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_5843;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7527;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_8234;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_8080;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4408;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_8064;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7704;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_8204;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7464;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7291;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4085;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7817;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_4914;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3084;
    import com.sulake.habbo.communication.messages.incoming.room.action._Str_7641;
    import com.sulake.habbo.communication.messages.incoming.room.action._Str_5619;
    import com.sulake.habbo.communication.messages.incoming.room.action.RoomUserEffectEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action._Str_7216;
    import com.sulake.habbo.communication.messages.incoming.room.action._Str_7050;
    import com.sulake.habbo.communication.messages.incoming.room.action._Str_8069;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_7350;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_4642;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_4826;
    import com.sulake.habbo.communication.messages.incoming.room.chat.RoomUserShoutEvent;
    import com.sulake.habbo.communication.messages.incoming.room.chat._Str_7436;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8183;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_7657;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetExperienceEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_8714;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_7743;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetFigureUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5459;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionStartedEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionEndedEvent;
    import com.sulake.habbo.communication.messages.incoming.help.GuideSessionErrorEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5199;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_10528;
    import com.sulake.habbo.communication.messages.outgoing.room.engine._Str_7716;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6431;
    import com.sulake.habbo.communication.messages.parser.room.engine.HeightMapMessageParser;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7700;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6347;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7512;
    import com.sulake.habbo.communication.messages.parser.room.engine.FloorHeightMapMessageParser;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.communication.messages.parser.room.layout._Str_5770;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3292;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_8082;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7802;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7918;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_6765;
    import com.sulake.habbo.communication.messages.parser.room.engine.ObjectsDataUpdateMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_5317;
    import flash.utils.setTimeout;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3079;
    import com.sulake.habbo.communication.messages.parser.room.engine.ItemsMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7298;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7124;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7749;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_8155;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3548;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_5499;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_8180;
    import com.sulake.habbo.communication.messages.parser.room.engine.UserUpdateMessageParser;
    import com.sulake.room.IRoomInstance;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6367;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetFigureUpdateParser;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_7435;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6731;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_7571;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_7555;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6708;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6590;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6340;
    import com.sulake.habbo.communication.messages.incoming.room.engine._Str_3381;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.communication.messages.parser.room.chat.RoomUserShoutMessageParser;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_8185;
    import com.sulake.habbo.communication.messages.parser.room.pets.PetExperienceParser;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7612;
    import com.sulake.habbo.room.object.data.LegacyStuffData;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7431;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_7187;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_6864;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser;
    import com.sulake.habbo.avatar.enum.AvatarGuideStatus;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;

    public class RoomMessageHandler 
    {
        private var _connection:IConnection = null;
        private var _roomCreator:IRoomCreator = null;
        private var _planeParser:RoomPlaneParser = null;
        private var _latestEntryTileEvent:_Str_4976 = null;
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
                k.addMessageEvent(new _Str_3407(this._Str_5963));
                k.addMessageEvent(new _Str_7999(this.onRoomProperty));
                k.addMessageEvent(new _Str_4976(this._Str_16587));
                k.addMessageEvent(new _Str_4279(this.onFloorHeightMap));
                k.addMessageEvent(new _Str_7242(this.onHeightMap));
                k.addMessageEvent(new _Str_7777(this.onHeightMapUpdate));
                k.addMessageEvent(new _Str_4196(this.onRoomVisualizationSettings));
                k.addMessageEvent(new _Str_6253(this.onFurnitureAliases));
                k.addMessageEvent(new _Str_7849(this.onObjects));
                k.addMessageEvent(new _Str_5843(this.onObjectAdd));
                k.addMessageEvent(new _Str_7527(this.onObjectUpdate));
                k.addMessageEvent(new _Str_8234(this.onObjectDataUpdate));
                k.addMessageEvent(new _Str_8080(this.onObjectsDataUpdate));
                k.addMessageEvent(new _Str_4408(this._Str_16200));
                k.addMessageEvent(new _Str_8064(this.onItems));
                k.addMessageEvent(new _Str_7704(this.onItemAdd));
                k.addMessageEvent(new _Str_8204(this.onItemRemove));
                k.addMessageEvent(new _Str_7464(this.onItemUpdate));
                k.addMessageEvent(new _Str_7291(this.onItemDataUpdate));
                k.addMessageEvent(new _Str_4085(this._Str_10523));
                k.addMessageEvent(new _Str_7817(this.onUserUpdate));
                k.addMessageEvent(new _Str_4914(this._Str_16267));
                k.addMessageEvent(new _Str_3084(this._Str_5174));
                k.addMessageEvent(new _Str_7641(this.onExpression));
                k.addMessageEvent(new _Str_5619(this.onDance));
                k.addMessageEvent(new RoomUserEffectEvent(this.onAvatarEffect));
                k.addMessageEvent(new _Str_7216(this.onAvatarSleep));
                k.addMessageEvent(new _Str_7050(this.onCarryObject));
                k.addMessageEvent(new _Str_8069(this.onUseObject));
                k.addMessageEvent(new _Str_7350(this.onSlideUpdate));
                k.addMessageEvent(new _Str_4642(this.onChat));
                k.addMessageEvent(new _Str_4826(this.onChat));
                k.addMessageEvent(new RoomUserShoutEvent(this.onChat));
                k.addMessageEvent(new _Str_7436(this.onTypingStatus));
                k.addMessageEvent(new _Str_8183(this.onDiceValue));
                k.addMessageEvent(new _Str_7657(this.onOneWayDoorStatus));
                k.addMessageEvent(new PetExperienceEvent(this.onPetExperience));
                k.addMessageEvent(new _Str_8714(this._Str_24325));
                k.addMessageEvent(new _Str_7743(this.onGamePlayerNumberValue));
                k.addMessageEvent(new PetFigureUpdateEvent(this._Str_6212));
                k.addMessageEvent(new _Str_5459(this.onIgnoreResult));
                k.addMessageEvent(new GuideSessionStartedEvent(this.onGuideSessionStarted));
                k.addMessageEvent(new GuideSessionEndedEvent(this.onGuideSessionEnded));
                k.addMessageEvent(new GuideSessionErrorEvent(this.onGuideSessionError));
            }
        }

        private function onOwnUserEvent(k:IMessageEvent):void
        {
            var _local_2:UserObjectEvent = (k as UserObjectEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_4139 = _local_2.getParser();
            if (_local_3 != null)
            {
                this._ownUserId = _local_3.id;
            }
        }

        private function _Str_5963(k:IMessageEvent):void
        {
            var _local_2:_Str_3407 = (k as _Str_3407);
            if ((((_local_2 == null) || (_local_2.getParser() == null)) || (k.connection == null)))
            {
                return;
            }
            var _local_3:_Str_5199 = _local_2.getParser();
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
                k.connection.send(new _Str_10528());
                this._initialConnection = false;
            }
            else
            {
                k.connection.send(new _Str_7716());
            }
        }

        private function onFurnitureAliases(k:IMessageEvent):void
        {
            var _local_2:_Str_6253;
            var _local_3:_Str_6431;
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            if (this._roomCreator != null)
            {
                _local_2 = (k as _Str_6253);
                if (((_local_2 == null) || (_local_2.getParser() == null)))
                {
                    return;
                }
                _local_3 = _local_2.getParser();
                if (_local_3 != null)
                {
                    _local_4 = _local_3._Str_17132;
                    _local_5 = 0;
                    while (_local_5 < _local_4)
                    {
                        _local_6 = _local_3.getName(_local_5);
                        _local_7 = _local_3._Str_24465(_local_5);
                        this._roomCreator.setRoomObjectAlias(_local_6, _local_7);
                        _local_5++;
                    }
                }
            }
            k.connection.send(new _Str_7716());
        }

        private function onHeightMap(k:IMessageEvent):void
        {
            var _local_8:int;
            var _local_9:Number;
            var _local_10:Boolean;
            var _local_11:Boolean;
            var _local_2:_Str_7242 = (k as _Str_7242);
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
                    _local_9 = _local_3._Str_2754(_local_8, _local_7);
                    _local_10 = _local_3.getStackingBlocked(_local_8, _local_7);
                    _local_11 = _local_3._Str_10375(_local_8, _local_7);
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
            var _local_2:_Str_7777 = (k as _Str_7777);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7700 = _local_2.getParser();
            var _local_4:FurniStackingHeightMap = this._roomCreator.getFurniStackingHeightMap(this._currentRoomId);
            if (_local_4 == null)
            {
                return;
            }
            while (_local_3.next())
            {
                _local_5 = _local_3.x;
                _local_6 = _local_3.y;
                _local_4._Str_3982(_local_5, _local_6, _local_3._Str_9852);
                _local_4.setStackingBlocked(_local_5, _local_6, _local_3.window3);
                _local_4.setIsRoomTile(_local_5, _local_6, _local_3._Str_10375);
            }
            this._roomCreator.refreshTileObjectMap(this._currentRoomId, "RoomMessageHandler.onHeightMapUpdate()");
        }

        private function onRoomVisualizationSettings(k:IMessageEvent):void
        {
            var _local_2:_Str_4196 = (k as _Str_4196);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:_Str_6347 = _local_2.getParser();
            var _local_4:* = (!(_local_3._Str_22900));
            var _local_5:Boolean = true;
            var _local_6:Number = _local_3._Str_9955;
            var _local_7:Number = _local_3._Str_9990;
            if (this._roomCreator != null)
            {
                this._roomCreator.updateObjectRoomVisibilities(this._currentRoomId, _local_4, _local_5);
                this._roomCreator.updateObjectRoomPlaneThicknesses(this._currentRoomId, _local_6, _local_7);
            }
        }

        private function onRoomProperty(k:IMessageEvent):void
        {
            var _local_2:_Str_7999 = (k as _Str_7999);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:_Str_7512 = _local_2.getParser();
            var _local_4:String = _local_3._Str_5207;
            var _local_5:String = _local_3._Str_5259;
            var _local_6:String = _local_3._Str_5109;
            if (this._roomCreator != null)
            {
                this._roomCreator.updateObjectRoom(this._currentRoomId, _local_4, _local_5, _local_6);
            }
        }

        private function _Str_16587(k:_Str_4976):void
        {
            this._latestEntryTileEvent = k;
        }

        private function onFloorHeightMap(k:IMessageEvent):void
        {
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_2:_Str_4279 = (k as _Str_4279);
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
            var _local_11:_Str_5770;
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
                    _local_18 = _local_3._Str_2754(_local_17, _local_13);
                    if ((((((_local_13 > 0) && (_local_13 < (_local_6 - 1))) || ((_local_17 > 0) && (_local_17 < (_local_5 - 1)))) && (!(_local_18 == RoomPlaneParser.TILE_BLOCKED))) && ((_local_11 == null) || ((_local_17 == _local_11.x) && (_local_13 == _local_11.y)))))
                    {
                        if ((((_local_3._Str_2754(_local_17, (_local_13 - 1)) == RoomPlaneParser.TILE_BLOCKED) && (_local_3._Str_2754((_local_17 - 1), _local_13) == RoomPlaneParser.TILE_BLOCKED)) && (_local_3._Str_2754(_local_17, (_local_13 + 1)) == RoomPlaneParser.TILE_BLOCKED)))
                        {
                            _local_7 = (_local_17 + 0.5);
                            _local_8 = _local_13;
                            _local_9 = _local_18;
                            _local_10 = 90;
                        }
                        if ((((_local_3._Str_2754(_local_17, (_local_13 - 1)) == RoomPlaneParser.TILE_BLOCKED) && (_local_3._Str_2754((_local_17 - 1), _local_13) == RoomPlaneParser.TILE_BLOCKED)) && (_local_3._Str_2754((_local_17 + 1), _local_13) == RoomPlaneParser.TILE_BLOCKED)))
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
                    _local_4._Str_3982(_local_19, _local_14, this._planeParser._Str_2754(_local_19, _local_14));
                    _local_19--;
                }
                _local_14--;
            }
            var _local_15:XML = this._planeParser._Str_5598();
            var _local_16:XML = new (XML)((("<doors>" + (((((((('<door x="' + _local_7) + '" y="') + _local_8) + '" z="') + _local_9) + '" dir="') + _local_10) + '"/>')) + "</doors>"));
            _local_15.appendChild(_local_16);
            this._roomCreator.initializeRoom(this._currentRoomId, _local_15);
            if (this._tempViralHolder.objectData)
            {
                this._Str_18595(this._currentRoomId, this._tempViralHolder.objectData);
                this._tempViralHolder.objectData = null;
            }
            else
            {
                this._tempViralHolder.floorReady = true;
            }
        }

        private function onObjects(k:IMessageEvent):void
        {
            var _local_6:_Str_3292;
            var _local_2:_Str_7849 = (k as _Str_7849);
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
                this._Str_18595(this._currentRoomId, _local_6);
                _local_5++;
            }
        }

        private function onObjectAdd(k:IMessageEvent):void
        {
            var _local_2:_Str_5843 = (k as _Str_5843);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:_Str_8082 = _local_2.getParser();
            var _local_4:_Str_3292 = _local_3.data;
            this._Str_18595(this._currentRoomId, _local_4);
        }

        private function onObjectUpdate(k:IMessageEvent):void
        {
            var _local_5:IVector3d;
            var _local_6:IVector3d;
            var _local_2:_Str_7527 = (k as _Str_7527);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7802 = _local_2.getParser();
            var _local_4:_Str_3292 = _local_3.data;
            if (_local_4 != null)
            {
                _local_5 = new Vector3d(_local_4.x, _local_4.y, _local_4.z);
                _local_6 = new Vector3d(_local_4.dir);
                this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4.id, _local_5, _local_6, _local_4.state, _local_4.data, _local_4._Str_2794);
                this._roomCreator.updateObjectFurnitureHeight(this._currentRoomId, _local_4.id, _local_4.sizeZ);
                this._roomCreator.updateObjectFurnitureExpiryTime(this._currentRoomId, _local_4.id, _local_4.expiryTime);
            }
        }

        private function onObjectDataUpdate(k:IMessageEvent):void
        {
            var _local_2:_Str_8234 = (k as _Str_8234);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7918 = _local_2.getParser();
            var _local_4:int = _local_3.id;
            var _local_5:int = _local_3.state;
            var _local_6:IStuffData = _local_3.data;
            this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4, null, null, _local_5, _local_6);
        }

        private function onObjectsDataUpdate(k:IMessageEvent):void
        {
            var _local_5:_Str_6765;
            var _local_6:int;
            var _local_7:int;
            var _local_8:IStuffData;
            var _local_2:_Str_8080 = (k as _Str_8080);
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

        private function _Str_16200(event:IMessageEvent):void
        {
            var parser:_Str_5317;
            var id:int;
            var objectRemoveEvent:_Str_4408 = (event as _Str_4408);
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

        private function _Str_18595(k:int, _arg_2:_Str_3292):void
        {
            if (((_arg_2 == null) || (this._roomCreator == null)))
            {
                return;
            }
            var _local_3:IVector3d = new Vector3d(_arg_2.x, _arg_2.y, _arg_2.z);
            var _local_4:IVector3d = new Vector3d(_arg_2.dir);
            if (_arg_2._Str_13150 != null)
            {
                this._roomCreator.addObjectFurnitureByName(k, _arg_2.id, _arg_2._Str_13150, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2._Str_2794);
            }
            else
            {
                this._roomCreator.addObjectFurniture(k, _arg_2.id, _arg_2.type, _local_3, _local_4, _arg_2.state, _arg_2.data, _arg_2._Str_2794, _arg_2.expiryTime, _arg_2.usagePolicy, _arg_2.ownerId, _arg_2.ownerName, true, true, _arg_2.sizeZ);
            }
        }

        private function onItems(k:IMessageEvent):void
        {
            var _local_6:_Str_3079;
            var _local_2:_Str_8064 = (k as _Str_8064);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:ItemsMessageParser = _local_2.getParser();
            var _local_4:int = _local_3.getItemCount();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                _local_6 = _local_3._Str_2990(_local_5);
                this._Str_19994(this._currentRoomId, _local_6);
                _local_5++;
            }
        }

        private function onItemAdd(k:IMessageEvent):void
        {
            var _local_2:_Str_7704 = (k as _Str_7704);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:_Str_7298 = _local_2.getParser();
            var _local_4:_Str_3079 = _local_3.data;
            if (_local_4 != null)
            {
                this._Str_19994(this._currentRoomId, _local_4);
            }
        }

        private function onItemRemove(k:IMessageEvent):void
        {
            var _local_2:_Str_8204 = (k as _Str_8204);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7124 = _local_2.getParser();
            this._roomCreator.disposeObjectWallItem(this._currentRoomId, _local_3.itemId, _local_3.pickerId);
        }

        private function onItemUpdate(k:IMessageEvent):void
        {
            var _local_6:IVector3d;
            var _local_7:IVector3d;
            var _local_2:_Str_7464 = (k as _Str_7464);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:_Str_7749 = _local_2.getParser();
            var _local_4:LegacyWallGeometry = this._roomCreator.getLegacyGeometry(this._currentRoomId);
            if (((this._roomCreator == null) || (_local_4 == null)))
            {
                return;
            }
            var _local_5:_Str_3079 = _local_3.data;
            if (_local_5 != null)
            {
                _local_6 = _local_4.getLocation(_local_5._Str_15139, _local_5._Str_15569, _local_5.localX, _local_5.localY, _local_5.dir);
                _local_7 = new Vector3d(_local_4.getDirection(_local_5.dir));
                this._roomCreator.updateObjectWallItem(this._currentRoomId, _local_5.id, _local_6, _local_7, _local_5.state, _local_5.data);
                this._roomCreator.updateObjectWallItemExpiryTime(this._currentRoomId, _local_5.id, _local_5.secondsToExpiration);
            }
        }

        private function onItemDataUpdate(k:IMessageEvent):void
        {
            var _local_2:_Str_7291 = (k as _Str_7291);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:_Str_8155 = _local_2.getParser();
            this._roomCreator.updateObjectUserFlatControl(this._currentRoomId, _local_3.id, _local_3.itemData);
        }

        private function _Str_19994(k:int, _arg_2:_Str_3079):void
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
            if (!_arg_2._Str_22379)
            {
                _local_4 = _local_3.getLocation(_arg_2._Str_15139, _arg_2._Str_15569, _arg_2.localX, _arg_2.localY, _arg_2.dir);
            }
            else
            {
                _local_4 = _local_3.getLocationOldFormat(_arg_2.y, _arg_2.z, _arg_2.dir);
            }
            var _local_5:IVector3d = new Vector3d(_local_3.getDirection(_arg_2.dir));
            this._roomCreator.addObjectWallItem(k, _arg_2.id, _arg_2.type, _local_4, _local_5, _arg_2.state, _arg_2.data, _arg_2.usagePolicy, _arg_2.ownerId, _arg_2.ownerName, _arg_2.secondsToExpiration);
        }

        private function _Str_10523(k:IMessageEvent):void
        {
            var _local_5:_Str_3548;
            var _local_6:IVector3d;
            var _local_7:IVector3d;
            var _local_8:int;
            var _local_2:_Str_4085 = (k as _Str_4085);
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
                _local_5 = _local_3._Str_5126(_local_4);
                if (_local_5 != null)
                {
                    _local_6 = new Vector3d(_local_5.x, _local_5.y, _local_5.z);
                    _local_7 = new Vector3d(_local_5.dir);
                    _local_8 = _local_5._Str_2908;
                    this._roomCreator.addObjectUser(this._currentRoomId, _local_5.roomIndex, _local_6, _local_7, _local_5.dir, _local_8, _local_5.figure);
                    if (_local_5._Str_2394 == this._ownUserId)
                    {
                        this._roomCreator.setOwnUserId(this._currentRoomId, _local_5.roomIndex);
                        this._roomCreator.updateObjectUserOwnUserAvatar(this._currentRoomId, _local_5.roomIndex);
                    }
                    this._roomCreator.updateObjectUserFigure(this._currentRoomId, _local_5.roomIndex, _local_5.figure, _local_5._Str_3344, _local_5._Str_3882, _local_5.isRiding);
                    if (RoomObjectUserTypes.getName(_local_8) == RoomObjectUserTypes.PET)
                    {
                        if (this._roomCreator.getWallItemTypeId(_local_5.figure) == PetTypeEnum.MONSTERPLANT)
                        {
                            this._roomCreator.updateObjectUserPosture(this._currentRoomId, _local_5.roomIndex, _local_5._Str_16593);
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
            var _local_7:_Str_5499;
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
            var _local_19:_Str_8180;
            var _local_2:_Str_7817 = (k as _Str_7817);
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
                    this._roomCreator.updateObjectPetGesture(this._currentRoomId, _local_7.id, null);
                    _local_16 = false;
                    _local_17 = false;
                    _local_18 = _local_7.actions.length;
                    for each (_local_19 in _local_7.actions)
                    {
                        switch (_local_19.actionType)
                        {
                            case "flatctrl":
                                this._roomCreator.updateObjectPetGesture(this._currentRoomId, _local_7.id, _local_19.actionParameter);
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
                                this._roomCreator._Str_19224(this._currentRoomId, _local_7.id, _local_19.actionParameter);
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

        private function _Str_16267(k:IMessageEvent):void
        {
            var _local_2:_Str_4914 = (k as _Str_4914);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_6367 = _local_2.getParser();
            this._roomCreator.disposeObjectUser(this._currentRoomId, _local_3.id);
            this.updateGuideMarker();
        }

        private function _Str_5174(k:IMessageEvent):void
        {
            var _local_2:_Str_3084 = (k as _Str_3084);
            if (_local_2 == null)
            {
                return;
            }
            this._roomCreator.updateObjectUserFigure(this._currentRoomId, _local_2.id, _local_2.figure, _local_2._Str_3344);
        }

        private function _Str_6212(k:IMessageEvent):void
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
            var _local_2:_Str_7641 = (k as _Str_7641);
            if (_local_2 == null)
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7435 = _local_2.getParser();
            if (_local_3 == null)
            {
                return;
            }
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_EXPRESSION, _local_3.expressionType);
        }

        private function onDance(k:IMessageEvent):void
        {
            var _local_2:_Str_5619 = (k as _Str_5619);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_6731 = _local_2.getParser();
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_DANCE, _local_3._Str_8263);
        }

        private function onAvatarEffect(k:IMessageEvent):void
        {
            var _local_2:RoomUserEffectEvent = (k as RoomUserEffectEvent);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7571 = _local_2.getParser();
            this._roomCreator.updateObjectUserEffect(this._currentRoomId, _local_3.userId, _local_3._Str_6815, _local_3.delayMilliSeconds);
        }

        private function onAvatarSleep(k:IMessageEvent):void
        {
            var _local_2:_Str_7216 = (k as _Str_7216);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7555 = _local_2.getParser();
            var _local_4:int = 1;
            if (!_local_3._Str_25565)
            {
                _local_4 = 0;
            }
            this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3.userId, RoomObjectVariableEnum.FIGURE_SLEEP, _local_4);
        }

        private function onCarryObject(k:IMessageEvent):void
        {
            var _local_2:_Str_6708;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is _Str_7050))
            {
                _local_2 = (k as _Str_7050).getParser();
                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_2.userId, RoomObjectVariableEnum.FIGURE_CARRY_OBJECT, _local_2._Str_2887);
            }
        }

        private function onUseObject(k:IMessageEvent):void
        {
            var _local_2:_Str_6590;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is _Str_8069))
            {
                _local_2 = (k as _Str_8069).getParser();
                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_2.userId, RoomObjectVariableEnum.FIGURE_USE_OBJECT, _local_2._Str_2887);
            }
        }

        private function onSlideUpdate(k:IMessageEvent):void
        {
            var _local_2:_Str_6340;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:_Str_3381;
            var _local_6:_Str_3381;
            var _local_7:IRoomObject;
            var _local_8:String;
            var _local_9:IRoomInstance;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is _Str_7350))
            {
                _local_2 = (k as _Str_7350).getParser();
                this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_2.id, null, null, 1, null);
                this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_2.id, null, null, 2, null);
                _local_3 = _local_2._Str_24284;
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
                            _local_7 = _local_9.getObject(_local_6.id, RoomObjectCategoryEnum.CONST_100);
                        }
                    }
                    if (((!(_local_7 == null)) && (!(_local_7.getType() == RoomObjectUserTypes.MONSTERPLANT))))
                    {
                        switch (_local_6._Str_21300)
                        {
                            case _Str_3381.MV:
                                _local_8 = "mv";
                                break;
                            case _Str_3381.SLD:
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
            var _local_2:RoomUserShoutMessageParser;
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:IRoomSession = this._roomCreator.roomSessionManager.getSession(this._currentRoomId);
            if ((k is _Str_4642))
            {
                _local_2 = (k as _Str_4642).getParser();
            }
            else
            {
                if ((k is _Str_4826))
                {
                    _local_2 = (k as _Str_4826).getParser();
                    if ((((_local_2) && (_local_3)) && (_local_2.userId == _local_3._Str_3871)))
                    {
                        return;
                    }
                }
                else
                {
                    if ((k is RoomUserShoutEvent))
                    {
                        _local_2 = (k as RoomUserShoutEvent).getParser();
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
            var _local_2:_Str_7436 = (k as _Str_7436);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_8185 = _local_2.getParser();
            var _local_4:int = 1;
            if (!_local_3._Str_7319)
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
            var _local_2:_Str_8183 = (k as _Str_8183);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7612 = _local_2.getParser();
            var _local_4:int = _local_3.id;
            var _local_5:int = _local_3.value;
            var _local_6:IStuffData = new LegacyStuffData();
            this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4, null, null, _local_5, _local_6);
        }

        private function onOneWayDoorStatus(k:IMessageEvent):void
        {
            var _local_2:_Str_7657 = (k as _Str_7657);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            if (this._roomCreator == null)
            {
                return;
            }
            var _local_3:_Str_7431 = _local_2.getParser();
            var _local_4:int = _local_3.id;
            var _local_5:int = _local_3.status;
            var _local_6:IStuffData = new LegacyStuffData();
            this._roomCreator.updateObjectFurniture(this._currentRoomId, _local_4, null, null, _local_5, _local_6);
        }

        private function _Str_24325(k:_Str_8714):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_7187 = k.getParser();
            var _local_3:Boolean = _local_2.isPlaying;
            this._roomCreator.setIsPlayingGame(this._currentRoomId, _local_3);
        }

        private function onGamePlayerNumberValue(k:IMessageEvent):void
        {
            var _local_2:_Str_6864;
            var _local_3:int;
            if (this._roomCreator == null)
            {
                return;
            }
            if ((k is _Str_7743))
            {
                _local_2 = (k as _Str_7743).getParser();
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
            var _local_2:_Str_5459 = (k as _Str_5459);
            var _local_3:RoomUserData = this._roomCreator.roomSessionManager.getSession(this._currentRoomId).userDataManager._Str_10979(_local_2.name);
            if (_local_3 != null)
            {
                switch (_local_2.result)
                {
                    case 1:
                    case 2:
                        this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3._Str_2713, RoomObjectVariableEnum.FIGURE_IS_MUTED, 1);
                        return;
                    case 3:
                        this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_3._Str_2713, RoomObjectVariableEnum.FIGURE_IS_MUTED, 0);
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
            var _local_4:RoomUserData = _local_3.userDataManager._Str_6958(k, RoomObjectTypeEnum.HABBO);
            if (_local_4 != null)
            {
                this._roomCreator.updateObjectUserAction(this._currentRoomId, _local_4._Str_2713, RoomObjectVariableEnum.FIGURE_GUIDE_STATUS, _arg_2);
            }
        }
    }
}
