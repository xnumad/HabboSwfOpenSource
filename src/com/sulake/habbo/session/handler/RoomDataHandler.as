package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2929;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_4537;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomDataHandler extends BaseHandler 
    {
        public function RoomDataHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_2929(this.onRoomResult));
        }

        private function onRoomResult(k:IMessageEvent):void
        {
            var _local_2:_Str_2929 = (k as _Str_2929);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_4537 = _local_2.getParser();
            if (_local_3._Str_18882)
            {
                return;
            }
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:_Str_2370 = _local_3.data;
            _local_4._Str_3827 = _local_5._Str_3827;
            _local_4._Str_3672 = (!(_local_5.habboGroupId == 0));
            _local_4._Str_2738 = _local_5._Str_2738;
            _local_4._Str_9439 = _local_5._Str_5667;
            _local_4._Str_4418 = _local_3._Str_4418;
            listener.events.dispatchEvent(new RoomSessionPropertyUpdateEvent(RoomSessionPropertyUpdateEvent.RSDUE_ALLOW_PETS, _local_4));
            listener.events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.ROOM_DATA, _local_4));
        }
    }
}
