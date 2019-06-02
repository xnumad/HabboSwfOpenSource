//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsSavedEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSavedMessageParser;

    [SecureSWF(rename="true")]
    public class RoomSettingsSavedEvent extends MessageEvent implements IMessageEvent {

        public function RoomSettingsSavedEvent(k:Function);

        public function getParser():RoomSettingsSavedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

