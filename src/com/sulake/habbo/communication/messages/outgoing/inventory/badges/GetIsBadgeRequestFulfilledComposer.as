package com.sulake.habbo.communication.messages.outgoing.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetIsBadgeRequestFulfilledComposer implements IMessageComposer
    {
        private var messageArray:Array;

        public function GetIsBadgeRequestFulfilledComposer(k:String)
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
