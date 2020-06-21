package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRuleset;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BundleDiscountRulesetMessageParser implements IMessageParser
    {
        private var _bundleDiscountRuleset:BundleDiscountRuleset;


        public function get bundleDiscountRuleset():BundleDiscountRuleset
        {
            return this._bundleDiscountRuleset;
        }

        public function flush():Boolean
        {
            this._bundleDiscountRuleset = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._bundleDiscountRuleset = new BundleDiscountRuleset(k);
            return true;
        }
    }
}
