package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomSettingsSaveErrorMessageParser implements IMessageParser
    {
        public static const ERROR_ROOM_NOT_FOUND:int = 1;
        public static const ERROR_NOT_OWNER:int = 2;
        public static const ERROR_INVALID_DOOR_MODE:int = 3;
        public static const ERROR_INVALID_USER_LIMIT:int = 4;
        public static const ERROR_INVALID_PASSWORD:int = 5;
        public static const ERROR_INVALID_CATEGORY:int = 6;
        public static const ERROR_INVALID_NAME:int = 7;
        public static const ERROR_UNACCEPTABLE_NAME:int = 8;
        public static const ERROR_INVALID_DESCRIPTION:int = 9;
        public static const ERROR_UNACCEPTABLE_DESCRIPTION:int = 10;
        public static const ERROR_INVALID_TAG:int = 11;
        public static const ERROR_NON_USER_CHOOSABLE_TAG:int = 12;
        public static const ERROR_TOO_MANY_CHARACTERS_IN_TAG:int = 13;

        private var _roomId:int;
        private var _errorCode:int;
        private var _info:String;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            this._errorCode = k.readInteger();
            this._info = k.readString();
            return true;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get errorCode():int
        {
            return this._errorCode;
        }

        public function get info():String
        {
            return this._info;
        }
    }
}
