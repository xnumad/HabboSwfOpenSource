//com.sulake.habbo.tablet.catalog.purse.PurseEvent

package com.sulake.habbo.tablet.catalog.purse{
    import flash.events.Event;

    public class PurseEvent extends Event {

        public static const CREDIT_BALANCE:String;
        public static const ACTIVITY_POINT_BALANCE:String;

        private var _balance:int;
        private var _activityPointType:int;

        public function PurseEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false);

        public function get balance():int;

        public function get activityPointType():int;


    }
}//package com.sulake.habbo.tablet.catalog.purse

