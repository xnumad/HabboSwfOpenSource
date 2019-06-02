//com.sulake.habbo.communication.messages.incoming.room.session.YouAreSpectatorMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.YouAreSpectatorMessageParser;

    [SecureSWF(rename="true")]
    public class YouAreSpectatorMessageEvent extends MessageEvent {

        public function YouAreSpectatorMessageEvent(k:Function);

        public function getParser():YouAreSpectatorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

