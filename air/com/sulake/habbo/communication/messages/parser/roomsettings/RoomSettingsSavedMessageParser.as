//com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSavedMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomSettingsSavedMessageParser implements IMessageParser {

        private var _roomId:int;

        public function RoomSettingsSavedMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get roomId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

