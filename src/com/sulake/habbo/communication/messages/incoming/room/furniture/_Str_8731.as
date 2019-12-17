package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8063;

    public class _Str_8731 extends MessageEvent 
    {
        public function _Str_8731(k:Function)
        {
            super(k, _Str_8063);
        }

        public function getParser():_Str_8063
        {
            return parser as _Str_8063;
        }
    }
}
