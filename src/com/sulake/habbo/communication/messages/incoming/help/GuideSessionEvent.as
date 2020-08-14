package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionMessageMessageParser;

    public class GuideSessionEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionEvent(k:Function)
        {
            super(k, GuideSessionMessageMessageParser);
        }

        public function getParser():GuideSessionMessageMessageParser
        {
            return _parser as GuideSessionMessageMessageParser;
        }
    }
}
