package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNotOpenParser;

    public class TradingNotOpenEvent extends MessageEvent 
    {
        public function TradingNotOpenEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function _Str_2273():TradingNotOpenParser
        {
            return _parser as TradingNotOpenParser;
        }
    }
}
