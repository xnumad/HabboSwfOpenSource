package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_434._Str_7318;

    public class _Str_5376 extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_16635:int = 1;
        public static const _Str_14635:int = 2;
        public static const _Str_16908:int = 3;

        public function _Str_5376(k:Function)
        {
            super(k, _Str_7318);
        }

        public function _Str_2273():_Str_7318
        {
            return _parser as _Str_7318;
        }
    }
}
