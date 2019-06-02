//com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUsersFromRoomEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.BannedUsersFromRoomParser;

    [SecureSWF(rename="true")]
    public class BannedUsersFromRoomEvent extends MessageEvent implements IMessageEvent {

        public function BannedUsersFromRoomEvent(k:Function);

        public function getParser():BannedUsersFromRoomParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

