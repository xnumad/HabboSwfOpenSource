package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6347;

    public class _Str_4196 extends MessageEvent 
    {
        public function _Str_4196(k:Function)
        {
            super(k, _Str_6347);
        }

        public function getParser():_Str_6347
        {
            return _parser as _Str_6347;
        }
    }
}
