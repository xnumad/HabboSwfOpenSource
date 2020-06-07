package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftInfoParser;

    public class ClubGiftInfoEvent extends MessageEvent implements IMessageEvent
    {
        public function ClubGiftInfoEvent(k:Function)
        {
            super(k, ClubGiftInfoParser);
        }

        public function getParser():ClubGiftInfoParser
        {
            return this._parser as ClubGiftInfoParser;
        }
    }
}
