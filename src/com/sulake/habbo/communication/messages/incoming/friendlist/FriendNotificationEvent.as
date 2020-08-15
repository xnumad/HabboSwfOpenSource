package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendNotificationMessageParser;

    public class FriendNotificationEvent extends MessageEvent implements IMessageEvent
    {
        public function FriendNotificationEvent(k:Function)
        {
            super(k, FriendNotificationMessageParser);
        }

        public function getParser():FriendNotificationMessageParser
        {
            return _parser as FriendNotificationMessageParser;
        }
    }
}
