package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetQuizQuestionsComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function GetQuizQuestionsComposer(k:String)
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
    }
}
