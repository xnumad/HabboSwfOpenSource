package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAcceptParser;

    public class TradingAcceptEvent extends MessageEvent 
    {
        public function TradingAcceptEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function get userID():int
        {
            return this.getParser().userID;
        }

        public function get _Str_15794():Boolean
        {
            return this.getParser()._Str_15794;
        }

        public function getParser():TradingAcceptParser
        {
            return _parser as TradingAcceptParser;
        }
    }
}
