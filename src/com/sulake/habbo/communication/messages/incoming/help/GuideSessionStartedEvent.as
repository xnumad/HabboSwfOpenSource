package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser;

    public class GuideSessionStartedEvent extends MessageEvent implements IMessageEvent 
    {
        public function GuideSessionStartedEvent(k:Function)
        {
            super(k, GuideSessionStartedMessageParser);
        }

        public function _Str_2273():GuideSessionStartedMessageParser
        {
            return _parser as GuideSessionStartedMessageParser;
        }
    }
}
