//com.sulake.habbo.communication.messages.incoming.navigator.RoomEventEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomEventMessageParser;

    [SecureSWF(rename="true")]
    public class RoomEventEvent extends MessageEvent implements IMessageEvent {

        public function RoomEventEvent(k:Function);

        public function getParser():RoomEventMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

