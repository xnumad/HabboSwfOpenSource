package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MarketplaceCancelOfferResultParser implements IMessageParser
    {
        private var _offerId:int;
        private var _success:Boolean;


        public function get success():Boolean
        {
            return this._success;
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._offerId = k.readInteger();
            this._success = k.readBoolean();
            return true;
        }
    }
}
