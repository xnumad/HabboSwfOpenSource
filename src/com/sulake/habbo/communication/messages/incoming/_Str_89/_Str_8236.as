package com.sulake.habbo.communication.messages.incoming._Str_89
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.permissions._Str_9143;

    public class _Str_8236 extends MessageEvent 
    {
        public function _Str_8236(k:Function)
        {
            super(k, _Str_9143);
        }

        public function getParser():_Str_9143
        {
            return _parser as _Str_9143;
        }
    }
}
