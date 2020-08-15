package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.UserChatlogMessageParser;

    public class UserChatlogEvent extends MessageEvent implements IMessageEvent
    {
        public function UserChatlogEvent(k:Function)
        {
            super(k, UserChatlogMessageParser);
        }

        public function getParser():UserChatlogMessageParser
        {
            return _parser as UserChatlogMessageParser;
        }
    }
}
