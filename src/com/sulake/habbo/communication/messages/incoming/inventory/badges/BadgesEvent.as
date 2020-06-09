package com.sulake.habbo.communication.messages.incoming.inventory.badges
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser;

    public class BadgesEvent extends MessageEvent
    {
        public function BadgesEvent(k:Function)
        {
            super(k, BadgesParser);
        }

        public function getParser():BadgesParser
        {
            return _parser as BadgesParser;
        }
    }
}
