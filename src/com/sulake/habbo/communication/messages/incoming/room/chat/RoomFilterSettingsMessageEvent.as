package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_6830;

    public class RoomFilterSettingsMessageEvent extends MessageEvent 
    {
        public function RoomFilterSettingsMessageEvent(k:Function)
        {
            super(k, _Str_6830);
        }

        public function getParser():_Str_6830
        {
            return _parser as _Str_6830;
        }
    }
}
