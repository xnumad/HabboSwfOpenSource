package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FindFriendsProcessResultMessageParser;

    public class FindFriendsProcessResultEvent extends MessageEvent implements IMessageEvent
    {
        public function FindFriendsProcessResultEvent(k:Function)
        {
            super(k, FindFriendsProcessResultMessageParser);
        }

        public function get success():Boolean
        {
            return FindFriendsProcessResultMessageParser(_parser).success;
        }
    }
}
