//com.sulake.habbo.communication.messages.incoming.room.session.RoomForwardMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomForwardMessageParser;

    [SecureSWF(rename="true")]
    public class RoomForwardMessageEvent extends MessageEvent {

        public function RoomForwardMessageEvent(k:Function);

        public function getParser():RoomForwardMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

