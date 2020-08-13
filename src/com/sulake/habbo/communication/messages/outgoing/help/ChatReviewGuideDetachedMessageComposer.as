package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ChatReviewGuideDetachedMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function ChatReviewGuideDetachedMessageComposer()
        {
            this.messageArray = [];
            super();
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
