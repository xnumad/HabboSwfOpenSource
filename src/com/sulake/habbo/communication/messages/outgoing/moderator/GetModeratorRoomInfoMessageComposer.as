package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetModeratorRoomInfoMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function GetModeratorRoomInfoMessageComposer(k:int)
        {
            this.messageArray = new Array();
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
