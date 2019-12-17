package com.sulake.habbo.communication.messages.parser._Str_449
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8993 implements IMessageParser 
    {
        private var _Str_3145:int;
        private var _Str_8208:int;


        public function get _Str_3278():int
        {
            return this._Str_3145;
        }

        public function get _Str_17328():int
        {
            return this._Str_8208;
        }

        public function flush():Boolean
        {
            this._Str_3145 = -1;
            this._Str_8208 = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_3145 = k.readInteger();
            this._Str_8208 = k.readInteger();
            return true;
        }
    }
}
