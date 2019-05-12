package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniEngravingWidget;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;

    public class FriendFurniEngravingWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:FriendFurniEngravingWidget = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FRIEND_FURNI_ENGRAVING;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function set widget(k:FriendFurniEngravingWidget):void
        {
            this._widget = k;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
            this._widget = null;
        }

        public function _Str_2609():Array
        {
            return [RoomEngineTriggerWidgetEvent.RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineObjectEvent;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:StringArrayStuffData;
            if (((this.disposed) || (k == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING:
                    _local_2 = RoomEngineObjectEvent(k);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_4 = _local_3.getModel();
                        if (_local_4 != null)
                        {
                            _local_5 = new StringArrayStuffData();
                            _local_5.initializeFromRoomObjectModel(_local_4);
                            this._widget.open(_local_3.getId(), _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_FRIENDFURNI_ENGRAVING_TYPE), _local_5);
                        }
                    }
                    return;
            }
        }

        public function update():void
        {
        }

        public function _Str_2607():Array
        {
            return [];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }
    }
}
