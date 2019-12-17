package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5762;

    public class _Str_4265 extends MessageEvent 
    {
        public function _Str_4265(k:Function)
        {
            super(k, _Str_5762);
        }

        public function getParser():_Str_5762
        {
            return _parser as _Str_5762;
        }
    }
}
