package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.AcceptFriendResultMessageParser;

    public class AcceptFriendResultEvent extends MessageEvent implements IMessageEvent
    {
        public function AcceptFriendResultEvent(k:Function)
        {
            super(k, AcceptFriendResultMessageParser);
        }

        public function getParser():AcceptFriendResultMessageParser
        {
            return this._parser as AcceptFriendResultMessageParser;
        }
    }
}
