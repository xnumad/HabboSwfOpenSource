//com.sulake.habbo.tablet.catalog.purchase.GiftWrappingConfiguration

package com.sulake.habbo.tablet.catalog.purchase{
    import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;

    public class GiftWrappingConfiguration {

        private var _isEnabled:Boolean;
        private var _price:int;
        private var _stuffTypes:Array;
        private var _boxTypes:Array;
        private var _ribbonTypes:Array;
        private var _defaultStuffTypes:Array;

        public function GiftWrappingConfiguration(k:GiftWrappingConfigurationEvent);

        public function get isEnabled():Boolean;

        public function get price():int;

        public function get stuffTypes():Array;

        public function get boxTypes():Array;

        public function get ribbonTypes():Array;

        public function get defaultStuffTypes():Array;


    }
}//package com.sulake.habbo.tablet.catalog.purchase

