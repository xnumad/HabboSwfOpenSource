//com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.session{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;

    [SecureSWF(rename="true")]
    public class RoomReadyMessageEvent extends MessageEvent implements IMessageEvent {

        public function RoomReadyMessageEvent(k:Function);

        public function getParser():RoomReadyMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.session

