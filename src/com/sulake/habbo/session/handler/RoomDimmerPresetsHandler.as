package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_8039;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.communication.messages.incoming.room.furniture._Str_5478;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomDimmerPresetsMessageParser;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    public class RoomDimmerPresetsHandler extends BaseHandler 
    {
        public function RoomDimmerPresetsHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_8039(this.onRoomDimmerPresets));
        }

        private function onRoomDimmerPresets(k:IMessageEvent):void
        {
            var _local_7:_Str_5478;
            var _local_2:_Str_8039 = (k as _Str_8039);
            if (((_local_2 == null) || (_local_2.getParser() == null)))
            {
                return;
            }
            var _local_3:RoomDimmerPresetsMessageParser = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_4 == null)
            {
                return;
            }
            var _local_5:RoomSessionDimmerPresetsEvent = new RoomSessionDimmerPresetsEvent(RoomSessionDimmerPresetsEvent.RSDPE_PRESETS, _local_4);
            _local_5._Str_6226 = _local_3._Str_6226;
            var _local_6:int;
            while (_local_6 < _local_3._Str_10888)
            {
                _local_7 = _local_3.getPreset(_local_6);
                if (_local_7 != null)
                {
                    _local_5.storePreset(_local_7.id, _local_7.type, _local_7.color, _local_7._Str_4272);
                }
                _local_6++;
            }
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(_local_5);
            }
        }
    }
}
