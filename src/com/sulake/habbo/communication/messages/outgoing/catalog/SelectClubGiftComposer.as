package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SelectClubGiftComposer implements IMessageComposer
    {
        private var _productCode:String;

        public function SelectClubGiftComposer(k:String)
        {
            this._productCode = k;
        }

        public function getMessageArray():Array
        {
            return [this._productCode];
        }

        public function dispose():void
        {
            this._productCode = null;
        }
    }
}
