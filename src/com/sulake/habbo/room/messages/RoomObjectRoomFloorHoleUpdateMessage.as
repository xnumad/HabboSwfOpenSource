package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomFloorHoleUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const RORPFHUM_ADD:String = "RORPFHUM_ADD";
        public static const RORPFHUM_REMOVE:String = "RORPFHUM_REMOVE";

        private var _type:String = "";
        private var _id:int;
        private var _x:int;
        private var _y:int;
        private var _width:int;
        private var _height:int;

        public function RoomObjectRoomFloorHoleUpdateMessage(k:String, _arg_2:int, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0)
        {
            super(null, null);
            this._type = k;
            this._id = _arg_2;
            this._x = _arg_3;
            this._y = _arg_4;
            this._width = _arg_5;
            this._height = _arg_6;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }
    }
}
