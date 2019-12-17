package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8274;

    public class _Str_8033 extends MessageEvent 
    {
        public function _Str_8033(k:Function)
        {
            super(k, _Str_8274);
        }

        public function getParser():_Str_8274
        {
            return parser as _Str_8274;
        }
    }
}
