package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetConversionPointMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class ConversionPointWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.CONVERSION_TRACKING;
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
            return [RoomWidgetConversionPointMessage.RWCPM_CONVERSION_POINT];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetConversionPointMessage;
            switch (k.type)
            {
                case RoomWidgetConversionPointMessage.RWCPM_CONVERSION_POINT:
                    _local_2 = (k as RoomWidgetConversionPointMessage);
                    if (_local_2 == null)
                    {
                        return null;
                    }
                    this._container.roomSession._Str_21689(_local_2.category, _local_2._Str_23854, _local_2.action, _local_2._Str_22656, _local_2._Str_24399);
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            return k;
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function update():void
        {
        }
    }
}
