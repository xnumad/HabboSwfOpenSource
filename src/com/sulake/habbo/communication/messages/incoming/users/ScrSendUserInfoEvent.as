package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;

    public class ScrSendUserInfoEvent extends MessageEvent implements IMessageEvent
    {
        public function ScrSendUserInfoEvent(k:Function)
        {
            super(k, ScrSendUserInfoMessageParser);
        }

        public function getParser():ScrSendUserInfoMessageParser
        {
            return this._parser as ScrSendUserInfoMessageParser;
        }
    }
}
