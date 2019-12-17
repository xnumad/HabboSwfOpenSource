package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6831;

    public class _Str_5948 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5948(k:Function)
        {
            super(k, _Str_6831);
        }

        public function getParser():_Str_6831
        {
            return _parser as _Str_6831;
        }
    }
}
