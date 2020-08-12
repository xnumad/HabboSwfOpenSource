package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorRoomInfoMessageParser;

    public class _Str_8695 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8695(k:Function)
        {
            super(k, ModeratorRoomInfoMessageParser);
        }

        public function getParser():ModeratorRoomInfoMessageParser
        {
            return _parser as ModeratorRoomInfoMessageParser;
        }
    }
}
