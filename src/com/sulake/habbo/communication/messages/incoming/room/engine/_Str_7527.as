package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_7802;

    public class _Str_7527 extends MessageEvent 
    {
        public function _Str_7527(k:Function)
        {
            super(k, _Str_7802);
        }

        public function getParser():_Str_7802
        {
            return _parser as _Str_7802;
        }
    }
}
