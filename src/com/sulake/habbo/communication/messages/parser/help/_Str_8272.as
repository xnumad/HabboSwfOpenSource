package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8272 implements IMessageParser 
    {
        private static const _Str_15967:int = 0;
        private static const _Str_18979:int = 1;
        private static const _Str_18566:int = 2;
        private static const _Str_18164:int = 3;

        private var _result:int = -1;


        public function flush():Boolean
        {
            this._result = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._result = k.readInteger();
            return true;
        }

        public function get _Str_5961():String
        {
            switch (this._result)
            {
                case _Str_15967:
                    return "sent";
                case _Str_18979:
                    return "blocked";
                case _Str_18566:
                    return "nochat";
                case _Str_18164:
                    return "alreadyreported";
                default:
                    return "invalid";
            }
        }
    }
}
