//com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ClubOfferExtendData extends ClubOfferData {

        private var _originalPrice:int;
        private var _subscriptionDaysLeft:int;

        public function ClubOfferExtendData(k:IMessageDataWrapper);

        public function get originalPrice():int;

        public function get discountAmount():int;

        public function get subscriptionDaysLeft():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

