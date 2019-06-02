//com.sulake.habbo.communication.messages.incoming.catalog.BundleDiscountRuleset

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BundleDiscountRuleset {

        private var _maxPurchaseSize:int;
        private var _bundleSize:int;
        private var _bundleDiscountSize:int;
        private var _bonusThreshold:int;
        private var _additionalBonusDiscountThresholdQuantities:Array;

        public function BundleDiscountRuleset(k:IMessageDataWrapper);

        public function get maxPurchaseSize():int;

        public function get bundleSize():int;

        public function get bundleDiscountSize():int;

        public function get bonusThreshold():int;

        public function get additionalBonusDiscountThresholdQuantities():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

