package com.sulake.habbo.messenger.events
{
    import flash.events.Event;

    public class ActiveConversationEvent extends Event 
    {
        public static const ACCE_CHANGED:String = "ACCE_changed";

        private var _activeConversationsCount:int;

        public function ActiveConversationEvent(k:String, _arg_2:int=-1)
        {
            super(k);
            this._activeConversationsCount = _arg_2;
        }

        public function get _Str_18689():int
        {
            return this._activeConversationsCount;
        }
    }
}
