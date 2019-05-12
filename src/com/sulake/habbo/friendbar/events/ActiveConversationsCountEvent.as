package com.sulake.habbo.friendbar.events
{
    import flash.events.Event;

    public class ActiveConversationsCountEvent extends Event 
    {
        public static const AMC_EVENT:String = "AMC_EVENT";

        private var _activeConversationsCount:int;

        public function ActiveConversationsCountEvent(k:int=-1)
        {
            this._activeConversationsCount = k;
            super(AMC_EVENT);
        }

        public function get _Str_18689():int
        {
            return this._activeConversationsCount;
        }
    }
}
