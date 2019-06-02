//com.sulake.habbo.communication.messages.incoming.room.engine.RoomPropertyMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomPropertyMessageParser;

    [SecureSWF(rename="true")]
    public class RoomPropertyMessageEvent extends MessageEvent {

        public function RoomPropertyMessageEvent(k:Function);

        public function getParser():RoomPropertyMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

