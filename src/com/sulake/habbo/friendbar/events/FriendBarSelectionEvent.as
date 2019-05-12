package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class FriendBarSelectionEvent extends Event 
    {
        public static const FBVE_FRIEND_SELECTED:String = "FBVE_FRIEND_SELECTED";

        private var _friendId:int;
        private var _friendName:String;

        public function FriendBarSelectionEvent(k:int, _arg_2:String)
        {
            super(FBVE_FRIEND_SELECTED);
            this._friendId = k;
            this._friendName = _arg_2;
        }

        public function get _Str_9566():int
        {
            return this._friendId;
        }

        public function get _Str_24718():String
        {
            return this._friendName;
        }
    }
}
