package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.events._Str_4984;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class PlaceholderWidgetHandler implements IRoomWidgetHandler 
    {
        private var _container:IRoomWidgetHandlerContainer = null;


        public function dispose():void
        {
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }

        public function get type():String
        {
            return null;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function getWidgetMessages():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_PLACEHOLDER];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:_Str_4984;
            switch (k.type)
            {
                default:
                    _local_2 = new _Str_4984(_Str_4984.RWSPE_SHOW_PLACEHOLDER);
                    this._container.events.dispatchEvent(_local_2);
            }
            return null;
        }

        public function getProcessedEvents():Array
        {
            return null;
        }

        public function processEvent(k:Event):void
        {
        }

        public function update():void
        {
        }
    }
}
