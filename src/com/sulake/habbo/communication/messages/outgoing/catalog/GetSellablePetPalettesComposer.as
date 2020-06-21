package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetSellablePetPalettesComposer implements IMessageComposer
    {
        private var _array:Array;

        public function GetSellablePetPalettesComposer(k:String)
        {
            this._array = [];
            super();
            this._array = [k];
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
