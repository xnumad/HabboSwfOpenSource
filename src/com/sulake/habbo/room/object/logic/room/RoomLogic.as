package com.sulake.habbo.room.object.logic.room
{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.utils.ColorConverter;
    import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
    import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage;
    import flash.utils.getTimer;
    import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.object.RoomPlaneData;
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectWallMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class RoomLogic extends ObjectLogicBase 
    {
        protected var _Str_2550:RoomPlaneParser = null;
        private var _roomPlaneBitmapMaskParser:RoomPlaneBitmapMaskParser = null;
        private var _color:uint = 0xFFFFFF;
        private var _Str_3576:int = 0xFF;
        private var _Str_14932:uint = 0xFFFFFF;
        private var _Str_17003:int = 0xFF;
        private var _Str_11287:uint = 0xFFFFFF;
        private var _Str_16460:int = 0xFF;
        private var _Str_9785:int = 0;
        private var _Str_17191:int = 1500;
        private var _Str_15050:Boolean;

        public function RoomLogic()
        {
            this._Str_2550 = new RoomPlaneParser();
            this._roomPlaneBitmapMaskParser = new RoomPlaneBitmapMaskParser();
        }

        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectMouseEvent.ROE_MOUSE_MOVE, RoomObjectMouseEvent.ROE_MOUSE_CLICK];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._Str_2550 != null)
            {
                this._Str_2550.dispose();
                this._Str_2550 = null;
            }
            if (this._roomPlaneBitmapMaskParser != null)
            {
                this._roomPlaneBitmapMaskParser.dispose();
                this._roomPlaneBitmapMaskParser = null;
            }
        }

        override public function initialize(k:XML):void
        {
            if (((k == null) || (object == null)))
            {
                return;
            }
            if (!this._Str_2550.initializeFromXML(k))
            {
                return;
            }
            var _local_2:IRoomObjectModelController = (object.getModel() as IRoomObjectModelController);
            if (_local_2 != null)
            {
                _local_2.setString(RoomObjectVariableEnum.ROOM_PLANE_XML, k.toString());
                _local_2.setNumber(RoomObjectVariableEnum.ROOM_BACKGROUND_COLOR, 0xFFFFFF);
                _local_2.setNumber(RoomObjectVariableEnum.ROOM_FLOOR_VISIBILITY, 1);
                _local_2.setNumber(RoomObjectVariableEnum.ROOM_WALL_VISIBILITY, 1);
                _local_2.setNumber(RoomObjectVariableEnum.ROOM_LANDSCAPE_VISIBILITY, 1);
            }
        }

        override public function update(k:int):void
        {
            var _local_2:IRoomObjectModelController;
            var _local_3:XML;
            super.update(k);
            this.updateBackgroundColor(k);
            if (this._Str_15050)
            {
                if (object != null)
                {
                    _local_2 = (object.getModel() as IRoomObjectModelController);
                    if (_local_2 != null)
                    {
                        _local_3 = this._Str_2550._Str_5598();
                        _local_2.setString(RoomObjectVariableEnum.ROOM_PLANE_XML, _local_3.toString());
                        _local_2.setNumber(RoomObjectVariableEnum.ROOM_FLOOR_HOLE_UPDATE_TIME, k);
                        this._Str_2550.initializeFromXML(_local_3);
                    }
                }
                this._Str_15050 = false;
            }
        }

        private function updateBackgroundColor(k:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:IRoomObjectModelController;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Number;
            if (object == null)
            {
                return;
            }
            if (this._Str_9785)
            {
                _local_2 = k;
                _local_3 = this._color;
                _local_4 = this._Str_3576;
                if ((_local_2 - this._Str_9785) >= this._Str_17191)
                {
                    _local_3 = this._Str_11287;
                    _local_4 = this._Str_16460;
                    this._Str_9785 = 0;
                }
                else
                {
                    _local_7 = ((this._Str_14932 >> 16) & 0xFF);
                    _local_8 = ((this._Str_14932 >> 8) & 0xFF);
                    _local_9 = (this._Str_14932 & 0xFF);
                    _local_10 = ((this._Str_11287 >> 16) & 0xFF);
                    _local_11 = ((this._Str_11287 >> 8) & 0xFF);
                    _local_12 = (this._Str_11287 & 0xFF);
                    _local_13 = ((_local_2 - this._Str_9785) / this._Str_17191);
                    _local_7 = (_local_7 + ((_local_10 - _local_7) * _local_13));
                    _local_8 = (_local_8 + ((_local_11 - _local_8) * _local_13));
                    _local_9 = (_local_9 + ((_local_12 - _local_9) * _local_13));
                    _local_3 = (((_local_7 << 16) + (_local_8 << 8)) + _local_9);
                    _local_4 = (this._Str_17003 + ((this._Str_16460 - this._Str_17003) * _local_13));
                    this._color = _local_3;
                    this._Str_3576 = _local_4;
                }
                _local_5 = ColorConverter.rgbToHSL(_local_3);
                _local_5 = ((_local_5 & 0xFFFF00) + _local_4);
                _local_3 = ColorConverter.hslToRGB(_local_5);
                _local_6 = (object.getModel() as IRoomObjectModelController);
                if (_local_6 == null)
                {
                    return;
                }
                _local_6.setNumber(RoomObjectVariableEnum.ROOM_BACKGROUND_COLOR, _local_3);
            }
        }

        private function updatePlaneTypes(k:RoomObjectRoomUpdateMessage, _arg_2:IRoomObjectModelController):void
        {
            switch (k.type)
            {
                case RoomObjectRoomUpdateMessage.RORUM_ROOM_FLOOR_UPDATE:
                    _arg_2.setString(RoomObjectVariableEnum.ROOM_FLOOR_TYPE, k.value);
                    return;
                case RoomObjectRoomUpdateMessage.RORUM_ROOM_WALL_UPDATE:
                    _arg_2.setString(RoomObjectVariableEnum.ROOM_WALL_TYPE, k.value);
                    return;
                case RoomObjectRoomUpdateMessage.RORUM_ROOM_LANDSCAPE_UPDATE:
                    _arg_2.setString(RoomObjectVariableEnum.ROOM_LANDSCAPE_TYPE, k.value);
                    return;
            }
        }

        private function _Str_15935(k:RoomObjectRoomMaskUpdateMessage, _arg_2:IRoomObjectModelController):void
        {
            var _local_5:String;
            var _local_6:XML;
            var _local_7:String;
            var _local_3:RoomPlaneBitmapMaskData;
            var _local_4:Boolean;
            switch (k.type)
            {
                case RoomObjectRoomMaskUpdateMessage.RORMUM_ADD_MASK:
                    _local_5 = RoomPlaneBitmapMaskData.WINDOW;
                    if (k.maskCategory == RoomObjectRoomMaskUpdateMessage.HOLE)
                    {
                        _local_5 = RoomPlaneBitmapMaskData.HOLE;
                    }
                    this._roomPlaneBitmapMaskParser.addMask(k.maskId, k.maskType, k.maskLocation, _local_5);
                    _local_4 = true;
                    break;
                case RoomObjectRoomMaskUpdateMessage.REMOVE_MASK:
                    _local_4 = this._roomPlaneBitmapMaskParser.removeMask(k.maskId);
                    break;
            }
            if (_local_4)
            {
                _local_6 = this._roomPlaneBitmapMaskParser._Str_5598();
                _local_7 = _local_6.toXMLString();
                _arg_2.setString(RoomObjectVariableEnum.ROOM_PLANE_MASK_XML, _local_7);
            }
        }

        private function updatePlaneVisibilities(k:RoomObjectRoomPlaneVisibilityUpdateMessage, _arg_2:IRoomObjectModelController):void
        {
            var _local_3:int;
            if (k.visible)
            {
                _local_3 = 1;
            }
            switch (k.type)
            {
                case RoomObjectRoomPlaneVisibilityUpdateMessage.RORPVUM_FLOOR_VISIBILITY:
                    _arg_2.setNumber(RoomObjectVariableEnum.ROOM_FLOOR_VISIBILITY, _local_3);
                    return;
                case RoomObjectRoomPlaneVisibilityUpdateMessage.RORPVUM_WALL_VISIBILITY:
                    _arg_2.setNumber(RoomObjectVariableEnum.ROOM_WALL_VISIBILITY, _local_3);
                    _arg_2.setNumber(RoomObjectVariableEnum.ROOM_LANDSCAPE_VISIBILITY, _local_3);
                    return;
            }
        }

        private function updatePlaneProperties(k:RoomObjectRoomPlanePropertyUpdateMessage, _arg_2:IRoomObjectModelController):void
        {
            switch (k.type)
            {
                case RoomObjectRoomPlanePropertyUpdateMessage.RORPVUM_FLOOR_THICKNESS:
                    _arg_2.setNumber(RoomObjectVariableEnum.ROOM_FLOOR_THICKNESS, k.value);
                    return;
                case RoomObjectRoomPlanePropertyUpdateMessage.RORPPUM_WALL_THICKNESS:
                    _arg_2.setNumber(RoomObjectVariableEnum.ROOM_WALL_THICKNESS, k.value);
                    return;
            }
        }

        private function _Str_18134(k:RoomObjectRoomFloorHoleUpdateMessage, _arg_2:IRoomObjectModelController):void
        {
            switch (k.type)
            {
                case RoomObjectRoomFloorHoleUpdateMessage.RORPFHUM_ADD:
                    this._Str_2550.addFloorHole(k.id, k.x, k.y, k.width, k.height);
                    this._Str_15050 = true;
                    return;
                case RoomObjectRoomFloorHoleUpdateMessage.RORPFHUM_REMOVE:
                    this._Str_2550.removeFloorHole(k.id);
                    this._Str_15050 = true;
                    return;
            }
        }

        private function updateColors(k:RoomObjectRoomColorUpdateMessage, _arg_2:IRoomObjectModelController):void
        {
            var _local_3:int = k.color;
            var _local_4:int = k._Str_4272;
            _arg_2.setNumber(RoomObjectVariableEnum.ROOM_COLORIZE_BG_ONLY, int(k.bgOnly));
            this._Str_14932 = this._color;
            this._Str_17003 = this._Str_3576;
            this._Str_11287 = _local_3;
            this._Str_16460 = _local_4;
            this._Str_9785 = getTimer();
            this._Str_17191 = 1500;
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            if (((k == null) || (object == null)))
            {
                return;
            }
            var _local_2:IRoomObjectModelController = (object.getModel() as IRoomObjectModelController);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:RoomObjectRoomUpdateMessage = (k as RoomObjectRoomUpdateMessage);
            if (_local_3 != null)
            {
                this.updatePlaneTypes(_local_3, _local_2);
                return;
            }
            var _local_4:RoomObjectRoomMaskUpdateMessage = (k as RoomObjectRoomMaskUpdateMessage);
            if (_local_4 != null)
            {
                this._Str_15935(_local_4, _local_2);
                return;
            }
            var _local_5:RoomObjectRoomPlaneVisibilityUpdateMessage = (k as RoomObjectRoomPlaneVisibilityUpdateMessage);
            if (_local_5 != null)
            {
                this.updatePlaneVisibilities(_local_5, _local_2);
                return;
            }
            var _local_6:RoomObjectRoomPlanePropertyUpdateMessage = (k as RoomObjectRoomPlanePropertyUpdateMessage);
            if (_local_6 != null)
            {
                this.updatePlaneProperties(_local_6, _local_2);
                return;
            }
            var _local_7:RoomObjectRoomFloorHoleUpdateMessage = (k as RoomObjectRoomFloorHoleUpdateMessage);
            if (_local_7 != null)
            {
                this._Str_18134(_local_7, _local_2);
            }
            var _local_8:RoomObjectRoomColorUpdateMessage = (k as RoomObjectRoomColorUpdateMessage);
            if (_local_8 != null)
            {
                this.updateColors(_local_8, _local_2);
                return;
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_25:String;
            var _local_26:Number;
            var _local_27:Number;
            var _local_28:Number;
            if (_arg_2 == null)
            {
                return;
            }
            var _local_3:RoomSpriteMouseEvent = k;
            if (_local_3 == null)
            {
                return;
            }
            if (((object == null) || (k == null)))
            {
                return;
            }
            var _local_4:IRoomObjectModelController = (object.getModel() as IRoomObjectModelController);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:int;
            var _local_6:String = _local_3.spriteTag;
            if (((!(_local_6 == null)) && (_local_6.indexOf("@") >= 0)))
            {
                _local_5 = parseInt(_local_6.substr((_local_6.indexOf("@") + 1)));
            }
            if (((_local_5 < 1) || (_local_5 > this._Str_2550._Str_3828)))
            {
                if (k.type == MouseEvent.ROLL_OUT)
                {
                    _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_PLANE, 0);
                }
                return;
            }
            _local_5--;
            var _local_7:Point;
            var _local_8:IVector3d = this._Str_2550.getPlaneLocation(_local_5);
            var _local_9:IVector3d = this._Str_2550.getPlaneLeftSide(_local_5);
            var _local_10:IVector3d = this._Str_2550.getPlaneRightSide(_local_5);
            var _local_11:IVector3d = this._Str_2550.getPlaneNormalDirection(_local_5);
            var _local_12:int = this._Str_2550.getPlaneType(_local_5);
            if (((((_local_8 == null) || (_local_9 == null)) || (_local_10 == null)) || (_local_11 == null)))
            {
                return;
            }
            var _local_13:Number = _local_9.length;
            var _local_14:Number = _local_10.length;
            if (((_local_13 == 0) || (_local_14 == 0)))
            {
                return;
            }
            var _local_15:Number = _local_3.screenX;
            var _local_16:Number = _local_3.screenY;
            var _local_17:Point = new Point(_local_15, _local_16);
            _local_7 = _arg_2.getPlanePosition(_local_17, _local_8, _local_9, _local_10);
            if (_local_7 == null)
            {
                _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_PLANE, 0);
                return;
            }
            var _local_18:Vector3d = Vector3d.product(_local_9, (_local_7.x / _local_13));
            _local_18.add(Vector3d.product(_local_10, (_local_7.y / _local_14)));
            _local_18.add(_local_8);
            var _local_19:Number = _local_18.x;
            var _local_20:Number = _local_18.y;
            var _local_21:Number = _local_18.z;
            if (((((_local_7.x >= 0) && (_local_7.x < _local_13)) && (_local_7.y >= 0)) && (_local_7.y < _local_14)))
            {
                _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_X, _local_19);
                _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_Y, _local_20);
                _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_Z, _local_21);
                _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_PLANE, (_local_5 + 1));
            }
            else
            {
                _local_4.setNumber(RoomObjectVariableEnum.ROOM_SELECTED_PLANE, 0);
                return;
            }
            var _local_22:String = "";
            var _local_23:int;
            var _local_24:RoomObjectEvent;
            switch (k.type)
            {
                case MouseEvent.MOUSE_MOVE:
                case MouseEvent.ROLL_OVER:
                case MouseEvent.CLICK:
                    _local_25 = "";
                    if (((k.type == MouseEvent.MOUSE_MOVE) || (k.type == MouseEvent.ROLL_OVER)))
                    {
                        _local_25 = RoomObjectMouseEvent.ROE_MOUSE_MOVE;
                    }
                    else
                    {
                        if (k.type == MouseEvent.CLICK)
                        {
                            _local_25 = RoomObjectMouseEvent.ROE_MOUSE_CLICK;
                        }
                    }
                    if (eventDispatcher != null)
                    {
                        if (_local_12 == RoomPlaneData.PLANE_FLOOR)
                        {
                            _local_24 = new RoomObjectTileMouseEvent(_local_25, object, k.eventId, _local_19, _local_20, _local_21, k.altKey, k.ctrlKey, k.shiftKey);
                        }
                        else
                        {
                            if (((_local_12 == RoomPlaneData.PLANE_WALL) || (_local_12 == RoomPlaneData.PLANE_LANDSCAPE)))
                            {
                                _local_26 = 90;
                                if (_local_11 != null)
                                {
                                    _local_26 = (_local_11.x + 90);
                                    if (_local_26 > 360)
                                    {
                                        _local_26 = (_local_26 - 360);
                                    }
                                }
                                _local_27 = ((_local_9.length * _local_7.x) / _local_13);
                                _local_28 = ((_local_10.length * _local_7.y) / _local_14);
                                _local_24 = new RoomObjectWallMouseEvent(_local_25, object, k.eventId, _local_8, _local_9, _local_10, _local_27, _local_28, _local_26);
                            }
                        }
                        if (_local_24 != null)
                        {
                            eventDispatcher.dispatchEvent(_local_24);
                        }
                    }
                    return;
            }
        }
    }
}
