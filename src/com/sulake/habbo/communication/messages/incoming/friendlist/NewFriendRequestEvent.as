package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewFriendRequestMessageParser;

    public class NewFriendRequestEvent extends MessageEvent implements IMessageEvent
    {
        public function NewFriendRequestEvent(k:Function)
        {
            super(k, NewFriendRequestMessageParser);
        }

        public function getParser():NewFriendRequestMessageParser
        {
            return this._parser as NewFriendRequestMessageParser;
        }
    }
}
