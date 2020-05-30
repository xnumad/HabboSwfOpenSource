package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftSelectedParser;

    public class ClubGiftSelectedEvent extends MessageEvent implements IMessageEvent
    {
        public function ClubGiftSelectedEvent(k:Function)
        {
            super(k, ClubGiftSelectedParser);
        }

        public function getParser():ClubGiftSelectedParser
        {
            return this._parser as ClubGiftSelectedParser;
        }
    }
}
