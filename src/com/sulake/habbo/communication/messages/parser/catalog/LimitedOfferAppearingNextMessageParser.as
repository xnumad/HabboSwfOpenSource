package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class LimitedOfferAppearingNextMessageParser implements IMessageParser
    {
        private var _Str_6800:int;
        private var _pageId:int;
        private var _offerId:int;
        private var _productType:String;


        public function flush():Boolean
        {
            this._Str_6800 = -1;
            this._pageId = -1;
            this._offerId = -1;
            this._productType = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6800 = k.readInteger();
            this._pageId = k.readInteger();
            this._offerId = k.readInteger();
            this._productType = k.readString();
            return true;
        }

        public function get _Str_23051():int
        {
            return this._Str_6800;
        }

        public function get pageId():int
        {
            return this._pageId;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get productType():String
        {
            return this._productType;
        }
    }
}
