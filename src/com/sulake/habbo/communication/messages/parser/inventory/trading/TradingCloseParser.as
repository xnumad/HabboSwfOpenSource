package com.sulake.habbo.communication.messages.parser.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TradingCloseParser implements IMessageParser 
    {
        public static const ERROR_WHILE_COMMIT:int = 1;

        private var _userId:int;
        private var _reason:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            this._reason = k.readInteger();
            return true;
        }

        public function get _Str_4963():int
        {
            return this._userId;
        }

        public function get reason():int
        {
            return this._reason;
        }
    }
}
