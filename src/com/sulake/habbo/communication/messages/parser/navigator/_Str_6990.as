package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6990 implements IMessageParser 
    {
        private var _rating:int;
        private var _Str_10405:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._rating = k.readInteger();
            this._Str_10405 = k.readBoolean();
            return true;
        }

        public function get rating():int
        {
            return this._rating;
        }

        public function get _Str_5090():Boolean
        {
            return this._Str_10405;
        }
    }
}
