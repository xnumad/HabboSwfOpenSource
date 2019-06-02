package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7002 implements IMessageParser 
    {
        private var _Str_7066:int;
        private var _Str_8048:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_7066 = k.readInteger();
            this._Str_8048 = k.readInteger();
            return true;
        }

        public function get homeRoomId():int
        {
            return this._Str_7066;
        }

        public function get _Str_17213():int
        {
            return this._Str_8048;
        }
    }
}
