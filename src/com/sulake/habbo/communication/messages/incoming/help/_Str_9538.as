package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_9027;

    public class _Str_9538 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9538(k:Function)
        {
            super(k, _Str_9027);
        }

        public function getParser():_Str_9027
        {
            return _parser as _Str_9027;
        }
    }
}
