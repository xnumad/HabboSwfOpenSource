package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayPlaylistsMessageParser;

    public class YoutubeDisplayPlaylistsEvent extends MessageEvent 
    {
        public function YoutubeDisplayPlaylistsEvent(k:Function)
        {
            super(k, YoutubeDisplayPlaylistsMessageParser);
        }

        public function getParser():YoutubeDisplayPlaylistsMessageParser
        {
            return parser as YoutubeDisplayPlaylistsMessageParser;
        }
    }
}
