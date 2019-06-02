//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsErrorEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsErrorMessageParser;

    [SecureSWF(rename="true")]
    public class RoomSettingsErrorEvent extends MessageEvent implements IMessageEvent {

        public function RoomSettingsErrorEvent(k:Function);

        public function getParser():RoomSettingsErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

