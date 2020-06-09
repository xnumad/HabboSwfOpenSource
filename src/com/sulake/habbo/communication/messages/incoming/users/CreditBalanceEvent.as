package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;

    public class CreditBalanceEvent extends MessageEvent implements IMessageEvent
    {
        public function CreditBalanceEvent(k:Function)
        {
            super(k, CreditBalanceParser);
        }

        public function getParser():CreditBalanceParser
        {
            return this._parser as CreditBalanceParser;
        }
    }
}
