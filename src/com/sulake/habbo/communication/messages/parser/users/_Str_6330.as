package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6330 implements IMessageParser 
    {
        private var _Str_17150:int = -1;
        private var _Str_17360:int = 0;


        public function get _Str_16798():int
        {
            return this._Str_17150;
        }

        public function get _Str_17975():int
        {
            return this._Str_17360;
        }

        public function flush():Boolean
        {
            this._Str_17150 = -1;
            this._Str_17360 = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_17150 = k.readInteger();
            this._Str_17360 = k.readInteger();
            return true;
        }
    }
}
