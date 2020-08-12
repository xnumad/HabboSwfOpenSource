package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetUserTagsMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function GetUserTagsMessageComposer(k:int)
        {
            this.messageArray = [];
            super();
            this.messageArray.push(int(k));
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
