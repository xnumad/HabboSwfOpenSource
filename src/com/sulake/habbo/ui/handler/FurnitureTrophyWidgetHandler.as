package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.ui.widget.events._Str_5099;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class FurnitureTrophyWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_TROPHY_WIDGET;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_TROPHY];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:Number;
            var _local_6:String;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:_Str_5099;
            if (((this.disposed) || (k == null)))
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_TROPHY:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_4 = _local_3.getModel();
                        if (_local_4 != null)
                        {
                            _local_5 = _local_4.getNumber(RoomObjectVariableEnum.FURNITURE_COLOR);
                            _local_6 = _local_4.getString(RoomObjectVariableEnum.FURNITURE_DATA);
                            _local_7 = parseInt(_local_4.getString(RoomObjectVariableEnum.FURNITURE_EXTRAS));
                            _local_8 = _local_6.substring(0, _local_6.indexOf("\t"));
                            _local_6 = _local_6.substring((_local_8.length + 1), _local_6.length);
                            _local_9 = _local_6.substring(0, _local_6.indexOf("\t"));
                            _local_10 = _local_6.substring((_local_9.length + 1), _local_6.length);
                            _local_11 = new _Str_5099(_Str_5099.RWTDUE_TROPHY_DATA, _local_5, _local_8, _local_9, _local_10, _local_7);
                            this._container.events.dispatchEvent(_local_11);
                        }
                    }
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:Event;
        }

        public function update():void
        {
        }
    }
}
