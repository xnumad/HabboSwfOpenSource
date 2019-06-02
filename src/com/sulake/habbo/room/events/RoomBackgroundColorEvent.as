package com.sulake.habbo.room.events
{
    public class RoomBackgroundColorEvent extends RoomEngineEvent 
    {
        public static const ROOM_COLOR:String = "REE_ROOM_COLOR";

        private var _color:uint;
        private var _Str_21672:uint;
        private var _Str_6930:Boolean;

        public function RoomBackgroundColorEvent(roomId:int, color:uint, _arg_3:uint, _arg_4:Boolean, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(ROOM_COLOR, roomId, _arg_5, _arg_6);
            this._color = color;
            this._Str_21672 = _arg_3;
            this._Str_6930 = _arg_4;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_5123():uint
        {
            return this._Str_21672;
        }

        public function get bgOnly():Boolean
        {
            return this._Str_6930;
        }
    }
}
