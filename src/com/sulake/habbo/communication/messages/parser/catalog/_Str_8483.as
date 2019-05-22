package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8483 implements IMessageParser 
    {
        private var _Str_2507:int;
        private var _Str_21271:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2507 = k.readInteger();
            this._Str_21271 = k.readBoolean();
            return true;
        }

        public function get offerId():int
        {
            return this._Str_2507;
        }

        public function get _Str_18028():Boolean
        {
            return this._Str_21271;
        }
    }
}
