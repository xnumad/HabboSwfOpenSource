package com.sulake.habbo.communication.messages.parser.marketplace
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5775 implements IMessageParser 
    {
        private var _Str_2507:int;
        private var _success:Boolean;


        public function get success():Boolean
        {
            return this._success;
        }

        public function get offerId():int
        {
            return this._Str_2507;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2507 = k.readInteger();
            this._success = k.readBoolean();
            return true;
        }
    }
}
