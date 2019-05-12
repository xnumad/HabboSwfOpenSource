package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8568 implements IMessageParser 
    {
        private var _Str_20845:int = 0;


        public function get _Str_18555():int
        {
            return this._Str_20845;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_20845 = k.readInteger();
            return true;
        }
    }
}
