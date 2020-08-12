package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetRoomChatlogMessageComposer implements IMessageComposer, IDisposable
    {
        private var messageArray:Array;

        public function GetRoomChatlogMessageComposer(k:int, _arg_2:int)
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

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
