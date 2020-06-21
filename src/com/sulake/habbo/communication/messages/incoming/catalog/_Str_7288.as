package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BundleDiscountRulesetMessageParser;

    public class _Str_7288 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7288(k:Function)
        {
            super(k, BundleDiscountRulesetMessageParser);
        }

        public function getParser():BundleDiscountRulesetMessageParser
        {
            return this._parser as BundleDiscountRulesetMessageParser;
        }
    }
}
