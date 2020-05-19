package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingItemListParser;

    public class TradingItemListEvent extends MessageEvent 
    {
        public function TradingItemListEvent(k:Function, _arg_2:Class)
        {
            super(k, _arg_2);
        }

        public function get firstUserID():int
        {
            return this.getParser().firstUserID;
        }

        public function get secondUserID():int
        {
            return this.getParser().secondUserID;
        }

        public function get firstUserNumItems():int
        {
            return this.getParser().firstUserNumItems;
        }

        public function get secondUserNumItems():int
        {
            return this.getParser().secondUserNumItems;
        }

        public function get firstUserNumCredits():int
        {
            return this.getParser().firstUserNumCredits;
        }

        public function get secondUserNumCredits():int
        {
            return this.getParser().secondUserNumCredits;
        }

        public function get firstUserItemArray():Array
        {
            return this.getParser().firstUserItemArray;
        }

        public function get secondUserItemArray():Array
        {
            return this.getParser().secondUserItemArray;
        }

        public function getParser():TradingItemListParser
        {
            return _parser as TradingItemListParser;
        }
    }
}
