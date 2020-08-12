package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.RoomChatlogMessageParser;

    public class _Str_7799 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7799(k:Function)
        {
            super(k, RoomChatlogMessageParser);
        }

        public function getParser():RoomChatlogMessageParser
        {
            return _parser as RoomChatlogMessageParser;
        }
    }
}
