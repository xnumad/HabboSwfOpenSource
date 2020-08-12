package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RentableSpaceStatusMessageComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function RentableSpaceStatusMessageComposer(k:int)
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
