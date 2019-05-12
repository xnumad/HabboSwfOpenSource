package com.sulake.habbo.room.events
{
    public class RoomObjectHSLColorEnabledEvent extends RoomEngineEvent 
    {
        public static const ROOM_BACKGROUND_COLOR:String = "ROHSLCEE_ROOM_BACKGROUND_COLOR";

        private var _enable:Boolean;
        private var _hue:int;
        private var _saturation:int;
        private var _lightness:int;

        public function RoomObjectHSLColorEnabledEvent(k:String, _arg_2:int, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_2, _arg_7, _arg_8);
            this._enable = _arg_3;
            this._hue = _arg_4;
            this._saturation = _arg_5;
            this._lightness = _arg_6;
        }

        public function get enable():Boolean
        {
            return this._enable;
        }

        public function get hue():int
        {
            return this._hue;
        }

        public function get saturation():int
        {
            return this._saturation;
        }

        public function get lightness():int
        {
            return this._lightness;
        }
    }
}
