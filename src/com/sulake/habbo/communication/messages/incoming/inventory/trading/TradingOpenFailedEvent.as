package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenFailedEventParser;

    public class TradingOpenFailedEvent extends MessageEvent 
    {
        public function TradingOpenFailedEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function getParser():TradingOpenFailedEventParser
        {
            return _parser as TradingOpenFailedEventParser;
        }
    }
}
