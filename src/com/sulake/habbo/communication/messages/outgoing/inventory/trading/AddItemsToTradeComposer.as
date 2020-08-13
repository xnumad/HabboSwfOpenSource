package com.sulake.habbo.communication.messages.outgoing.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import __AS3__.vec.Vector;

    public class AddItemsToTradeComposer implements IMessageComposer
    {
        private var _array:Array;

        public function AddItemsToTradeComposer(k:Vector.<int>)
        {
            var _local_2:int;
            this._array = new Array();
            super();
            this._array.push(k.length);
            for each (_local_2 in k)
            {
                this._array.push(_local_2);
            }
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
        }
    }
}
