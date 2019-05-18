package com.sulake.habbo.communication.messages.incoming._Str_329
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _Str_434._Str_7846;

    public class _Str_7079 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7079(k:Function)
        {
            super(k, _Str_7846);
        }

        public function _Str_2273():_Str_7846
        {
            return _parser as _Str_7846;
        }
    }
}
