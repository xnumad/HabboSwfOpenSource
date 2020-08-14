package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IsOfferGiftableMessageParser implements IMessageParser
    {
        private var _offerId:int;
        private var _Str_21271:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._offerId = k.readInteger();
            this._Str_21271 = k.readBoolean();
            return true;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get _Str_18028():Boolean
        {
            return this._Str_21271;
        }
    }
}
