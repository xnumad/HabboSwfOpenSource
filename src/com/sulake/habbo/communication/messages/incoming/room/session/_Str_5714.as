package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_8543;

    public class _Str_5714 extends MessageEvent 
    {
        public function _Str_5714(k:Function)
        {
            super(k, _Str_8543);
        }

        public function getParser():_Str_8543
        {
            return _parser as _Str_8543;
        }
    }
}
