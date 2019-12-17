package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_6864;

    public class _Str_7743 extends MessageEvent 
    {
        public function _Str_7743(k:Function)
        {
            super(k, _Str_6864);
        }

        public function getParser():_Str_6864
        {
            return _parser as _Str_6864;
        }
    }
}
