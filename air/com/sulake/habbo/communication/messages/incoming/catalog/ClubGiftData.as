//com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftData

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ClubGiftData {

        private var _offerId:int;
        private var _isVip:Boolean;
        private var _isSelectable:Boolean;
        private var _daysRequired:int;

        public function ClubGiftData(k:IMessageDataWrapper);

        public function get offerId():int;

        public function get isVip():Boolean;

        public function get isSelectable():Boolean;

        public function get daysRequired():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

