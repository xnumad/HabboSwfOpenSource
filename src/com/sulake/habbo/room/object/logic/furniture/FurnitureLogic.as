package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.logic.MovingObjectLogic;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
    import com.sulake.habbo.room.events.RoomObjectStateChangedEvent;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.events.RoomObjectEvent;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectHeightUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectSelectedMessage;

    public class FurnitureLogic extends MovingObjectLogic 
    {
        private static const BOUNCE_STEPS:int = 8;
        private static const BOUNCE_STEP_HEIGHT:Number = (1 / 16);//0.0625

        private var _mouseOver:Boolean = false;
        private var _sizeX:Number = 0;
        private var _sizeY:Number = 0;
        private var _sizeZ:Number = 0;
        private var _centerX:Number = 0;
        private var _centerY:Number = 0;
        private var _centerZ:Number = 0;
        private var _directionInitialized:Boolean = false;
        private var _bouncingStep:int = 0;
        private var _storedRotateMessage:RoomObjectUpdateMessage;
        private var _locationOffset:Vector3d;
        private var _directions:Array;

        public function FurnitureLogic()
        {
            this._locationOffset = new Vector3d();
            this._directions = [];
            super();
        }

        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_SHOW, RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_HIDE, RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_DOUBLE_CLICK, RoomObjectStateChangedEvent.STATE_CHANGE, RoomObjectMouseEvent.ROE_MOUSE_CLICK, RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_CLICK, RoomObjectMouseEvent.ROE_MOUSE_DOWN];
            if (widget != null)
            {
                k.push(RoomObjectWidgetRequestEvent.OPEN_WIDGET);
                k.push(RoomObjectWidgetRequestEvent.CLOSE_WIDGET);
            }
            if (contextMenu != null)
            {
                k.push(RoomObjectWidgetRequestEvent.OPEN_FURNI_CONTEXT_MENU);
                k.push(RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU);
            }
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function dispose():void
        {
            super.dispose();
            this._storedRotateMessage = null;
            this._directions = null;
        }

        override public function set object(k:IRoomObjectController):void
        {
            super.object = k;
            if (((!(k == null)) && (k.getLocation().length > 0)))
            {
                this._directionInitialized = true;
            }
        }

        override public function initialize(k:XML):void
        {
            var _local_9:XML;
            var _local_10:XML;
            var _local_11:int;
            if (k == null)
            {
                return;
            }
            this._sizeX = 0;
            this._sizeY = 0;
            this._sizeZ = 0;
            this._directions = [];
            var _local_2:XMLList = k.model.dimensions;
            if (_local_2.length() == 0)
            {
                return;
            }
            var _local_3:XMLList = _local_2.@x;
            if (_local_3.length() == 1)
            {
                this._sizeX = Number(_local_3);
            }
            _local_3 = _local_2.@y;
            if (_local_3.length() == 1)
            {
                this._sizeY = Number(_local_3);
            }
            _local_3 = _local_2.@z;
            if (_local_3.length() == 1)
            {
                this._sizeZ = Number(_local_3);
            }
            this._centerX = (this._sizeX / 2);
            this._centerY = (this._sizeY / 2);
            _local_3 = _local_2.@centerZ;
            if (_local_3.length() == 1)
            {
                this._centerZ = Number(_local_3);
            }
            else
            {
                this._centerZ = (this._sizeZ / 2);
            }
            var _local_4:XMLList = k.model.directions.direction;
            var _local_5:Array = ["id"];
            var _local_6:int;
            while (_local_6 < _local_4.length())
            {
                _local_10 = _local_4[_local_6];
                if (XMLValidator.checkRequiredAttributes(_local_10, _local_5))
                {
                    _local_11 = parseInt(_local_10.@id);
                    this._directions.push(_local_11);
                }
                _local_6++;
            }
            this._directions.sort(Array.NUMERIC);
            if (((object == null) || (object.getModelController() == null)))
            {
                return;
            }
            var _local_7:XMLList = k.customvars.variable;
            var _local_8:Array = [];
            for each (_local_9 in _local_7)
            {
                _local_8.push(_local_9.@name.toString());
            }
            object.getModelController().setStringArray(RoomObjectVariableEnum.FURNITURE_CUSTOM_VARIABLES, _local_8, true);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_SIZE_X, this._sizeX, true);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Y, this._sizeY, true);
            if (!object.getModelController().hasNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z))
            {
                object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z, this._sizeZ);
            }
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_CENTER_X, this._centerX, true);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_CENTER_Y, this._centerY, true);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_CENTER_Z, this._centerZ, true);
            object.getModelController().setNumberArray(RoomObjectVariableEnum.FURNITURE_ALLOWED_DIRECTIONS, this._directions, true);
            object.getModelController().setNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER, 1);
        }

        protected function getAdClickUrl(k:IRoomObjectModelController):String
        {
            return k.getString(RoomObjectVariableEnum.FURNITURE_AD_URL);
        }

        protected function handleAdClick(k:int, _arg_2:String, _arg_3:String):void
        {
            if (eventDispatcher != null)
            {
                eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_CLICK, object));
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_4:RoomObjectEvent;
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            if (object == null)
            {
                return;
            }
            var _local_3:IRoomObjectModelController = (object.getModel() as IRoomObjectModelController);
            if (_local_3 == null)
            {
                return;
            }
            var _local_5:String = this.getAdClickUrl(_local_3);
            switch (k.type)
            {
                case MouseEvent.MOUSE_MOVE:
                    if (eventDispatcher != null)
                    {
                        _local_4 = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROE_MOUSE_MOVE, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                        (_local_4 as RoomObjectMouseEvent).localX = k.localX;
                        (_local_4 as RoomObjectMouseEvent).localY = k.localY;
                        (_local_4 as RoomObjectMouseEvent).spriteOffsetX = k.spriteOffsetX;
                        (_local_4 as RoomObjectMouseEvent).spriteOffsetY = k.spriteOffsetY;
                        eventDispatcher.dispatchEvent(_local_4);
                    }
                    return;
                case MouseEvent.ROLL_OVER:
                    if (!this._mouseOver)
                    {
                        if ((((!(eventDispatcher == null)) && (!(_local_5 == null))) && (_local_5.indexOf("http") == 0)))
                        {
                            eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_SHOW, object));
                        }
                        if (eventDispatcher != null)
                        {
                            _local_4 = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROE_MOUSE_ENTER, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                            (_local_4 as RoomObjectMouseEvent).localX = k.localX;
                            (_local_4 as RoomObjectMouseEvent).localY = k.localY;
                            (_local_4 as RoomObjectMouseEvent).spriteOffsetX = k.spriteOffsetX;
                            (_local_4 as RoomObjectMouseEvent).spriteOffsetY = k.spriteOffsetY;
                            eventDispatcher.dispatchEvent(_local_4);
                        }
                        this._mouseOver = true;
                    }
                    return;
                case MouseEvent.ROLL_OUT:
                    if (this._mouseOver)
                    {
                        if ((((!(eventDispatcher == null)) && (!(_local_5 == null))) && (_local_5.indexOf("http") == 0)))
                        {
                            eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_HIDE, object));
                        }
                        if (eventDispatcher != null)
                        {
                            _local_4 = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROE_MOUSE_LEAVE, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                            (_local_4 as RoomObjectMouseEvent).localX = k.localX;
                            (_local_4 as RoomObjectMouseEvent).localY = k.localY;
                            (_local_4 as RoomObjectMouseEvent).spriteOffsetX = k.spriteOffsetX;
                            (_local_4 as RoomObjectMouseEvent).spriteOffsetY = k.spriteOffsetY;
                            eventDispatcher.dispatchEvent(_local_4);
                        }
                        this._mouseOver = false;
                    }
                    return;
                case MouseEvent.DOUBLE_CLICK:
                    this.useObject();
                    return;
                case MouseEvent.CLICK:
                    if (eventDispatcher != null)
                    {
                        _local_4 = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROE_MOUSE_CLICK, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                        (_local_4 as RoomObjectMouseEvent).localX = k.localX;
                        (_local_4 as RoomObjectMouseEvent).localY = k.localY;
                        (_local_4 as RoomObjectMouseEvent).spriteOffsetX = k.spriteOffsetX;
                        (_local_4 as RoomObjectMouseEvent).spriteOffsetY = k.spriteOffsetY;
                        eventDispatcher.dispatchEvent(_local_4);
                    }
                    if ((((!(eventDispatcher == null)) && (!(_local_5 == null))) && (_local_5.indexOf("http") == 0)))
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.RORAE_ROOM_AD_TOOLTIP_HIDE, object));
                    }
                    if (((!(eventDispatcher == null)) && (!(_local_5 == null))))
                    {
                        this.handleAdClick(object.getId(), object.getType(), _local_5);
                    }
                    if ((((!(eventDispatcher == null)) && (!(object == null))) && (!(contextMenu == null))))
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.OPEN_FURNI_CONTEXT_MENU, object));
                    }
                    return;
                case MouseEvent.MOUSE_DOWN:
                    if (eventDispatcher != null)
                    {
                        _local_4 = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROE_MOUSE_DOWN, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                        eventDispatcher.dispatchEvent(_local_4);
                    }
                    return;
            }
        }

        override public function useObject():void
        {
            var k:IRoomObjectModelController;
            var _local_2:String;
            if (object != null)
            {
                k = (object.getModel() as IRoomObjectModelController);
                if (k != null)
                {
                    _local_2 = this.getAdClickUrl(k);
                    if ((((!(eventDispatcher == null)) && (!(_local_2 == null))) && (_local_2.length > 0)))
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_DOUBLE_CLICK, object, null, _local_2));
                    }
                }
                if (eventDispatcher != null)
                {
                    if (widget != null)
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.OPEN_WIDGET, object));
                    }
                    eventDispatcher.dispatchEvent(new RoomObjectStateChangedEvent(RoomObjectStateChangedEvent.STATE_CHANGE, object));
                }
            }
        }

        private function _Str_9796(k:RoomObjectDataUpdateMessage):void
        {
            var _local_2:IRoomObjectModelController = object.getModelController();
            object.setState(k.state, 0);
            if (_local_2 != null)
            {
                if (k.data != null)
                {
                    k.data.writeRoomObjectModel(_local_2);
                }
                if (!isNaN(k._Str_2794))
                {
                    _local_2.setString(RoomObjectVariableEnum.FURNITURE_EXTRAS, String(k._Str_2794));
                }
                _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_STATE_UPDATE_TIME, lastUpdateTime);
            }
        }

        private function handleHeightUpdateMessage(k:RoomObjectHeightUpdateMessage):void
        {
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_SIZE_Z, k.height);
            }
        }

        private function handleItemDataUpdateMessage(k:RoomObjectItemDataUpdateMessage):void
        {
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setString(RoomObjectVariableEnum.FURNITURE_ITEMDATA, k.itemData);
            }
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_6:IVector3d;
            var _local_7:IVector3d;
            var _local_8:String;
            var _local_2:RoomObjectDataUpdateMessage = (k as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                this._Str_9796(_local_2);
                return;
            }
            var _local_3:RoomObjectHeightUpdateMessage = (k as RoomObjectHeightUpdateMessage);
            if (_local_3 != null)
            {
                this.handleHeightUpdateMessage(_local_3);
                return;
            }
            var _local_4:RoomObjectItemDataUpdateMessage = (k as RoomObjectItemDataUpdateMessage);
            if (_local_4 != null)
            {
                this.handleItemDataUpdateMessage(_local_4);
                return;
            }
            this._mouseOver = false;
            if (((!(k.dir == null)) && (!(k.loc == null))))
            {
                if (!(k is RoomObjectMoveUpdateMessage))
                {
                    _local_6 = object.getDirection();
                    _local_7 = object.getLocation();
                    if ((((((((!(_local_6 == null)) && (!(_local_6.x == k.dir.x))) && (this._directionInitialized)) && (!(_local_7 == null))) && (_local_7.x == k.loc.x)) && (_local_7.y == k.loc.y)) && (_local_7.z == k.loc.z)))
                    {
                        this._bouncingStep = 1;
                        this._storedRotateMessage = new RoomObjectUpdateMessage(k.loc, k.dir);
                        k = null;
                    }
                }
                this._directionInitialized = true;
            }
            var _local_5:RoomObjectSelectedMessage = (k as RoomObjectSelectedMessage);
            if (((((!(contextMenu == null)) && (!(_local_5 == null))) && (!(eventDispatcher == null))) && (!(object == null))))
            {
                _local_8 = ((_local_5.selected) ? RoomObjectWidgetRequestEvent.OPEN_FURNI_CONTEXT_MENU : RoomObjectWidgetRequestEvent.CLOSE_FURNI_CONTEXT_MENU);
                eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(_local_8, object));
            }
            super.processUpdateMessage(k);
        }

        override protected function getLocationOffset():IVector3d
        {
            if (this._bouncingStep > 0)
            {
                this._locationOffset.x = 0;
                this._locationOffset.y = 0;
                if (this._bouncingStep <= (BOUNCE_STEPS / 2))
                {
                    this._locationOffset.z = (BOUNCE_STEP_HEIGHT * this._bouncingStep);
                }
                else
                {
                    if (this._bouncingStep <= BOUNCE_STEPS)
                    {
                        if (this._storedRotateMessage)
                        {
                            super.processUpdateMessage(this._storedRotateMessage);
                            this._storedRotateMessage = null;
                        }
                        this._locationOffset.z = (BOUNCE_STEP_HEIGHT * (BOUNCE_STEPS - this._bouncingStep));
                    }
                }
                return this._locationOffset;
            }
            return null;
        }

        override public function update(k:int):void
        {
            super.update(k);
            if (this._bouncingStep > 0)
            {
                this._bouncingStep++;
                if (this._bouncingStep > BOUNCE_STEPS)
                {
                    this._bouncingStep = 0;
                }
            }
        }

        override public function tearDown():void
        {
            if (((!(widget == null)) && (object.getModelController().getNumber(RoomObjectVariableEnum.FURNITURE_REAL_ROOM_OBJECT) == 1)))
            {
                eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.CLOSE_WIDGET, object));
            }
            super.tearDown();
        }
    }
}
