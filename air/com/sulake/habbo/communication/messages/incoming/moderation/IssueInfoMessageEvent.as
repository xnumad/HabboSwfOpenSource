//com.sulake.habbo.communication.messages.incoming.moderation.IssueInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.IssueInfoMessageParser;

    [SecureSWF(rename="true")]
    public class IssueInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function IssueInfoMessageEvent(k:Function);

        public function getParser():IssueInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

