package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MarketplaceCanMakeOfferResultParser implements IMessageParser
    {
        private var _tokenCount:int;
        private var _result:int;


        public function get _Str_24601():int
        {
            return this._tokenCount;
        }

        public function get resultCode():int
        {
            return this._result;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            this._tokenCount = k.readInteger();
            return true;
        }
    }
}
