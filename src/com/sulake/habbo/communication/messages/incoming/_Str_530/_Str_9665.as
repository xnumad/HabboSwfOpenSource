package com.sulake.habbo.communication.messages.incoming._Str_530
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_539._Str_8895;

    public class _Str_9665 extends MessageEvent 
    {
        public function _Str_9665(k:Function)
        {
            super(k, _Str_8895);
        }

        public function getParser():_Str_8895
        {
            return _parser as _Str_8895;
        }
    }
}
