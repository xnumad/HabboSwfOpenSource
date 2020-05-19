package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading._Str_10279;

    public class TradingNoSuchItemEvent extends MessageEvent 
    {
        public function TradingNoSuchItemEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function getParser():_Str_10279
        {
            return _parser as _Str_10279;
        }
    }
}
