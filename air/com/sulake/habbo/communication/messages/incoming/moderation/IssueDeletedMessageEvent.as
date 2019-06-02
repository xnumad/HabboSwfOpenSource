//com.sulake.habbo.communication.messages.incoming.moderation.IssueDeletedMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueDeletedMessageParser;

    [SecureSWF(rename="true")]
    public class IssueDeletedMessageEvent extends MessageEvent implements IMessageEvent {

        public function IssueDeletedMessageEvent(k:Function);

        public function getParser():IssueDeletedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

