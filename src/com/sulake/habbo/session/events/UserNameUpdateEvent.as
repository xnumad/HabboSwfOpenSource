package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class UserNameUpdateEvent extends Event 
    {
        public static const UNUE_NAME_UPDATED:String = "unue_name_updated";

        private var _name:String;

        public function UserNameUpdateEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(UNUE_NAME_UPDATED, _arg_2, _arg_3);
            this._name = k;
        }

        public function get name():String
        {
            return this._name;
        }
    }
}
