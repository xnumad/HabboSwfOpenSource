//com.sulake.habbo.session.events.UserNameUpdateEvent

package com.sulake.habbo.session.events{
    import flash.events.Event;

    public class UserNameUpdateEvent extends Event {

        public static const NAME_UPDATE:String;

        private var _name:String;

        public function UserNameUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false);

        public function get name():String;


    }
}//package com.sulake.habbo.session.events

