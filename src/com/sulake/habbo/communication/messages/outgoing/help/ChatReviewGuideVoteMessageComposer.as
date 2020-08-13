package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ChatReviewGuideVoteMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function ChatReviewGuideVoteMessageComposer(k:int)
        {
            this.messageArray = [];
            super();
            this.messageArray = [k];
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
            return this.messageArray == null;
        }
    }
}
