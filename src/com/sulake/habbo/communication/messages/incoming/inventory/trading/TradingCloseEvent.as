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

        public function get _Str_4963():int
        {
            return this.getParser()._Str_4963;
        }

        public function getParser():TradingCloseParser
        {
            return _parser as TradingCloseParser;
        }
    }
}
