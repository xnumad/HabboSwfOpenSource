package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser;

    public class TradingCloseEvent extends MessageEvent 
    {
        public function TradingCloseEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function get userID():int
        {
            return this.getParser().userID;
        }

        public function getParser():TradingCloseParser
        {
            return _parser as TradingCloseParser;
        }
    }
}
