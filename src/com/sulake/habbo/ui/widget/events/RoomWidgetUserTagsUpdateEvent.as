package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const USER_TAGS:String = "RWUTUE_USER_TAGS";

        private var _userId:int;
        private var _tags:Array;
        private var _Str_8426:Boolean;

        public function RoomWidgetUserTagsUpdateEvent(k:int, _arg_2:Array, _arg_3:Boolean, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(USER_TAGS, _arg_4, _arg_5);
            this._userId = k;
            this._tags = _arg_2;
            this._Str_8426 = _arg_3;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get tags():Array
        {
            return this._tags;
        }

        public function get _Str_11453():Boolean
        {
            return this._Str_8426;
        }
    }
}
