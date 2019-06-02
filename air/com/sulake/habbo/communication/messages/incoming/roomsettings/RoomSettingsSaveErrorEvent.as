//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSaveErrorEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSaveErrorMessageParser;

    [SecureSWF(rename="true")]
    public class RoomSettingsSaveErrorEvent extends MessageEvent implements IMessageEvent {

        public function RoomSettingsSaveErrorEvent(k:Function);

        public function getParser():RoomSettingsSaveErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

