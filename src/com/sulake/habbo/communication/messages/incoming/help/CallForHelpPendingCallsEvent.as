package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsMessageParser;

    public class CallForHelpPendingCallsEvent extends MessageEvent implements IMessageEvent 
    {
        public function CallForHelpPendingCallsEvent(k:Function)
        {
            super(k, CallForHelpPendingCallsMessageParser);
        }

        public function getParser():CallForHelpPendingCallsMessageParser
        {
            return _parser as CallForHelpPendingCallsMessageParser;
        }
    }
}
