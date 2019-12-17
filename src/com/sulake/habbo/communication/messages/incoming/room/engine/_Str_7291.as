package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_8155;

    public class _Str_7291 extends MessageEvent 
    {
        public function _Str_7291(k:Function)
        {
            super(k, _Str_8155);
        }

        public function getParser():_Str_8155
        {
            return _parser as _Str_8155;
        }
    }
}
