package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6537;

    public class _Str_6232 extends MessageEvent implements IMessageEvent 
    {
        public static var _Str_5797:int = 0;
        public static var _Str_7005:int = 1;
        public static var _Str_7389:int = 2;
        public static var _Str_7137:int = 3;
        public static var _Str_7836:int = 4;
        public static var _Str_7721:int = 5;

        public function _Str_6232(k:Function)
        {
            super(k, _Str_6537);
        }

        public function getParser():_Str_6537
        {
            return _parser as _Str_6537;
        }
    }
}
