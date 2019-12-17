package com.sulake.habbo.communication.messages.incoming._Str_451
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendfurni._Str_9391;

    public class _Str_8413 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8413(k:Function)
        {
            super(k, _Str_9391);
        }

        public function getParser():_Str_9391
        {
            return _parser as _Str_9391;
        }
    }
}
