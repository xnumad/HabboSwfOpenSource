package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_7187;

    public class _Str_8714 extends MessageEvent 
    {
        public function _Str_8714(k:Function)
        {
            super(k, _Str_7187);
        }

        public function getParser():_Str_7187
        {
            return _parser as _Str_7187;
        }
    }
}
