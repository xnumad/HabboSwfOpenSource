//com.sulake.habbo.communication.messages.parser.catalog.BundleDiscountRulesetMessageParser

package com.sulake.habbo.communication.messages.parser.catalog{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRuleset;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class BundleDiscountRulesetMessageParser implements IMessageParser {

        private var _bundleDiscountRuleset:BundleDiscountRuleset;

        public function BundleDiscountRulesetMessageParser();

        public function get bundleDiscountRuleset():BundleDiscountRuleset;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.catalog

