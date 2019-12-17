package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_6830;

    public class _Str_5834 extends MessageEvent 
    {
        public function _Str_5834(k:Function)
        {
            super(k, _Str_6830);
        }

        public function getParser():_Str_6830
        {
            return _parser as _Str_6830;
        }
    }
}
