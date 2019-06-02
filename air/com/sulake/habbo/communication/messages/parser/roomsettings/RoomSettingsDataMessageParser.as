//com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsDataMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomSettingsDataMessageParser implements IMessageParser {

        private var _rsData:RoomSettingsData;

        public function RoomSettingsDataMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get data():RoomSettingsData;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

