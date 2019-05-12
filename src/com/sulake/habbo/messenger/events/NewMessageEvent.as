package com.sulake.habbo.messenger.events
{
    import flash.events.Event;

    public class NewMessageEvent extends Event 
    {
        public static const FBE_MESSAGE:String = "FBE_MESSAGE";

        public var notify:Boolean;
        public var senderId:int;

        public function NewMessageEvent(k:Boolean, _arg_2:int)
        {
            super(FBE_MESSAGE, false, false);
            this.notify = k;
            this.senderId = _arg_2;
        }
    }
}
