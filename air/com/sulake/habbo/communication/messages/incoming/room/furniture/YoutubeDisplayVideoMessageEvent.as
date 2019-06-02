//com.sulake.habbo.communication.messages.incoming.room.furniture.YoutubeDisplayVideoMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.YoutubeDisplayVideoMessageParser;

    public class YoutubeDisplayVideoMessageEvent extends MessageEvent {

        public function YoutubeDisplayVideoMessageEvent(k:Function);

        public function getParser():YoutubeDisplayVideoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

