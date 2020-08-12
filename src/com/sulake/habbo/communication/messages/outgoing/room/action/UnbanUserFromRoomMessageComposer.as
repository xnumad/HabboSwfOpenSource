package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class UnbanUserFromRoomMessageComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function UnbanUserFromRoomMessageComposer(k:int, _arg_2:int)
        {
            this.messageArray = new Array();
            super();
            this.messageArray.push(k);
            this.messageArray.push(_arg_2);
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
