package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.UserFlatCatsMessageParser;

    public class UserFlatCatsEvent extends MessageEvent implements IMessageEvent
    {
        public function UserFlatCatsEvent(k:Function)
        {
            super(k, UserFlatCatsMessageParser);
        }

        public function getParser():UserFlatCatsMessageParser
        {
            return this._parser as UserFlatCatsMessageParser;
        }
    }
}
