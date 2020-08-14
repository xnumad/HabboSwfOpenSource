package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionAttachedMessageParser;

    public class GuideSessionAttachedEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionAttachedEvent(k:Function)
        {
            super(k, GuideSessionAttachedMessageParser);
        }

        public function getParser():GuideSessionAttachedMessageParser
        {
            return _parser as GuideSessionAttachedMessageParser;
        }
    }
}
