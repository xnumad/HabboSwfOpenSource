package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.IdentityAccountsParser;

    public class IdentityAccountsEvent extends MessageEvent implements IMessageEvent 
    {
        public function IdentityAccountsEvent(k:Function)
        {
            super(k, IdentityAccountsParser);
        }

        public function getParser():IdentityAccountsParser
        {
            return this._parser as IdentityAccountsParser;
        }
    }
}
