package com.sulake.habbo.communication.messages.parser.game.directory
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9392 implements IMessageParser 
    {
        public static const _Str_20087:int = 1;
        public static const DUPLICATE_MACHINEID:int = 2;
        public static const _Str_20332:int = 3;
        public static const _Str_20127:int = 4;
        public static const _Str_20854:int = 5;
        public static const _Str_19299:int = 6;
        public static const _Str_20717:int = 7;
        public static const _Str_20576:int = 8;

        private var _reason:int;


        public function get reason():int
        {
            return this._reason;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._reason = k.readInteger();
            return true;
        }
    }
}
