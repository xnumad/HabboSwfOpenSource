package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_7337;

    public class _Str_6584 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6584(k:Function)
        {
            super(k, _Str_7337);
        }

        public function getParser():_Str_7337
        {
            return _Str_7337(_parser);
        }
    }
}
