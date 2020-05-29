package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GroupDetailsChangedMessageParser;

    public class GroupDetailsChangedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GroupDetailsChangedMessageEvent(k:Function)
        {
            super(k, GroupDetailsChangedMessageParser);
        }

        public function get groupId():int
        {
            return GroupDetailsChangedMessageParser(_parser).groupId;
        }
    }
}
