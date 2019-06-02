//com.sulake.habbo.communication.messages.incoming.room.furniture.RoomDimmerPresetsMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RoomDimmerPresetsMessageParser;

    [SecureSWF(rename="true")]
    public class RoomDimmerPresetsMessageEvent extends MessageEvent {

        public function RoomDimmerPresetsMessageEvent(k:Function);

        public function getParser():RoomDimmerPresetsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

