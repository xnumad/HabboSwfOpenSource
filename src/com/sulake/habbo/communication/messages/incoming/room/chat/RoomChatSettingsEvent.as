package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_9348;

    public class RoomChatSettingsEvent extends MessageEvent 
    {
        public function RoomChatSettingsEvent(k:Function)
        {
            super(k, _Str_9348);
        }

        public function getParser():_Str_9348
        {
            return _parser as _Str_9348;
        }
    }
}
