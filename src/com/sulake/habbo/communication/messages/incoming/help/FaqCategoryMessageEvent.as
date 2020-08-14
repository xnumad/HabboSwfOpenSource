package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.FaqCategoryMessageParser;

    public class FaqCategoryMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FaqCategoryMessageEvent(k:Function)
        {
            super(k, FaqCategoryMessageParser);
        }

        public function getParser():FaqCategoryMessageParser
        {
            return _parser as FaqCategoryMessageParser;
        }
    }
}
