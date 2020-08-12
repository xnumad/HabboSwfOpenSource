package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class IgnoreUserMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function IgnoreUserMessageComposer(k:String)
        {
            this.messageArray = [];
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
