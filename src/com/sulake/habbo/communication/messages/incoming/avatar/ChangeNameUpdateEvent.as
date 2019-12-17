package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6553;

    public class ChangeNameUpdateEvent extends MessageEvent implements IMessageEvent 
    {
        public static var _Str_5797:int = 0;
        public static var _Str_7005:int = 1;
        public static var _Str_7389:int = 2;
        public static var _Str_7137:int = 3;
        public static var _Str_7836:int = 4;
        public static var _Str_7721:int = 5;
        public static var _Str_8620:int = 6;
        public static var _Str_9429:int = 7;

        public function ChangeNameUpdateEvent(k:Function)
        {
            super(k, _Str_6553);
        }

        public function getParser():_Str_6553
        {
            return _parser as _Str_6553;
        }
    }
}
