package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7164 implements IMessageParser 
    {
        private var _amount:int = 0;
        private var _change:int = 0;
        private var _type:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._amount = k.readInteger();
            this._change = k.readInteger();
            this._type = k.readInteger();
            return true;
        }

        public function get amount():int
        {
            return this._amount;
        }

        public function get change():int
        {
            return this._change;
        }

        public function get type():int
        {
            return this._type;
        }
    }
}
