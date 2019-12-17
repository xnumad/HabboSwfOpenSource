package com.sulake.habbo.communication.messages.incoming._Str_89
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions._Str_8378;

    public class _Str_7845 extends MessageEvent 
    {
        public function _Str_7845(k:Function)
        {
            super(k, _Str_8378);
        }

        public function getParser():_Str_8378
        {
            return _parser as _Str_8378;
        }
    }
}
