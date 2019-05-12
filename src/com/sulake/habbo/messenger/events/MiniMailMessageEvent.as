package com.sulake.habbo.messenger.events
{
    import flash.events.Event;

    public class MiniMailMessageEvent extends Event 
    {
        public static const MMME_NEW:String = "MMME_new";
        public static const MMME_UNREAD:String = "MMME_unread";

        private var _unreadCount:int;

        public function MiniMailMessageEvent(k:String, _arg_2:int=-1)
        {
            super(k);
            this._unreadCount = _arg_2;
        }

        public function get unreadCount():int
        {
            return this._unreadCount;
        }
    }
}
