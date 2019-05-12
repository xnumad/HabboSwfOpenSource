package com.sulake.habbo.session.events
{
    public class RoomSessionDimmerPresetsEventPresetItem 
    {
        private var _id:int = 0;
        private var _type:int = 0;
        private var _color:uint = 0;
        private var _light:uint = 0;

        public function RoomSessionDimmerPresetsEventPresetItem(k:int, _arg_2:int, _arg_3:uint, _arg_4:uint)
        {
            this._id = k;
            this._type = _arg_2;
            this._color = _arg_3;
            this._light = _arg_4;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get type():int
        {
            return this._type;
        }

        public function get color():uint
        {
            return this._color;
        }

        public function get _Str_4272():int
        {
            return this._light;
        }
    }
}
