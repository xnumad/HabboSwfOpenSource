package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8229;

    public class _Str_7746 extends MessageEvent 
    {
        public function _Str_7746(k:Function)
        {
            super(k, _Str_8229);
        }

        public function getParser():_Str_8229
        {
            return parser as _Str_8229;
        }
    }
}
