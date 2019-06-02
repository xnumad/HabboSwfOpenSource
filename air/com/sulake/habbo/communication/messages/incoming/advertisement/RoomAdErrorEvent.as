//com.sulake.habbo.communication.messages.incoming.advertisement.RoomAdErrorEvent

package com.sulake.habbo.communication.messages.incoming.advertisement{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.advertisement.RoomAdErrorMessageParser;

    [SecureSWF(rename="true")]
    public class RoomAdErrorEvent extends MessageEvent implements IMessageEvent {

        public function RoomAdErrorEvent(k:Function);

        public function getParser():RoomAdErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.advertisement

