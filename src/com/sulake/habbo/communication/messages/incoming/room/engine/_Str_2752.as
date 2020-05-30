package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;

    public class _Str_2752 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_2752(k:Function)
        {
            super(k, RoomEntryInfoMessageParser);
        }

        public function getParser():RoomEntryInfoMessageParser
        {
            return _parser as RoomEntryInfoMessageParser;
        }
    }
}
