//com.sulake.habbo.communication.messages.incoming.moderation.IssuePickFailedMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssuePickFailedMessageParser;

    [SecureSWF(rename="true")]
    public class IssuePickFailedMessageEvent extends MessageEvent implements IMessageEvent {

        public function IssuePickFailedMessageEvent(k:Function);

        public function getParser():IssuePickFailedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

