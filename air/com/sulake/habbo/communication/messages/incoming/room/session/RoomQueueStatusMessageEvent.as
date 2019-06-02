//com.sulake.habbo.communication.messages.incoming.room.session.RoomQueueStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomQueueStatusMessageParser;

    [SecureSWF(rename="true")]
    public class RoomQueueStatusMessageEvent extends MessageEvent {

        public function RoomQueueStatusMessageEvent(k:Function);

        public function getParser():RoomQueueStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

