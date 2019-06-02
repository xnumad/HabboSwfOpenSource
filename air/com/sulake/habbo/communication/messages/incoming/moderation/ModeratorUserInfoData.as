//com.sulake.habbo.communication.messages.incoming.moderation.ModeratorUserInfoData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ModeratorUserInfoData {

        private var _userId:int;
        private var _userName:String;
        private var _registrationAgeInMinutes:int;
        private var _minutesSinceLastLogin:int;
        private var _online:Boolean;
        private var _cfhCount:int;
        private var _abusiveCfhCount:int;
        private var _cautionCount:int;
        private var _banCount:int;
        private var _tradingLockCount:int;
        private var _tradingExpiryDate:String;
        private var _lastPurchaseDate:String;
        private var _identityId:int;
        private var _identityRelatedBanCount:int;
        private var _primaryEmailAddress:String;
        private var _figure:String;
        private var _userClassification:String;

        public function ModeratorUserInfoData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get figure():String;

        public function get registrationAgeInMinutes():int;

        public function get minutesSinceLastLogin():int;

        public function get online():Boolean;

        public function get cfhCount():int;

        public function get abusiveCfhCount():int;

        public function get cautionCount():int;

        public function get banCount():int;

        public function get tradingLockCount():int;

        public function get tradingExpiryDate():String;

        public function get lastPurchaseDate():String;

        public function get identityId():int;

        public function get identityRelatedBanCount():int;

        public function get primaryEmailAddress():String;

        public function get userClassification():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

