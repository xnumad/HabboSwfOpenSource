package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.rentablespace.RentableSpaceDisplayWidget;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.RentableSpaceStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.RentableSpaceRentOkMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.furniture.RentableSpaceRentFailedMessageEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceRentFailedMessageParser;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RentableSpaceStatusMessageParser;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.RentableSpaceStatusMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.RentableSpaceCancelRentMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.room.furniture.RentableSpaceRentMessageComposer;

    public class FurnitureRentableSpaceWidgetHandler implements IRoomWidgetHandler 
    {
        private var _container:IRoomWidgetHandlerContainer;
        private var _widget:RentableSpaceDisplayWidget;
        private var _rentableSpaceStatusMessageEvent:RentableSpaceStatusMessageEvent;
        private var _rentableSpaceRentOkMessageEvent:RentableSpaceRentOkMessageEvent;
        private var _rentableSpaceRentFailedMessageEvent:RentableSpaceRentFailedMessageEvent;


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
            this._rentableSpaceStatusMessageEvent = new RentableSpaceStatusMessageEvent(this._Str_24112);
            this._container.connection.addMessageEvent(this._rentableSpaceStatusMessageEvent);
            this._rentableSpaceRentOkMessageEvent = new RentableSpaceRentOkMessageEvent(this.onRentableSpaceRentOkMessage);
            this._container.connection.addMessageEvent(this._rentableSpaceRentOkMessageEvent);
            this._rentableSpaceRentFailedMessageEvent = new RentableSpaceRentFailedMessageEvent(this._Str_22780);
            this._container.connection.addMessageEvent(this._rentableSpaceRentFailedMessageEvent);
        }

        public function getWidgetMessages():Array
        {
            return null;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function getProcessedEvents():Array
        {
            return [];
        }

        public function processEvent(k:Event):void
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
            var _local_3:IRoomObject = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.objectId, _local_2.category);
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

        public function onRentableSpaceRentOkMessage(k:RentableSpaceRentOkMessageEvent):void
        {
            this._widget.updateWidgetState();
        }

        public function _Str_22780(k:RentableSpaceRentFailedMessageEvent):void
        {
            var _local_2:RentableSpaceRentFailedMessageParser = k.getParser();
            this._widget._Str_23970(_local_2.reason);
        }

        public function _Str_24112(k:RentableSpaceStatusMessageEvent):void
        {
            var _local_2:RentableSpaceStatusMessageParser = k.getParser();
            this._widget._Str_23885(_local_2._Str_22736, _local_2._Str_23603, _local_2._Str_25070, _local_2.renterId, _local_2._Str_23275, _local_2._Str_24083, _local_2.price);
        }

        public function getRentableSpaceStatus(k:int):void
        {
            this._container.connection.send(new RentableSpaceStatusMessageComposer(k));
        }

        public function cancelRent(k:int):void
        {
            this._container.connection.send(new RentableSpaceCancelRentMessageComposer(k));
        }

        public function rentSpace(k:int):void
        {
            this._container.connection.send(new RentableSpaceRentMessageComposer(k));
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
