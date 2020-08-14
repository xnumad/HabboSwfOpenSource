package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BonusRareInfoMessageParser;

    public class _Str_6906 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6906(k:Function)
        {
            super(k, BonusRareInfoMessageParser);
        }

        public function getParser():BonusRareInfoMessageParser
        {
            return this._parser as BonusRareInfoMessageParser;
        }
    }
}
