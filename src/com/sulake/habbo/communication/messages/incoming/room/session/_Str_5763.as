package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_4184;

    public class _Str_5763 extends MessageEvent 
    {
        public function _Str_5763(k:Function)
        {
            super(k, _Str_4184);
        }

        public function getParser():_Str_4184
        {
            return _parser as _Str_4184;
        }
    }
}
