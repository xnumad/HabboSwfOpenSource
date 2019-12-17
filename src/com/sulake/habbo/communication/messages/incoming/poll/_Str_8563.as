package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7270;

    public class _Str_8563 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8563(k:Function)
        {
            super(k, _Str_7270);
        }

        public function getParser():_Str_7270
        {
            return _parser as _Str_7270;
        }
    }
}
