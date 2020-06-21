package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;

    public class UserObjectEvent extends MessageEvent implements IMessageEvent 
    {
        public function UserObjectEvent(k:Function)
        {
            super(k, UserObjectMessageParser);
        }

        public function getParser():UserObjectMessageParser
        {
            return this._parser as UserObjectMessageParser;
        }
    }
}
