package com.sulake.habbo.communication.messages.outgoing.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AddItemToTradeComposer implements IMessageComposer
    {
        private var _itemID:int;

        public function AddItemToTradeComposer(k:int)
        {
            this._itemID = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._itemID];
        }
    }
}
