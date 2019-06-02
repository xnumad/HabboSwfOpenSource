//com.sulake.habbo.communication.messages.incoming.roomsettings.UserUnbannedFromRoomEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.UserUnbannedFromRoomParser;

    [SecureSWF(rename="true")]
    public class UserUnbannedFromRoomEvent extends MessageEvent implements IMessageEvent {

        public function UserUnbannedFromRoomEvent(k:Function);

        public function getParser():UserUnbannedFromRoomParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

