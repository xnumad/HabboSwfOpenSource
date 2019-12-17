package com.sulake.habbo.communication.messages.incoming._Str_89
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions._Str_8433;

    public class _Str_5266 extends MessageEvent 
    {
        public function _Str_5266(k:Function)
        {
            super(k, _Str_8433);
        }

        public function getParser():_Str_8433
        {
            return _parser as _Str_8433;
        }
    }
}
