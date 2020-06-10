package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CanCreateRoomMessageParser implements IMessageParser
    {
        public static const _Str_21199:int = 0;
        public static const _Str_21069:int = 1;

        private var _resultCode:int;
        private var _Str_21340:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._resultCode = k.readInteger();
            this._Str_21340 = k.readInteger();
            return true;
        }

        public function get resultCode():int
        {
            return this._resultCode;
        }

        public function get _Str_20396():int
        {
            return this._Str_21340;
        }
    }
}
