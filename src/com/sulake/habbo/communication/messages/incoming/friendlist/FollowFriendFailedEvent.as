package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FollowFriendFailedMessageParser;

    public class FollowFriendFailedEvent extends MessageEvent implements IMessageEvent
    {
        public function FollowFriendFailedEvent(k:Function)
        {
            super(k, FollowFriendFailedMessageParser);
        }

        public function getParser():FollowFriendFailedMessageParser
        {
            return this._parser as FollowFriendFailedMessageParser;
        }
    }
}
