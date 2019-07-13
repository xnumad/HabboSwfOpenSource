package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorFurniWidget;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.events.Event;
    import com.sulake.habbo.session.enum.RoomControllerLevel;

    public class FurnitureBackgroundColorWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _widget:BackgroundColorFurniWidget;
        private var _container:IRoomWidgetHandlerContainer;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function dispose():void
        {
            if (!this._isDisposed)
            {
                this.container = null;
                this._isDisposed = true;
            }
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_BACKGROUND_COLOR;
        }

        public function set widget(k:BackgroundColorFurniWidget):void
        {
            this._widget = k;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function _Str_2607():Array
        {
            return null;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BACKGROUND_COLOR);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineObjectEvent;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_BACKGROUND_COLOR:
                    if (this._Str_6826())
                    {
                        _local_2 = (k as RoomEngineObjectEvent);
                        _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
                        _local_4 = _local_3.getModel();
                        _local_5 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_ROOM_BACKGROUND_COLOR_HUE);
                        _local_6 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_ROOM_BACKGROUND_COLOR_SATURATION);
                        _local_7 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_ROOM_BACKGROUND_COLOR_LIGHTNESS);
                        this._widget.open(_local_3.getId(), _local_5, _local_6, _local_7);
                    }
                    return;
            }
        }

        private function _Str_6826():Boolean
        {
            var k:Boolean = this._container.roomSession.isRoomController;
            var _local_2:* = (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST);
            var _local_3:Boolean = this._container.sessionDataManager.isGodMode;
            return ((k) || (_local_3)) || (_local_2);
        }

        public function update():void
        {
        }
    }
}
