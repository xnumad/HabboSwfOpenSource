package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionAttachedParser;

    public class GuideSessionAttachedEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionAttachedEvent(k:Function)
        {
            super(k, GuideSessionAttachedParser);
        }

        public function getParser():GuideSessionAttachedParser
        {
            return _parser as GuideSessionAttachedParser;
        }
    }
}
