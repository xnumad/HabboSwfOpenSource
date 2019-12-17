package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionDetachedMessageParser;

    public class GuideSessionDetachedEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionDetachedEvent(k:Function)
        {
            super(k, GuideSessionDetachedMessageParser);
        }

        public function getParser():GuideSessionDetachedMessageParser
        {
            return _parser as GuideSessionDetachedMessageParser;
        }
    }
}
