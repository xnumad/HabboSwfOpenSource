package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7918;

    public class _Str_8234 extends MessageEvent 
    {
        public function _Str_8234(k:Function)
        {
            super(k, _Str_7918);
        }

        public function getParser():_Str_7918
        {
            return _parser as _Str_7918;
        }
    }
}
