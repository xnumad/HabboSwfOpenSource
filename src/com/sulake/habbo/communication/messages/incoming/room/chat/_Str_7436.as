package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_8185;

    public class _Str_7436 extends MessageEvent 
    {
        public function _Str_7436(k:Function)
        {
            super(k, _Str_8185);
        }

        public function getParser():_Str_8185
        {
            return _parser as _Str_8185;
        }
    }
}
