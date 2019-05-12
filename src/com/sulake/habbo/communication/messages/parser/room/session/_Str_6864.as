package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6864 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _value:int = 0;


        public function get userId():int
        {
            return this._userId;
        }

        public function get value():int
        {
            return this._value;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            this._value = k.readInteger();
            return true;
        }
    }
}
