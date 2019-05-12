package com.sulake.habbo.communication.messages.parser.inventory.purse
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserCreditsMessageParser implements IMessageParser 
    {
        private var _balance:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._balance = int(k.readString());
            return true;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function get balance():int
        {
            return this._balance;
        }
    }
}
