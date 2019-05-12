package com.sulake.habbo.communication.messages.parser.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TradingOpenFailedEventParser implements IMessageParser 
    {
        public static const _Str_18150:int = 7;
        public static const _Str_18383:int = 8;

        private var _reason:int;
        private var _Str_10068:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            this._Str_10068 = k.readString();
            return true;
        }

        public function get reason():int
        {
            return this._reason;
        }

        public function get _Str_17035():String
        {
            return this._Str_10068;
        }
    }
}
