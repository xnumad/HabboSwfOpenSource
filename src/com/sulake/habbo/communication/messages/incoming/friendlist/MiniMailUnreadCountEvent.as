package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MiniMailUnreadCountMessageParser;

    public class MiniMailUnreadCountEvent extends MessageEvent implements IMessageEvent
    {
        public function MiniMailUnreadCountEvent(k:Function)
        {
            super(k, MiniMailUnreadCountMessageParser);
        }

        public function getParser():MiniMailUnreadCountMessageParser
        {
            return _parser as MiniMailUnreadCountMessageParser;
        }
    }
}
