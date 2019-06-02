//com.sulake.habbo.communication.messages.incoming.room.furniture.YoutubeDisplayPlaylistsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayPlaylistsMessageParser;

    public class YoutubeDisplayPlaylistsMessageEvent extends MessageEvent {

        public function YoutubeDisplayPlaylistsMessageEvent(k:Function);

        public function getParser():YoutubeDisplayPlaylistsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

