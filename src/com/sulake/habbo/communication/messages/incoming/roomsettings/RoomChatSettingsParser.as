package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettingsParser 
    {
        public static const _Str_19408:int = 0;
        public static const _Str_12787:int = 1;
        public static const _Str_16907:int = 0;
        public static const _Str_12581:int = 1;
        public static const _Str_16484:int = 2;
        public static const _Str_18404:int = 0;
        public static const _Str_17874:int = 1;
        public static const _Str_16469:int = 2;
        public static const _Str_21099:int = 0;
        public static const _Str_20763:int = 1;
        public static const _Str_22060:int = 2;

        private var _mode:int = 0;
        private var _weight:int = 1;
        private var _speed:int = 1;
        private var _protection:int = 1;
        private var _distance:int = 14;

        public function RoomChatSettingsParser(k:IMessageDataWrapper)
        {
            this._mode = k.readInteger();
            this._weight = k.readInteger();
            this._speed = k.readInteger();
            this._distance = k.readInteger();
            this._protection = k.readInteger();
        }

        public function get mode():int
        {
            return this._mode;
        }

        public function get weight():int
        {
            return this._weight;
        }

        public function get speed():int
        {
            return this._speed;
        }

        public function get distance():int
        {
            return this._distance;
        }

        public function get protection():int
        {
            return this._protection;
        }
    }
}
