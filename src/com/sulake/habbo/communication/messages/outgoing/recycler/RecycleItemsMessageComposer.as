package com.sulake.habbo.communication.messages.outgoing.recycler
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RecycleItemsMessageComposer implements IMessageComposer
    {
        private var stripItemIds:Array;

        public function RecycleItemsMessageComposer(k:Array)
        {
            this.stripItemIds = new Array();
            this.stripItemIds.push(k.length);
            this.stripItemIds = this.stripItemIds.concat(k);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return this.stripItemIds;
        }
    }
}
