package com.sulake.habbo.friendbar.groupforums
{
    import flash.events.Event;

    public class UnseenForumsCountUpdatedEvent extends Event 
    {
        public static const UNSEEN_FORUMS_COUNT:String = "UNSEEN_FORUMS_COUNT";

        private var _unseenForumsCount:int;

        public function UnseenForumsCountUpdatedEvent(k:String, _arg_2:int)
        {
            super(k);
            this._unseenForumsCount = _arg_2;
        }

        public function get _Str_9691():int
        {
            return this._unseenForumsCount;
        }
    }
}
