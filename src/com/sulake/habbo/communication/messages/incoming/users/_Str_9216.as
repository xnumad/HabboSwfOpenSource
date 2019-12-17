package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_7942;

    public class _Str_9216 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9216(k:Function)
        {
            super(k, _Str_7942);
        }

        public function getParser():_Str_7942
        {
            return _parser as _Str_7942;
        }
    }
}
