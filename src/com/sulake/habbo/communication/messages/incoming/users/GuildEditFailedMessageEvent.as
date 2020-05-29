package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.GuildEditFailedMessageParser;

    public class GuildEditFailedMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function GuildEditFailedMessageEvent(k:Function)
        {
            super(k, GuildEditFailedMessageParser);
        }

        public function get reason():int
        {
            return GuildEditFailedMessageParser(_parser).reason;
        }
    }
}
