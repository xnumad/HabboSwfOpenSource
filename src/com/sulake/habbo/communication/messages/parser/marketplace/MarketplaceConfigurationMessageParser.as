package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MarketplaceConfigurationMessageParser implements IMessageParser 
    {
        private var _enabled:Boolean;
        private var _commission:int;
        private var _credits:int;
        private var _advertisements:int;
        private var _maximumPrice:int;
        private var _minimumPrice:int;
        private var _offerTime:int;
        private var _displayTime:int;


        public function get enabled():Boolean
        {
            return this._enabled;
        }

        public function get commission():int
        {
            return this._commission;
        }

        public function get credits():int
        {
            return this._credits;
        }

        public function get advertisements():int
        {
            return this._advertisements;
        }

        public function get minimumPrice():int
        {
            return this._minimumPrice;
        }

        public function get maximumPrice():int
        {
            return this._maximumPrice;
        }

        public function get offerTime():int
        {
            return this._offerTime;
        }

        public function get displayTime():int
        {
            return this._displayTime;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._enabled = k.readBoolean();
            this._commission = k.readInteger();
            this._credits = k.readInteger();
            this._advertisements = k.readInteger();
            this._minimumPrice = k.readInteger();
            this._maximumPrice = k.readInteger();
            this._offerTime = k.readInteger();
            this._displayTime = k.readInteger();
            return true;
        }
    }
}
