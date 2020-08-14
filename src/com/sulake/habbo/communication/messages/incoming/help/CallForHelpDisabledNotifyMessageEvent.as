package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpDisabledNotifyMessageParser;

    public class CallForHelpDisabledNotifyMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function CallForHelpDisabledNotifyMessageEvent(k:Function)
        {
            super(k, CallForHelpDisabledNotifyMessageParser);
        }

        public function getParser():CallForHelpDisabledNotifyMessageParser
        {
            return _parser as CallForHelpDisabledNotifyMessageParser;
        }
    }
}
