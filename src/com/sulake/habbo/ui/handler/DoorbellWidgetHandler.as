package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetLetUserInMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import com.sulake.habbo.ui.widget.events._Str_3436;
    import flash.events.Event;

    public class DoorbellWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.DOORBELL;
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
            return [RoomWidgetLetUserInMessage.RWLUIM_LET_USER_IN];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetLetUserInMessage;
            switch (k.type)
            {
                case RoomWidgetLetUserInMessage.RWLUIM_LET_USER_IN:
                    _local_2 = (k as RoomWidgetLetUserInMessage);
                    this._container.roomSession._Str_20488(_local_2.userName, _local_2._Str_23117);
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [RoomSessionDoorbellEvent.RSDE_DOORBELL, RoomSessionDoorbellEvent.REJECTED, RoomSessionDoorbellEvent.RSDE_ACCEPTED];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionDoorbellEvent;
            switch (k.type)
            {
                case RoomSessionDoorbellEvent.RSDE_DOORBELL:
                    _local_2 = (k as RoomSessionDoorbellEvent);
                    if (_local_2 == null)
                    {
                        return;
                    }
                    this._container.events.dispatchEvent(new _Str_3436(_Str_3436.RWDE_RINGING, _local_2.userName));
                    return;
                case RoomSessionDoorbellEvent.REJECTED:
                    _local_2 = (k as RoomSessionDoorbellEvent);
                    if (_local_2 == null)
                    {
                        return;
                    }
                    this._container.events.dispatchEvent(new _Str_3436(_Str_3436.REJECTED, _local_2.userName));
                    return;
                case RoomSessionDoorbellEvent.RSDE_ACCEPTED:
                    _local_2 = (k as RoomSessionDoorbellEvent);
                    if (_local_2 == null)
                    {
                        return;
                    }
                    this._container.events.dispatchEvent(new _Str_3436(_Str_3436.RWDE_ACCEPTED, _local_2.userName));
                    return;
            }
        }

        public function update():void
        {
        }
    }
}
