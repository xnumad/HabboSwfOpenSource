package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.customstackheight.CustomStackHeightWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_9362;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7848;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import com.sulake.habbo.session.enum.RoomControllerLevel;

    public class FurnitureCustomStackHeightWidgetHandler implements IRoomWidgetHandler 
    {
        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:CustomStackHeightWidget;
        private var _lastFurniId:int = -1;


        public function set widget(k:CustomStackHeightWidget):void
        {
            this._widget = k;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CUSTOM_STACK_HEIGHT;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._container.connection.addMessageEvent(new _Str_9362(this._Str_23242));
        }

        private function _Str_23242(k:_Str_9362):void
        {
            var _local_2:_Str_7848 = k.getParser();
            if (((this._widget) && (this._Str_6826())))
            {
                this._widget._Str_24760(_local_2.furniId, _local_2.height);
            }
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
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
            return [];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineTriggerWidgetEvent;
            var _local_3:IRoomObject;
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.OPEN_WIDGET:
                    _local_2 = (k as RoomEngineTriggerWidgetEvent);
                    if (((!(k == null)) && (!(this._container.roomEngine == null))))
                    {
                        this._lastFurniId = _local_2._Str_1577;
                        _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
                        if (((_local_3) && (this._Str_6826(_local_3))))
                        {
                            if (this._widget)
                            {
                                this._widget.open(this._lastFurniId, _local_3.getLocation().z);
                            }
                        }
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.CLOSE_WIDGET:
                    _local_2 = (k as RoomEngineTriggerWidgetEvent);
                    if ((((!(k == null)) && (!(this._container.roomEngine == null))) && (!(this._widget == null))))
                    {
                        if (this._lastFurniId == _local_2._Str_1577)
                        {
                            this._widget.hide();
                        }
                    }
                    return;
            }
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            this._container = null;
            this._widget = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        private function _Str_6826(k:IRoomObject=null):Boolean
        {
            var _local_2:Boolean = this._container.roomSession.isRoomController;
            var _local_3:* = (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST);
            var _local_4:Boolean = this._container.sessionDataManager.isGodMode;
            var _local_5:Boolean = ((k) && (this._container.isOwnerOfFurniture(k)));
            return (((_local_2) || (_local_4)) || (_local_3)) || (_local_5);
        }
    }
}
