//com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsErrorMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomSettingsErrorMessageParser implements IMessageParser {

        private var _roomId:int;
        private var _errorCode:int;

        public function RoomSettingsErrorMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get roomId():int;

        public function get errorCode():int;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

