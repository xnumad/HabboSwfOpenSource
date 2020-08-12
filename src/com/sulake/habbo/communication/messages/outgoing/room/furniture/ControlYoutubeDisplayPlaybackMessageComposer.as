package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ControlYoutubeDisplayPlaybackMessageComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function ControlYoutubeDisplayPlaybackMessageComposer(k:int, _arg_2:int)
        {
            this.messageArray = [k, _arg_2];
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
