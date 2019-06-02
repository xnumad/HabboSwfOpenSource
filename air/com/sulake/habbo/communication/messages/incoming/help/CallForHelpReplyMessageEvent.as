//com.sulake.habbo.communication.messages.incoming.help.CallForHelpReplyMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpReplyMessageParser;

    [SecureSWF(rename="true")]
    public class CallForHelpReplyMessageEvent extends MessageEvent implements IMessageEvent {

        public function CallForHelpReplyMessageEvent(k:Function);

        public function getParser():CallForHelpReplyMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

