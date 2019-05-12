package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7328 implements IMessageParser 
    {
        private var _Str_8357:CatalogPageMessageOfferData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8357 = new CatalogPageMessageOfferData(k);
            return true;
        }

        public function get _Str_17889():CatalogPageMessageOfferData
        {
            return this._Str_8357;
        }
    }
}
