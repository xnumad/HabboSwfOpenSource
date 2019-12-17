package com.sulake.habbo.communication.messages.incoming.newnavigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.newnavigator._Str_6991;

    public class _Str_8763 extends MessageEvent 
    {
        public function _Str_8763(k:Function)
        {
            super(k, _Str_6991);
        }

        public function getParser():_Str_6991
        {
            return parser as _Str_6991;
        }
    }
}
