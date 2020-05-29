package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.HabboUserBadgesMessageParser;

    public class UserBadgesEvent extends MessageEvent implements IMessageEvent 
    {
        public function UserBadgesEvent(k:Function)
        {
            super(k, HabboUserBadgesMessageParser);
        }

        public function get badges():Array
        {
            return (_parser as HabboUserBadgesMessageParser).badges;
        }

        public function get userId():int
        {
            return (_parser as HabboUserBadgesMessageParser).userId;
        }
    }
}
