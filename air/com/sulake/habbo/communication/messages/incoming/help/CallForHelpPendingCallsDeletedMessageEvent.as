//com.sulake.habbo.communication.messages.incoming.help.CallForHelpPendingCallsDeletedMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsDeletedMessageParser;

    [SecureSWF(rename="true")]
    public class CallForHelpPendingCallsDeletedMessageEvent extends MessageEvent implements IMessageEvent {

        public function CallForHelpPendingCallsDeletedMessageEvent(k:Function);

        public function getParser():CallForHelpPendingCallsDeletedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

