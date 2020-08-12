package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetYoutubeDisplayStatusMessageComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function GetYoutubeDisplayStatusMessageComposer(k:int)
        {
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
    }
}
