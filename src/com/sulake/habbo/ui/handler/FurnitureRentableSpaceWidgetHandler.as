package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.rentablespace.RentableSpaceDisplayWidget;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_7811;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8033;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_7746;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8229;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8190;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_11461;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_10101;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture._Str_9716;

    public class FurnitureRentableSpaceWidgetHandler implements IRoomWidgetHandler 
    {
        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:RentableSpaceDisplayWidget;
        private var _rentableSpaceStatusMessageEvent:_Str_7811;
        private var _rentableSpaceRentOkMessageEvent:_Str_8033;
        private var _rentableSpaceRentFailedMessageEvent:_Str_7746;


        public function get type():String
        {
            return RoomWidgetEnum.RENTABLESPACE;
        }

        public function set widget(k:RentableSpaceDisplayWidget):void
        {
            this._widget = k;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._rentableSpaceStatusMessageEvent = new _Str_7811(this._Str_24112);
            this._container.connection.addMessageEvent(this._rentableSpaceStatusMessageEvent);
            this._rentableSpaceRentOkMessageEvent = new _Str_8033(this._Str_23287);
            this._container.connection.addMessageEvent(this._rentableSpaceRentOkMessageEvent);
            this._rentableSpaceRentFailedMessageEvent = new _Str_7746(this._Str_22780);
            this._container.connection.addMessageEvent(this._rentableSpaceRentFailedMessageEvent);
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
            if (this._container.roomEngine == null)
            {
                return;
            }
            var _local_2:RoomEngineTriggerWidgetEvent = (k as RoomEngineTriggerWidgetEvent);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomObject = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.OPEN_WIDGET:
                    if (_local_3 != null)
                    {
                        this._widget.show(_local_3);
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.CLOSE_WIDGET:
                    this._widget.hide(_local_3);
                    return;
            }
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._rentableSpaceStatusMessageEvent != null)
            {
                this._container.connection.removeMessageEvent(this._rentableSpaceStatusMessageEvent);
                this._rentableSpaceStatusMessageEvent = null;
            }
            if (this._rentableSpaceRentOkMessageEvent != null)
            {
                this._container.connection.removeMessageEvent(this._rentableSpaceRentOkMessageEvent);
                this._rentableSpaceRentOkMessageEvent = null;
            }
            if (this._rentableSpaceRentFailedMessageEvent != null)
            {
                this._container.connection.removeMessageEvent(this._rentableSpaceRentFailedMessageEvent);
                this._rentableSpaceRentFailedMessageEvent = null;
            }
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._container == null;
        }

        public function _Str_23287(k:_Str_8033):void
        {
            this._widget._Str_19184();
        }

        public function _Str_22780(k:_Str_7746):void
        {
            var _local_2:_Str_8229 = k.getParser();
            this._widget._Str_23970(_local_2.reason);
        }

        public function _Str_24112(k:_Str_7811):void
        {
            var _local_2:_Str_8190 = k.getParser();
            this._widget._Str_23885(_local_2._Str_22736, _local_2._Str_23603, _local_2._Str_25070, _local_2.renterId, _local_2._Str_23275, _local_2._Str_24083, _local_2.price);
        }

        public function _Str_25642(k:int):void
        {
            this._container.connection.send(new _Str_11461(k));
        }

        public function _Str_24966(k:int):void
        {
            this._container.connection.send(new _Str_10101(k));
        }

        public function _Str_24022(k:int):void
        {
            this._container.connection.send(new _Str_9716(k));
        }

        public function _Str_26430():int
        {
            return this._container.sessionDataManager.clubLevel;
        }

        public function _Str_23322():int
        {
            return this._container.catalog.getPurse().credits;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }
    }
}
