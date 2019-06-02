package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage 
    {
        public static const RORCUM_BACKGROUND_COLOR:String = "RORCUM_BACKGROUND_COLOR";

        private var _type:String = "";
        private var _color:uint = 0;
        private var _light:int = 0;
        private var _bgOnly:Boolean = true;

        public function RoomObjectRoomColorUpdateMessage(k:String, _arg_2:uint, _arg_3:int, _arg_4:Boolean)
        {
            super(null, null);
            this._type = k;
            this._color = _arg_2;
            this._light = _arg_3;
            this._bgOnly = _arg_4;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_4272():uint
        {
            return this._light;
        }

        public function get bgOnly():Boolean
        {
            return this._bgOnly;
        }
    }
}
