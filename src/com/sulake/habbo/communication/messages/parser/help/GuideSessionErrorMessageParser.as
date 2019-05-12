package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionErrorMessageParser implements IMessageParser 
    {
        public static const _Str_21105:int = 0;
        public static const _Str_18013:int = 1;
        public static const _Str_17457:int = 2;
        public static const _Str_18342:int = 3;
        public static const _Str_21172:int = 4;

        private var _errorCode:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._errorCode = k.readInteger();
            return true;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }
    }
}
