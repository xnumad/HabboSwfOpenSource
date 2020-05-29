package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildCreatedMessageParser;

    public class GuildCreatedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuildCreatedMessageEvent(k:Function)
        {
            super(k, GuildCreatedMessageParser);
        }

        public function get baseRoomId():int
        {
            return GuildCreatedMessageParser(_parser).baseRoomId;
        }

        public function get groupId():int
        {
            return GuildCreatedMessageParser(_parser).groupId;
        }
    }
}
