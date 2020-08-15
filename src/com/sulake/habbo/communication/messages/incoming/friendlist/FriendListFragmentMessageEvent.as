package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendsListFragmentMessageParser;

    public class FriendListFragmentMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function FriendListFragmentMessageEvent(k:Function)
        {
            super(k, FriendsListFragmentMessageParser);
        }

        public function getParser():FriendsListFragmentMessageParser
        {
            return this._parser as FriendsListFragmentMessageParser;
        }
    }
}
