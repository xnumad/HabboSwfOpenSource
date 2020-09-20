package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PurchaseFromCatalogAsGiftComposer implements IMessageComposer
    {
        private var _array:Array;

        public function PurchaseFromCatalogAsGiftComposer(pageId:int, offerCode:int, extraParam:String, receiverName:String, message:String, boxStuffTypeId:int, boxTypeId:int, ribbonTypeId:int, showPurchaserName:Boolean)
        {
            this._array = [];
            super();
            this._array.push(pageId);
            this._array.push(offerCode);
            this._array.push(extraParam);
            this._array.push(receiverName);
            this._array.push(message);
            this._array.push(boxStuffTypeId);
            this._array.push(boxTypeId);
            this._array.push(ribbonTypeId);
            this._array.push(showPurchaserName);
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
