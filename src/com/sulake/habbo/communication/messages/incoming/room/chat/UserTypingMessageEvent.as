package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat.UserTypingMessageParser;

    public class UserTypingMessageEvent extends MessageEvent 
    {
        public function UserTypingMessageEvent(k:Function)
        {
            super(k, UserTypingMessageParser);
        }

        public function getParser():UserTypingMessageParser
        {
            return _parser as UserTypingMessageParser;
        }
    }
}
