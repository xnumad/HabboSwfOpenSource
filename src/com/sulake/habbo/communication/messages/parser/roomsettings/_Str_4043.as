package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4043 implements IMessageParser 
    {
        public static const _Str_20946:int = 1;
        public static const _Str_20471:int = 2;
        public static const _Str_20704:int = 3;
        public static const _Str_20726:int = 4;
        public static const _Str_16354:int = 5;
        public static const _Str_19394:int = 6;
        public static const _Str_18222:int = 7;
        public static const _Str_17186:int = 8;
        public static const _Str_20117:int = 9;
        public static const _Str_18833:int = 10;
        public static const _Str_16822:int = 11;
        public static const _Str_17217:int = 12;
        public static const _Str_16136:int = 13;

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
