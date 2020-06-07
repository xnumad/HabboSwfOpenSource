package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.LimitedOfferAppearingNextMessageParser;

    public class _Str_8320 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8320(k:Function)
        {
            super(k, LimitedOfferAppearingNextMessageParser);
        }

        public function getParser():LimitedOfferAppearingNextMessageParser
        {
            return this._parser as LimitedOfferAppearingNextMessageParser;
        }
    }
}
