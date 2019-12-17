package com.sulake.habbo.communication.messages.incoming._Str_446
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.layout._Str_6361;

    public class _Str_6566 extends MessageEvent 
    {
        public function _Str_6566(k:Function)
        {
            super(k, _Str_6361);
        }

        public function getParser():_Str_6361
        {
            return _parser as _Str_6361;
        }
    }
}
