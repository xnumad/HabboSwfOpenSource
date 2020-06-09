package com.sulake.habbo.communication.messages.incoming.inventory.badges
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeReceivedParser;

    public class BadgeReceivedEvent extends MessageEvent
    {
        public function BadgeReceivedEvent(k:Function)
        {
            super(k, BadgeReceivedParser);
        }

        public function getParser():BadgeReceivedParser
        {
            return _parser as BadgeReceivedParser;
        }
    }
}
