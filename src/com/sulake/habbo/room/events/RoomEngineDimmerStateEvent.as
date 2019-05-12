package com.sulake.habbo.room.events
{
    public class RoomEngineDimmerStateEvent extends RoomEngineEvent 
    {
        public static const REDSE_ROOM_COLOR:String = "REDSE_ROOM_COLOR";

        private var _state:int;
        private var _presetId:int;
        private var _effectId:int;
        private var _color:uint;
        private var _brightness:int;

        public function RoomEngineDimmerStateEvent(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint, _arg_6:uint, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(REDSE_ROOM_COLOR, k, _arg_7, _arg_8);
            this._state = _arg_2;
            this._presetId = _arg_3;
            this._effectId = _arg_4;
            this._color = _arg_5;
            this._brightness = _arg_6;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get _Str_14686():int
        {
            return this._presetId;
        }

        public function get _Str_6815():int
        {
            return this._effectId;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_5123():uint
        {
            return this._brightness;
        }
    }
}
