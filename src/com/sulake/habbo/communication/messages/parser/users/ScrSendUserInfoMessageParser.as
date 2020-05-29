package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ScrSendUserInfoMessageParser implements IMessageParser
    {
        public static const RESPONSE_TYPE_LOGIN:int = 1;
        public static const RESPONSE_TYPE_PURCHASE:int = 2;
        public static const RESPONSE_TYPE_DISCOUNT_AVAILABLE:int = 3;
        public static const RESPONSE_TYPE_CITIZENSHIP_DISCOUNT:int = 4;

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
        private var _minutesSinceLastModified:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._productName = k.readString();
            this._daysToPeriodEnd = k.readInteger();
            this._memberPeriods = k.readInteger();
            this._periodsSubscribedAhead = k.readInteger();
            this._responseType = k.readInteger();
            this._hasEverBeenMember = k.readBoolean();
            this._isVIP = k.readBoolean();
            this._pastClubDays = k.readInteger();
            this._pastVipDays = k.readInteger();
            this._minutesUntilExpiration = k.readInteger();
            if (k.bytesAvailable)
            {
                this._minutesSinceLastModified = k.readInteger();
            }
            return true;
        }

        public function get productName():String
        {
            return this._productName;
        }

        public function get daysToPeriodEnd():int
        {
            return this._daysToPeriodEnd;
        }

        public function get memberPeriods():int
        {
            return this._memberPeriods;
        }

        public function get periodsSubscribedAhead():int
        {
            return this._periodsSubscribedAhead;
        }

        public function get responseType():int
        {
            return this._responseType;
        }

        public function get hasEverBeenMember():Boolean
        {
            return this._hasEverBeenMember;
        }

        public function get isVIP():Boolean
        {
            return this._isVIP;
        }

        public function get pastClubDays():int
        {
            return this._pastClubDays;
        }

        public function get pastVipDays():int
        {
            return this._pastVipDays;
        }

        public function get minutesUntilExpiration():int
        {
            return this._minutesUntilExpiration;
        }

        public function get minutesSinceLastModified():int
        {
            return this._minutesSinceLastModified;
        }
    }
}
