package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.FriendNotificationMessageParser;

    public class _Str_8552 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8552(k:Function)
        {
            super(k, FriendNotificationMessageParser);
        }

        public function getParser():FriendNotificationMessageParser
        {
            return _parser as FriendNotificationMessageParser;
        }
    }
}
