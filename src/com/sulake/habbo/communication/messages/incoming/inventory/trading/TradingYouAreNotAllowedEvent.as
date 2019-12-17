package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingYouAreNotAllowedParser;

    public class TradingYouAreNotAllowedEvent extends MessageEvent 
    {
        public function TradingYouAreNotAllowedEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function getParser():TradingYouAreNotAllowedParser
        {
            return _parser as TradingYouAreNotAllowedParser;
        }
    }
}
