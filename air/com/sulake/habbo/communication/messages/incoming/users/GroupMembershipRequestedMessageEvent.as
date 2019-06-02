//com.sulake.habbo.communication.messages.incoming.users.GroupMembershipRequestedMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GroupMembershipRequestedMessageParser;

    [SecureSWF(rename="true")]
    public class GroupMembershipRequestedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GroupMembershipRequestedMessageEvent(k:Function);

        public function getParser():GroupMembershipRequestedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

