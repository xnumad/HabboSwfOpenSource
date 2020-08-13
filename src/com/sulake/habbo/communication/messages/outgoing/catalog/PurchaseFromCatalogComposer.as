package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PurchaseFromCatalogComposer implements IMessageComposer
    {
        private var _array:Array;

        public function PurchaseFromCatalogComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            this._array = [];
            super();
            this._array.push(k);
            this._array.push(_arg_2);
            this._array.push(_arg_3);
            this._array.push(_arg_4);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
