//com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationParser

package com.sulake.habbo.communication.messages.parser.marketplace{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class MarketplaceConfigurationParser implements IMessageParser {

        private var _isEnabled:Boolean;
        private var _commission:int;
        private var _tokenBatchPrice:int;
        private var _tokensBatchSize:int;
        private var _offerMaxPrice:int;
        private var _offerMinPrice:int;
        private var _expirationHours:int;
        private var _averagePricePeriod:int;

        public function MarketplaceConfigurationParser();

        public function get isEnabled():Boolean;

        public function get commission():int;

        public function get tokenBatchPrice():int;

        public function get tokenBatchSize():int;

        public function get offerMinPrice():int;

        public function get offerMaxPrice():int;

        public function get expirationHours():int;

        public function get averagePricePeriod():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.marketplace

