package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCompletedParser;

    public class TradingCompletedEvent extends MessageEvent 
    {
        public function TradingCompletedEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function getParser():TradingCompletedParser
        {
            return _parser as TradingCompletedParser;
        }
    }
}
