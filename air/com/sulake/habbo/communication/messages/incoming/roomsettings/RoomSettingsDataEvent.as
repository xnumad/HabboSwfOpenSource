//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsDataEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsDataMessageParser;

    [SecureSWF(rename="true")]
    public class RoomSettingsDataEvent extends MessageEvent implements IMessageEvent {

        public function RoomSettingsDataEvent(k:Function);

        public function getParser():RoomSettingsDataMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

