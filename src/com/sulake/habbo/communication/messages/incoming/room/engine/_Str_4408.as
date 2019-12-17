package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_5317;

    public class _Str_4408 extends MessageEvent 
    {
        public function _Str_4408(k:Function)
        {
            super(k, _Str_5317);
        }

        public function getParser():_Str_5317
        {
            return _parser as _Str_5317;
        }
    }
}
