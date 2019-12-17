package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_5731;

    public class _Str_9074 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9074(k:Function)
        {
            super(k, _Str_5731);
        }

        public function getParser():_Str_5731
        {
            return _parser as _Str_5731;
        }
    }
}
