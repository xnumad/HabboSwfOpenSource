//com.sulake.habbo.communication.messages.incoming.help.IssueCloseNotificationMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.IssueCloseNotificationMessageParser;

    [SecureSWF(rename="true")]
    public class IssueCloseNotificationMessageEvent extends MessageEvent implements IMessageEvent {

        public function IssueCloseNotificationMessageEvent(k:Function);

        public function getParser():IssueCloseNotificationMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

