package com.sulake.habbo.communication.messages.incoming.perk
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.perk.PerkAllowancesMessageParser;

    public class PerkAllowancesEvent extends MessageEvent implements IMessageEvent 
    {
        public function PerkAllowancesEvent(k:Function)
        {
            super(k, PerkAllowancesMessageParser);
        }

        public function getParser():PerkAllowancesMessageParser
        {
            return _parser as PerkAllowancesMessageParser;
        }
    }
}
