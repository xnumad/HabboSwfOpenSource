//com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ScrSendUserInfoMessageParser implements IMessageParser {

        public static const RESPONSE_TYPE_LOGIN:int;
        public static const RESPONSE_TYPE_PURCHASE:int;
        public static const RESPONSE_TYPE_DISCOUNT_AVAILABLE:int;
        public static const RESPONSE_TYPE_CITIZENSHIP_DISCOUNT:int;

        private var _productName:String;
        private var _daysToPeriodEnd:int;
        private var _memberPeriods:int;
        private var _periodsSubscribedAhead:int;
        private var _responseType:int;
        private var _hasEverBeenMember:Boolean;
        private var _isVIP:Boolean;
        private var _pastClubDays:int;
        private var _pastVipDays:int;
        private var _minutesUntilExpiration:int;

        public function ScrSendUserInfoMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get productName():String;

        public function get daysToPeriodEnd():int;

        public function get memberPeriods():int;

        public function get periodsSubscribedAhead():int;

        public function get responseType():int;

        public function get hasEverBeenMember():Boolean;

        public function get isVIP():Boolean;

        public function get pastClubDays():int;

        public function get pastVipDays():int;

        public function get minutesUntilExpiration():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

