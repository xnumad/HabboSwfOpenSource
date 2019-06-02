//com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRulesetMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BundleDiscountRulesetMessageParser;

    [SecureSWF(rename="true")]
    public class BundleDiscountRulesetMessageEvent extends MessageEvent implements IMessageEvent {

        public function BundleDiscountRulesetMessageEvent(k:Function);

        public function getParser():BundleDiscountRulesetMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

