//com.sulake.habbo.session.events.UserTagsReceivedEvent

package com.sulake.habbo.session.events{
    import flash.events.Event;

    public class UserTagsReceivedEvent extends Event {

        public static const USER_TAGS:String;

        private var _userId:int;
        private var _tags:Array;

        public function UserTagsReceivedEvent(k:int, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get userId():int;

        public function get tags():Array;


    }
}//package com.sulake.habbo.session.events

