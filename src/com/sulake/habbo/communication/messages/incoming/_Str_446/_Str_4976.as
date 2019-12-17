package com.sulake.habbo.communication.messages.incoming._Str_446
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.layout._Str_5770;

    public class _Str_4976 extends MessageEvent 
    {
        public function _Str_4976(k:Function)
        {
            super(k, _Str_5770);
        }

        public function getParser():_Str_5770
        {
            return _parser as _Str_5770;
        }
    }
}
