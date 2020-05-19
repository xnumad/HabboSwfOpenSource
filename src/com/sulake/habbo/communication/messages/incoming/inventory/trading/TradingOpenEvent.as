package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenParser;

    public class TradingOpenEvent extends MessageEvent 
    {
        public function TradingOpenEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function get userID():int
        {
            return this.getParser().userID;
        }

        public function get _Str_16764():Boolean
        {
            return this.getParser()._Str_16764;
        }

        public function get _Str_17613():int
        {
            return this.getParser()._Str_17613;
        }

        public function get _Str_13374():Boolean
        {
            return this.getParser()._Str_13374;
        }

        public function getParser():TradingOpenParser
        {
            return _parser as TradingOpenParser;
        }
    }
}
