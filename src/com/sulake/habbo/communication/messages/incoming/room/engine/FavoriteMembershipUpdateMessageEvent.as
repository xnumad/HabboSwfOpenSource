package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FavouriteMembershipUpdateMessageParser;

    public class FavoriteMembershipUpdateMessageEvent extends MessageEvent
    {
        public function FavoriteMembershipUpdateMessageEvent(k:Function)
        {
            super(k, FavouriteMembershipUpdateMessageParser);
        }

        public function getParser():FavouriteMembershipUpdateMessageParser
        {
            return _parser as FavouriteMembershipUpdateMessageParser;
        }
    }
}
