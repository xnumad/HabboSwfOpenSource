package com.sulake.habbo.communication.messages.incoming._Str_525
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_521._Str_7418;

    public class _Str_8083 extends MessageEvent 
    {
        public function _Str_8083(k:Function)
        {
            super(k, _Str_7418);
        }

        public function getParser():_Str_7418
        {
            return _parser as _Str_7418;
        }
    }
}
