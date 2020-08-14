package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;

    public class _Str_16789 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16789(k:Function)
        {
            super(k, IsOfferGiftableMessageParser);
        }

        public function getParser():IsOfferGiftableMessageParser
        {
            return this._parser as IsOfferGiftableMessageParser;
        }
    }
}
