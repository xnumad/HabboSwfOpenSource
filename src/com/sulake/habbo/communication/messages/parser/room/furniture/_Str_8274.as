package com.sulake.habbo.communication.messages.parser.room.furniture
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8274 implements IMessageParser 
    {
        private var _Str_6673:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_6673 = k.readInteger();
            return true;
        }

        public function get expiryTime():int
        {
            return this._Str_6673;
        }
    }
}
