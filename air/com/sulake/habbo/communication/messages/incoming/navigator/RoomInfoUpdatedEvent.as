//com.sulake.habbo.communication.messages.incoming.navigator.RoomInfoUpdatedEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomInfoUpdatedMessageParser;

    [SecureSWF(rename="true")]
    public class RoomInfoUpdatedEvent extends MessageEvent implements IMessageEvent {

        public function RoomInfoUpdatedEvent(k:Function);

        public function getParser():RoomInfoUpdatedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

