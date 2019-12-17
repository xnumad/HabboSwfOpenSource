package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_9101;

    public class _Str_18296 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_18296(k:Function)
        {
            super(k, _Str_9101);
        }

        public function getParser():_Str_9101
        {
            return _parser as _Str_9101;
        }
    }
}
