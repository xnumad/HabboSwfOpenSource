package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RedeemVoucherMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function RedeemVoucherMessageComposer(k:String)
        {
            this._array = [];
            super();
            this._array.push(k);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
