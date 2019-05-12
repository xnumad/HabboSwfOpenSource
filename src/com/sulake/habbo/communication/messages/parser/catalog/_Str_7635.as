package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseOKMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7635 implements IMessageParser 
    {
        private var _offer:PurchaseOKMessageOfferData;


        public function get offer():PurchaseOKMessageOfferData
        {
            return this._offer;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._offer = new PurchaseOKMessageOfferData(k);
            return true;
        }
    }
}
