//com.sulake.habbo.communication.messages.parser.users.GroupMembershipRequestedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.MemberData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GroupMembershipRequestedMessageParser implements IMessageParser {

        private var _groupId:int;
        private var _requester:MemberData;

        public function GroupMembershipRequestedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get groupId():int;

        public function get requester():MemberData;


    }
}//package com.sulake.habbo.communication.messages.parser.users

