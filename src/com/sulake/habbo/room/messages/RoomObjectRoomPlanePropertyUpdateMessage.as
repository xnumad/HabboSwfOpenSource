package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomPlanePropertyUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const RORPPUM_WALL_THICKNESS:String = "RORPPUM_WALL_THICKNESS";
        public static const RORPVUM_FLOOR_THICKNESS:String = "RORPVUM_FLOOR_THICKNESS";

        private var _type:String = "";
        private var _value:Number = 0;

        public function RoomObjectRoomPlanePropertyUpdateMessage(k:String, _arg_2:Number)
        {
            super(null, null);
            this._type = k;
            this._value = _arg_2;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get value():Number
        {
            return this._value;
        }
    }
}
