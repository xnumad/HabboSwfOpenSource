package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetIsOfferGiftableComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetIsOfferGiftableComposer(k:int)
        {
            this._array = [];
            super();
            this._array.push(k);
        }

        public function dispose():void
        {
            this._array = [];
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
