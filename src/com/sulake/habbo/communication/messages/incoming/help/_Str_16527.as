package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqTextMessageParser;

    public class _Str_16527 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16527(k:Function)
        {
            super(k, FaqTextMessageParser);
        }

        public function getParser():FaqTextMessageParser
        {
            return _parser as FaqTextMessageParser;
        }
    }
}
