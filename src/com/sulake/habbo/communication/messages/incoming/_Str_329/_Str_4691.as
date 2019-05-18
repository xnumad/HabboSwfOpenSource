package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_434._Str_6542;

    public class _Str_4691 extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_15052:int = 1;
        public static const _Str_18717:int = 2;

        public function _Str_4691(k:Function)
        {
            super(k, _Str_6542);
        }

        public function _Str_2273():_Str_6542
        {
            return _parser as _Str_6542;
        }
    }
}
