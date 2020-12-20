package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionErrorMessageParser;

    public class GuideSessionErrorMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideSessionErrorMessageEvent(k:Function)
        {
            super(k, GuideSessionErrorMessageParser);
        }

        public function getParser():GuideSessionErrorMessageParser
        {
            return _parser as GuideSessionErrorMessageParser;
        }
    }
}
