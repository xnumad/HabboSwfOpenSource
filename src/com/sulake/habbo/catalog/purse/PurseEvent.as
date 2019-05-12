package com.sulake.habbo.catalog.purse
{
    import flash.events.Event;

    public class PurseEvent extends Event 
    {
        public static const CATALOG_PURSE_CREDIT_BALANCE:String = "catalog_purse_credit_balance";
        public static const CATALOG_PURSE_ACTIVITY_POINT_BALANCE:String = "catalog_purse_activity_point_balance";

        private var _balance:int;
        private var _activityPointType:int;

        public function PurseEvent(k:String, balance:int, activityPointType:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._balance = balance;
            this._activityPointType = activityPointType;
        }

        public function get balance():int
        {
            return this._balance;
        }

        public function get activityPointType():int
        {
            return this._activityPointType;
        }
    }
}
