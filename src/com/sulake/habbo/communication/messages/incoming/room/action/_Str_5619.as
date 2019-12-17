package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6731;

    public class _Str_5619 extends MessageEvent 
    {
        public function _Str_5619(k:Function)
        {
            super(k, _Str_6731);
        }

        public function getParser():_Str_6731
        {
            return _parser as _Str_6731;
        }
    }
}
