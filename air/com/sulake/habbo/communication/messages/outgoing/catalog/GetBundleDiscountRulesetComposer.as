//com.sulake.habbo.communication.messages.outgoing.catalog.GetBundleDiscountRulesetComposer

package com.sulake.habbo.communication.messages.outgoing.catalog{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetBundleDiscountRulesetComposer implements IMessageComposer {

        public function GetBundleDiscountRulesetComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.catalog

