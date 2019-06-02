//com.sulake.habbo.communication.messages.incoming.navigator.RoomRatingEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomRatingMessageParser;

    [SecureSWF(rename="true")]
    public class RoomRatingEvent extends MessageEvent implements IMessageEvent {

        public function RoomRatingEvent(k:Function);

        public function getParser():RoomRatingMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

