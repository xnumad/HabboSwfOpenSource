package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GroupMembershipRequestedMessageParser;

    public class _Str_7472 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7472(k:Function)
        {
            super(k, GroupMembershipRequestedMessageParser);
        }

        public function getParser():GroupMembershipRequestedMessageParser
        {
            return GroupMembershipRequestedMessageParser(_parser);
        }
    }
}
