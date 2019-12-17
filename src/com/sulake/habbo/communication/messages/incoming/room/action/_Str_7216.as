package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_7555;

    public class _Str_7216 extends MessageEvent 
    {
        public function _Str_7216(k:Function)
        {
            super(k, _Str_7555);
        }

        public function getParser():_Str_7555
        {
            return _parser as _Str_7555;
        }
    }
}
