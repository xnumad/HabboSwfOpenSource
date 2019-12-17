package com.sulake.habbo.communication.messages.incoming._Str_447
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_449._Str_8993;

    public class _Str_9151 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9151(k:Function)
        {
            super(k, _Str_8993);
        }

        public function getParser():_Str_8993
        {
            return _parser as _Str_8993;
        }
    }
}
