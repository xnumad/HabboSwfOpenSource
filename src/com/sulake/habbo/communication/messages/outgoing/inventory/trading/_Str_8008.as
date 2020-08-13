package com.sulake.habbo.communication.messages.outgoing.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_8008 implements IMessageComposer 
    {
        private var _itemID:int;

        public function _Str_8008(k:int)
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
