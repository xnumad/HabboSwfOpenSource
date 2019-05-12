package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class RoomSessionUserTagsEvent extends Event 
    {
        public static const UTRE_USER_TAGS_RECEIVED:String = "UTRE_USER_TAGS_RECEIVED";

        private var _userId:int;
        private var _tags:Array;

        public function RoomSessionUserTagsEvent(k:int, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(UTRE_USER_TAGS_RECEIVED, _arg_3, _arg_4);
            this._userId = k;
            this._tags = _arg_2;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get tags():Array
        {
            return this._tags;
        }
    }
}
