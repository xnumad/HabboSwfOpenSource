package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class RequestFriendMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function RequestFriendMessageComposer(k:String)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
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
