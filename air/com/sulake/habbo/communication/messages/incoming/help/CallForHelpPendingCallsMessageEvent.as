//com.sulake.habbo.communication.messages.incoming.help.CallForHelpPendingCallsMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsMessageParser;

    [SecureSWF(rename="true")]
    public class CallForHelpPendingCallsMessageEvent extends MessageEvent implements IMessageEvent {

        public function CallForHelpPendingCallsMessageEvent(k:Function);

        public function getParser():CallForHelpPendingCallsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

