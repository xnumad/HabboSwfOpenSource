//com.sulake.habbo.communication.messages.incoming.roomsettings.MuteAllInRoomEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.MuteAllInRoomParser;

    [SecureSWF(rename="true")]
    public class MuteAllInRoomEvent extends MessageEvent implements IMessageEvent {

        public function MuteAllInRoomEvent(k:Function);

        public function getParser():MuteAllInRoomParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

