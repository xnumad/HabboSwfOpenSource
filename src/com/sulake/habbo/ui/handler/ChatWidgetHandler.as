package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.connection.IConnection;
    import flash.geom.Point;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.ui.widget.roomchat.RoomChatWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.game.events.GameChatEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.session.RoomUserData;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.ui.widget.enums.SystemChatStyleEnum;
    import com.sulake.habbo.ui.widget.events._Str_3535;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.enum.AvatarFigurePartType;
    import com.sulake.habbo.ui.widget.events._Str_3040;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.utils.PointMath;
    import com.sulake.habbo.room.ImageResult;

    public class ChatWidgetHandler implements IRoomWidgetHandler, IAvatarImageListener, IGetImageListener 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _avatarImageCache:Map = null;
        private var _petImageCache:Map = null;
        private var _avatarColorCache:Map = null;
        private var _petImageIdToFigureString:Map = null;
        private var _imagesWaitingForDispose:Array;
        private var _connection:IConnection = null;
        private var _primaryCanvasScale:Number = 0;
        private var _primaryCanvasOriginPos:Point = null;
        private var _tempScreenPosVector:Vector3d;
        private var _widget:RoomChatWidget;

        public function ChatWidgetHandler()
        {
            this._imagesWaitingForDispose = [];
            this._tempScreenPosVector = new Vector3d();
            super();
            this._avatarImageCache = new Map();
            this._petImageCache = new Map();
            this._avatarColorCache = new Map();
            this._petImageIdToFigureString = new Map();
        }

        public function set widget(k:RoomChatWidget):void
        {
            this._widget = k;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CHAT_WIDGET;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set connection(k:IConnection):void
        {
            this._connection = k;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:BitmapData;
            var _local_3:BitmapData;
            this._isDisposed = true;
            this._container = null;
            this._primaryCanvasOriginPos = null;
            if (this._avatarImageCache != null)
            {
                k = 0;
                while (k < this._avatarImageCache.length)
                {
                    _local_2 = (this._avatarImageCache.getWithIndex(k) as BitmapData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._avatarImageCache.dispose();
                this._avatarImageCache = null;
            }
            if (this._petImageCache != null)
            {
                k = 0;
                while (k < this._petImageCache.length)
                {
                    _local_2 = (this._petImageCache.getWithIndex(k) as BitmapData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._petImageCache.dispose();
                this._petImageCache = null;
            }
            for each (_local_3 in this._imagesWaitingForDispose)
            {
                if (_local_3 != null)
                {
                    _local_3.dispose();
                }
            }
            this._imagesWaitingForDispose = [];
            if (this._avatarColorCache != null)
            {
                this._avatarColorCache.dispose();
                this._avatarColorCache = null;
            }
        }

        public function _Str_2607():Array
        {
            return new Array(0);
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            switch (k.type)
            {
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [RoomSessionChatEvent.RSCE_CHAT_EVENT, GameChatEvent.GCE_GAME_CHAT];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_3:RoomSessionChatEvent;
            var _local_4:IRoomObject;
            var _local_5:IRoomGeometry;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:IVector3d;
            var _local_9:Point;
            var _local_10:RoomUserData;
            var _local_11:String;
            var _local_12:uint;
            var _local_13:BitmapData;
            var _local_14:int;
            var _local_15:int;
            var _local_16:Boolean;
            var _local_17:String;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            var _local_22:String;
            var _local_23:String;
            var _local_24:Point;
            var _local_25:String;
            var _local_26:IRoomObject;
            var _local_27:String;
            var _local_28:String;
            var _local_29:String;
            var _local_30:String;
            var _local_31:String;
            var _local_32:String;
            var _local_33:String;
            var _local_34:String;
            var _local_35:IRoomObject;
            var _local_36:RoomUserData;
            if (((this._container.freeFlowChat) && (!(this._container.freeFlowChat.isDisabledInPreferences))))
            {
                return;
            }
            var _local_2:Event;
            switch (k.type)
            {
                case RoomSessionChatEvent.RSCE_CHAT_EVENT:
                    _local_3 = (k as RoomSessionChatEvent);
                    if (_local_3 != null)
                    {
                        _local_4 = this._container.roomEngine.getRoomObject(_local_3.session.roomId, _local_3.userId, RoomObjectCategoryEnum.CONST_100);
                        if (_local_4 != null)
                        {
                            _local_5 = this._container.roomEngine.getRoomCanvasGeometry(_local_3.session.roomId, this._container.getFirstCanvasId());
                            if (_local_5 != null)
                            {
                                this._Str_20006();
                                _local_6 = 0;
                                _local_7 = 0;
                                _local_8 = _local_4.getLocation();
                                _local_9 = _local_5.getScreenPoint(_local_8);
                                if (_local_9 != null)
                                {
                                    _local_6 = _local_9.x;
                                    _local_7 = _local_9.y;
                                    _local_24 = this._container.roomEngine.getRoomCanvasScreenOffset(_local_3.session.roomId, this._container.getFirstCanvasId());
                                    if (_local_24 != null)
                                    {
                                        _local_6 = (_local_6 + _local_24.x);
                                        _local_7 = (_local_7 + _local_24.y);
                                    }
                                }
                                _local_10 = this._container.roomSession.userDataManager.getUserDataByIndex(_local_3.userId);
                                _local_11 = "";
                                _local_12 = 0;
                                _local_13 = null;
                                _local_14 = 32;
                                _local_15 = 2;
                                _local_16 = true;
                                _local_17 = null;
                                _local_18 = _local_3.chatType;
                                _local_19 = _local_3.style;
                                _local_20 = 0;
                                _local_21 = -1;
                                if (_local_10 != null)
                                {
                                    _local_20 = _local_10.type;
                                    _local_25 = _local_10.figure;
                                    switch (_local_20)
                                    {
                                        case RoomObjectTypeEnum.PET:
                                            _local_26 = this._Str_13861(_local_10._Str_2713);
                                            if (_local_26 != null)
                                            {
                                                _local_17 = _local_26.getModel().getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                                            }
                                            _local_13 = this.getPetImage(_local_25, _local_15, _local_16, _local_14, _local_17);
                                            _local_21 = new PetFigureData(_local_25).typeId;
                                            break;
                                        case RoomObjectTypeEnum.HABBO:
                                            _local_13 = this._Str_7081(_local_25);
                                            break;
                                        case RoomObjectTypeEnum.RENTABLE_BOT:
                                        case RoomObjectTypeEnum.BOT:
                                            _local_19 = SystemChatStyleEnum.BOT;
                                            break;
                                    }
                                    _local_12 = this._avatarColorCache.getValue(_local_25);
                                    _local_11 = _local_10.name;
                                }
                                _local_22 = _local_3.text;
                                if (_local_18 == RoomSessionChatEvent.CHAT_TYPE_HAND_ITEM_RECEIVED)
                                {
                                    _local_27 = "widget.chatbubble.handitem";
                                    _local_28 = this._container.localization.getLocalization(("handitem" + _local_3.extraParam), ("handitem" + _local_3.extraParam));
                                    this._container.localization.registerParameter(_local_27, "username", _local_11);
                                    this._container.localization.registerParameter(_local_27, "handitem", _local_28);
                                    _local_22 = this._container.localization.getLocalizationRaw(_local_27).value;
                                    _local_19 = SystemChatStyleEnum.GENERIC;
                                }
                                if (_local_18 == RoomSessionChatEvent._Str_8909)
                                {
                                    _local_29 = "widget.chatbubble.mutetime";
                                    _local_30 = String((_local_3.extraParam % 60));
                                    _local_31 = String(((_local_3.extraParam > 0) ? Math.floor(((_local_3.extraParam % 3600) / 60)) : 0));
                                    _local_32 = String(((_local_3.extraParam > 0) ? Math.floor((_local_3.extraParam / 3600)) : 0));
                                    this._container.localization.registerParameter(_local_29, "hours", _local_32);
                                    this._container.localization.registerParameter(_local_29, "minutes", _local_31);
                                    this._container.localization.registerParameter(_local_29, "seconds", _local_30);
                                    _local_22 = this._container.localization.getLocalizationRaw(_local_29).value;
                                    _local_19 = SystemChatStyleEnum.GENERIC;
                                }
                                if ((((_local_18 == RoomSessionChatEvent.CHAT_TYPE_PETREVIVE) || (_local_18 == RoomSessionChatEvent.CHAT_TYPE_PET_REBREED_FERTILIZE)) || (_local_18 == RoomSessionChatEvent.CHAT_TYPE_PET_SPEED_FERTILIZE)))
                                {
                                    _local_33 = "widget.chatbubble.petrevived";
                                    if (_local_18 == RoomSessionChatEvent.CHAT_TYPE_PET_REBREED_FERTILIZE)
                                    {
                                        _local_33 = "widget.chatbubble.petrefertilized";
                                    }
                                    else
                                    {
                                        if (_local_18 == RoomSessionChatEvent.CHAT_TYPE_PET_SPEED_FERTILIZE)
                                        {
                                            _local_33 = "widget.chatbubble.petspeedfertilized";
                                        }
                                    }
                                    _local_34 = "";
                                    _local_35 = this._Str_13861(_local_3.extraParam);
                                    if (_local_35 != null)
                                    {
                                        _local_36 = _local_3.session.userDataManager.getUserDataByIndex(_local_35.getId());
                                        if (_local_36 != null)
                                        {
                                            _local_34 = _local_36.name;
                                        }
                                    }
                                    this._container.localization.registerParameter(_local_33, "petName", _local_11);
                                    this._container.localization.registerParameter(_local_33, "userName", _local_34);
                                    _local_22 = this._container.localization.getLocalizationRaw(_local_33).value;
                                    _local_19 = SystemChatStyleEnum.GENERIC;
                                }
                                _local_23 = _Str_3535.RWCUE_EVENT_CHAT;
                                _local_2 = new _Str_3535(_local_23, _local_3.userId, _local_22, _local_11, RoomObjectCategoryEnum.CONST_100, _local_20, _local_21, _local_6, _local_7, _local_13, _local_12, _local_3.session.roomId, _local_18, _local_19, _local_3.links);
                            }
                        }
                    }
                    break;
                case GameChatEvent.GCE_GAME_CHAT:
                    this._Str_22362((k as GameChatEvent));
                    break;
            }
            if ((((!(this._container == null)) && (!(this._container.events == null))) && (!(_local_2 == null))))
            {
                this._container.events.dispatchEvent(_local_2);
            }
        }

        private function _Str_13861(k:int):IRoomObject
        {
            return this.container.roomEngine.getRoomObject(this.container.roomEngine.activeRoomId, k, RoomObjectCategoryEnum.CONST_100);
        }

        public function _Str_7081(k:String):BitmapData
        {
            var _local_3:IAvatarImage;
            var _local_4:IPartColor;
            var _local_2:BitmapData = (this._avatarImageCache.getValue(k) as BitmapData);
            if (_local_2 == null)
            {
                _local_3 = this._container.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, null, this);
                if (_local_3 != null)
                {
                    _local_2 = _local_3._Str_818(AvatarSetType.HEAD, 0.5);
                    _local_4 = _local_3._Str_867(AvatarFigurePartType.CHEST);
                    _local_3.dispose();
                    if (_local_4 != null)
                    {
                        this._avatarColorCache.add(k, _local_4._Str_915);
                    }
                }
            }
            if (_local_2 != null)
            {
                this._avatarImageCache.add(k, _local_2);
            }
            return _local_2;
        }

        private function _Str_22362(k:GameChatEvent):void
        {
            this._widget._Str_5863(k.message, k.name, k._Str_19907, this._Str_7081(k.figure), k.color, k.notify);
        }

        public function update():void
        {
            this._Str_20006();
        }

        private function _Str_20006():void
        {
            var _local_4:Number;
            var _local_5:String;
            var _local_6:_Str_3040;
            var _local_7:Point;
            var _local_8:Point;
            var _local_9:Point;
            if (((((this._container == null) || (this._container.roomSession == null)) || (this._container.roomEngine == null)) || (this._container.events == null)))
            {
                return;
            }
            var k:int = this._container.getFirstCanvasId();
            var _local_2:int = this._container.roomSession.roomId;
            var _local_3:RoomGeometry = (this._container.roomEngine.getRoomCanvasGeometry(_local_2, k) as RoomGeometry);
            if (_local_3 != null)
            {
                _local_4 = 1;
                if (this._primaryCanvasScale > 0)
                {
                    _local_4 = (_local_3.scale / this._primaryCanvasScale);
                }
                if (this._primaryCanvasOriginPos == null)
                {
                    this._tempScreenPosVector.x = 0;
                    this._tempScreenPosVector.y = 0;
                    this._tempScreenPosVector.z = 0;
                    this._primaryCanvasOriginPos = _local_3.getScreenPoint(this._tempScreenPosVector);
                    this._primaryCanvasScale = (_local_3.scale - 10);
                }
                _local_5 = "";
                _local_6 = null;
                this._tempScreenPosVector.x = 0;
                this._tempScreenPosVector.y = 0;
                this._tempScreenPosVector.z = 0;
                _local_7 = _local_3.getScreenPoint(this._tempScreenPosVector);
                if (_local_7 != null)
                {
                    _local_8 = this._container.roomEngine.getRoomCanvasScreenOffset(_local_2, k);
                    if (_local_8 != null)
                    {
                        _local_7.offset(_local_8.x, _local_8.y);
                    }
                    if (((!(_local_7.x == this._primaryCanvasOriginPos.x)) || (!(_local_7.y == this._primaryCanvasOriginPos.y))))
                    {
                        _local_9 = PointMath.sub(_local_7, PointMath.mul(this._primaryCanvasOriginPos, _local_4));
                        if (((!(_local_9.x == 0)) || (!(_local_9.y == 0))))
                        {
                            _local_5 = _Str_3040.RWRVUE_ROOM_VIEW_POSITION_CHANGED;
                            _local_6 = new _Str_3040(_local_5, null, _local_9);
                            this._container.events.dispatchEvent(_local_6);
                        }
                        this._primaryCanvasOriginPos = _local_7;
                    }
                }
                if (_local_3.scale != this._primaryCanvasScale)
                {
                    _local_5 = _Str_3040.RWRVUE_ROOM_VIEW_SCALE_CHANGED;
                    _local_6 = new _Str_3040(_local_5, null, null, _local_3.scale);
                    this._container.events.dispatchEvent(_local_6);
                    this._primaryCanvasScale = _local_3.scale;
                }
            }
        }

        public function _Str_18432(k:String):void
        {
            var _local_2:BitmapData;
            if (this._petImageCache)
            {
                _local_2 = (this._petImageCache.remove(k) as BitmapData);
                if (_local_2 != null)
                {
                    this._imagesWaitingForDispose.push(_local_2);
                }
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:BitmapData;
            if (this._avatarImageCache)
            {
                _local_2 = (this._avatarImageCache.remove(k) as BitmapData);
                if (_local_2 != null)
                {
                    this._imagesWaitingForDispose.push(_local_2);
                }
            }
        }

        private function getPetImage(k:String, _arg_2:int, _arg_3:Boolean, _arg_4:int=64, _arg_5:String=null):BitmapData
        {
            var _local_7:PetFigureData;
            var _local_8:int;
            var _local_9:uint;
            var _local_10:Boolean;
            var _local_11:ImageResult;
            var _local_6:BitmapData = (this._petImageCache.getValue((k + _arg_5)) as BitmapData);
            if (_local_6 == null)
            {
                _local_7 = new PetFigureData(k);
                _local_8 = _local_7.typeId;
                _local_9 = 0;
                _local_10 = (!(_local_8 == 15));
                _local_11 = this._container.roomEngine.getPetImage(_local_8, _local_7.paletteId, _local_7.color, new Vector3d((_arg_2 * 45)), _arg_4, this, _local_10, _local_9, _local_7._Str_3542, _arg_5);
                if (_local_11 != null)
                {
                    _local_6 = _local_11.data;
                    if (_local_11.id > 0)
                    {
                        this._petImageIdToFigureString.add(_local_11.id, _local_7.figureString);
                    }
                }
            }
            if (_local_6 != null)
            {
                this._petImageCache.add((k + _arg_5), _local_6);
            }
            return _local_6;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:String = this._petImageIdToFigureString.remove(k);
            if (_local_3 != null)
            {
                this._Str_18432(_local_3);
                if (this._petImageCache)
                {
                    this._petImageCache.add(_local_3, _arg_2);
                }
            }
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
