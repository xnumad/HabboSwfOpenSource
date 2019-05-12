package com.sulake.habbo.communication.messages.parser.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TradingAcceptParser implements IMessageParser 
    {
        private var _userID:int;
        private var _userAccepts:Boolean;


        public function get _Str_4963():int
        {
            return this._userID;
        }

        public function get _Str_15794():Boolean
        {
            return this._userAccepts;
        }

        public function flush():Boolean
        {
            this._userID = -1;
            this._userAccepts = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userID = k.readInteger();
            this._userAccepts = (k.readInteger() > 0);
            return true;
        }
    }
}
