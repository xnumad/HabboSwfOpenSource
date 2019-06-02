//com.sulake.habbo.communication.messages.incoming.room.engine.RoomEntryInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;

    [SecureSWF(rename="true")]
    public class RoomEntryInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function RoomEntryInfoMessageEvent(k:Function);

        public function getParser():RoomEntryInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

