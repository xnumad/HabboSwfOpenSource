package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7512;

    public class _Str_7999 extends MessageEvent 
    {
        public function _Str_7999(k:Function)
        {
            super(k, _Str_7512);
        }

        public function getParser():_Str_7512
        {
            return _parser as _Str_7512;
        }
    }
}
