package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7466;

    public class _Str_8879 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8879(k:Function)
        {
            super(k, _Str_7466);
        }

        public function getParser():_Str_7466
        {
            return _parser as _Str_7466;
        }
    }
}
