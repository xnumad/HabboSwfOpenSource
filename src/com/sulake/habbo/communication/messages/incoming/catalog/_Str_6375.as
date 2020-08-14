package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.HabboClubExtendOfferMessageParser;

    public class _Str_6375 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6375(k:Function)
        {
            super(k, HabboClubExtendOfferMessageParser);
        }

        public function getParser():HabboClubExtendOfferMessageParser
        {
            return this._parser as HabboClubExtendOfferMessageParser;
        }
    }
}
