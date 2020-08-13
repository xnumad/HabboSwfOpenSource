package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetProductOfferComposer implements IMessageComposer
    {
        private var _offerId:int;

        public function GetProductOfferComposer(k:int)
        {
            this._offerId = k;
        }

        public function getMessageArray():Array
        {
            return [this._offerId];
        }

        public function dispose():void
        {
        }
    }
}
