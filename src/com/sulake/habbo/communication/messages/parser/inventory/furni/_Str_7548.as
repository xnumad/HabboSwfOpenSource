package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7548 implements IMessageParser 
    {
        private var _id:int;
        private var _Str_19661:int;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._id = k.readInteger();
            this._Str_19661 = k.readInteger();
            return true;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_23779():int
        {
            return this._Str_19661;
        }
    }
}
