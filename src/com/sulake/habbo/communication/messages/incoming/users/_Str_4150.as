package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_5856;

    public class _Str_4150 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4150(k:Function)
        {
            super(k, _Str_5856);
        }

        public function getParser():_Str_5856
        {
            return _parser as _Str_5856;
        }
    }
}
