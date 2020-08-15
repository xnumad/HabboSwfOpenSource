package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.CfhChatlogMessageParser;

    public class CfhChatlogEvent extends MessageEvent implements IMessageEvent
    {
        public function CfhChatlogEvent(k:Function)
        {
            super(k, CfhChatlogMessageParser);
        }

        public function getParser():CfhChatlogMessageParser
        {
            return _parser as CfhChatlogMessageParser;
        }
    }
}
