//com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailUpdateResultEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.RoomThumbnailUpdateResultMessageParser;

    [SecureSWF(rename="true")]
    public class RoomThumbnailUpdateResultEvent extends MessageEvent implements IMessageEvent {

        public function RoomThumbnailUpdateResultEvent(k:Function);

        public function getParser():RoomThumbnailUpdateResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

