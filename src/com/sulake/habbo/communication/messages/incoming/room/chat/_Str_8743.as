package com.sulake.habbo.communication.messages.incoming.room.chat
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.chat._Str_6399;

    public class _Str_8743 extends MessageEvent 
    {
        public function _Str_8743(k:Function)
        {
            super(k, _Str_6399);
        }

        public function getParser():_Str_6399
        {
            return _parser as _Str_6399;
        }
    }
}
