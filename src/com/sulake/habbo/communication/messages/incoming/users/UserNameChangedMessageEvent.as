package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;

    public class UserNameChangedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function UserNameChangedMessageEvent(k:Function)
        {
            super(k, UserNameChangedMessageParser);
        }

        public function getParser():UserNameChangedMessageParser
        {
            return _parser as UserNameChangedMessageParser;
        }
    }
}
