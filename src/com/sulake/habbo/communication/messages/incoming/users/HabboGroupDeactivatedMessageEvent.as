package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.HabboGroupDeactivatedMessageParser;

    public class HabboGroupDeactivatedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function HabboGroupDeactivatedMessageEvent(k:Function)
        {
            super(k, HabboGroupDeactivatedMessageParser);
        }

        public function get groupId():int
        {
            return HabboGroupDeactivatedMessageParser(_parser).groupId;
        }
    }
}
