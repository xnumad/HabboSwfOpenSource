package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.InClientLinkMessageParser;

    public class InClientLinkMessageEvent extends MessageEvent implements IMessageEvent
    {
        public function InClientLinkMessageEvent(k:Function)
        {
            super(k, InClientLinkMessageParser);
        }

        public function get link():String
        {
            return (_parser as InClientLinkMessageParser).link;
        }
    }
}
