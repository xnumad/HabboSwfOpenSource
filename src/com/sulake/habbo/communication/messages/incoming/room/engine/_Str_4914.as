package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6367;

    public class _Str_4914 extends MessageEvent 
    {
        public function _Str_4914(k:Function)
        {
            super(k, _Str_6367);
        }

        public function getParser():_Str_6367
        {
            return _parser as _Str_6367;
        }
    }
}
