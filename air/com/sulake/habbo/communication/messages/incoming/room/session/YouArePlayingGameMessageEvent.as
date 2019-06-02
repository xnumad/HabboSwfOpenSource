//com.sulake.habbo.communication.messages.incoming.room.session.YouArePlayingGameMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.YouArePlayingGameMessageParser;

    [SecureSWF(rename="true")]
    public class YouArePlayingGameMessageEvent extends MessageEvent {

        public function YouArePlayingGameMessageEvent(k:Function);

        public function getParser():YouArePlayingGameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

