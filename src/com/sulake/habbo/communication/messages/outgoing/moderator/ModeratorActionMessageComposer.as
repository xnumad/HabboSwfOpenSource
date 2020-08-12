package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
    {
        public static const ACTION_ALERT:int = 0;
        public static const ACTION_KICK:int = 1;
        public static const ACTION_MESSAGE:int = 3;
        public static const ACTION_MESSAGE_AND_SOFT_KICK:int = 4;

        private var messageArray:Array;

        public function ModeratorActionMessageComposer(k:int, _arg_2:String, _arg_3:String)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
            this.messageArray.push(_arg_3);
        }

        public function getMessageArray():Array
        {
            return this.messageArray;
        }

        public function dispose():void
        {
            this.messageArray = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
