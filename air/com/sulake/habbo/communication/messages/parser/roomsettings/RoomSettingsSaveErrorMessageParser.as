//com.sulake.habbo.communication.messages.parser.roomsettings.RoomSettingsSaveErrorMessageParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomSettingsSaveErrorMessageParser implements IMessageParser {

        public static const ERROR_ROOM_NOT_FOUND:int;
        public static const ERROR_NOT_OWNER:int;
        public static const ERROR_INVALID_DOOR_MODE:int;
        public static const ERROR_INVALID_USER_LIMIT:int;
        public static const ERROR_INVALID_PASSWORD:int;
        public static const ERROR_INVALID_CATEGORY:int;
        public static const ERROR_INVALID_NAME:int;
        public static const ERROR_UNACCEPTABLE_NAME:int;
        public static const ERROR_INVALID_DESCRIPTION:int;
        public static const ERROR_UNACCEPTABLE_DESCRIPTION:int;
        public static const ERROR_INVALID_TAG:int;
        public static const ERROR_NON_USER_CHOOSABLE_TAG:int;
        public static const ERROR_TOO_MANY_CHARACTERS_IN_TAG:int;

        private var _roomId:int;
        private var _errorCode:int;
        private var _info:String;

        public function RoomSettingsSaveErrorMessageParser();

        public function parse(k:IMessageDataWrapper):Boolean;

        public function flush():Boolean;

        public function get roomId():int;

        public function get errorCode():int;

        public function get info():String;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

