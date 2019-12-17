package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_6668;

    public class _Str_7472 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7472(k:Function)
        {
            super(k, _Str_6668);
        }

        public function getParser():_Str_6668
        {
            return _Str_6668(_parser);
        }
    }
}
