package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.UserEventCatsMessageParser;

    public class UserEventCatsEvent extends MessageEvent implements IMessageEvent
    {
        public function UserEventCatsEvent(k:Function)
        {
            super(k, UserEventCatsMessageParser);
        }

        public function getParser():UserEventCatsMessageParser
        {
            return this._parser as UserEventCatsMessageParser;
        }
    }
}
