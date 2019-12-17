package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_8082;

    public class _Str_5843 extends MessageEvent 
    {
        public function _Str_5843(k:Function)
        {
            super(k, _Str_8082);
        }

        public function getParser():_Str_8082
        {
            return _parser as _Str_8082;
        }
    }
}
