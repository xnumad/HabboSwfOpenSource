package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_9467;

    public class _Str_8292 extends MessageEvent 
    {
        public function _Str_8292(k:Function)
        {
            super(k, _Str_9467);
        }

        public function getParser():_Str_9467
        {
            return _parser as _Str_9467;
        }
    }
}
