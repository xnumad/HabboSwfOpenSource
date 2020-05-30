package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.YouArePlayingGameMessageParser;

    public class YouArePlayingGameMessageEvent extends MessageEvent
    {
        public function YouArePlayingGameMessageEvent(k:Function)
        {
            super(k, YouArePlayingGameMessageParser);
        }

        public function getParser():YouArePlayingGameMessageParser
        {
            return _parser as YouArePlayingGameMessageParser;
        }
    }
}
