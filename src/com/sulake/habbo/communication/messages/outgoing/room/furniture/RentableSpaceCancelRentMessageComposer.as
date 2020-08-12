package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RentableSpaceCancelRentMessageComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function RentableSpaceCancelRentMessageComposer(k:int)
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
