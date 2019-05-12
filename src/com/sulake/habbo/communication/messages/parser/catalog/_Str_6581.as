package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6581 implements IMessageParser 
    {
        private var _pageId:int;
        private var _Str_8357:CatalogPageMessageOfferData;


        public function flush():Boolean
        {
            this._pageId = -1;
            this._Str_8357 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._pageId = k.readInteger();
            this._Str_8357 = new CatalogPageMessageOfferData(k);
            return true;
        }

        public function get pageId():int
        {
            return this._pageId;
        }

        public function get _Str_17889():CatalogPageMessageOfferData
        {
            return this._Str_8357;
        }
    }
}
