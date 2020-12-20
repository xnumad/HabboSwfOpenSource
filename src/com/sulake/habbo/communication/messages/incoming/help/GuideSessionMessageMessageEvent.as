package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionMessageMessageParser;

    public class GuideSessionMessageMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuideSessionMessageMessageEvent(k:Function)
        {
            super(k, GuideSessionMessageMessageParser);
        }

        public function getParser():GuideSessionMessageMessageParser
        {
            return _parser as GuideSessionMessageMessageParser;
        }
    }
}
