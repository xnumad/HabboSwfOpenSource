package com.sulake.habbo.room.object.visualization.room
{
    public class RoomPlaneBitmapMask 
    {
        private var _type:String = null;
        private var _leftSideLoc:Number = 0;
        private var _rightSideLoc:Number = 0;

        public function RoomPlaneBitmapMask(k:String, _arg_2:Number, _arg_3:Number)
        {
            this._type = k;
            this._leftSideLoc = _arg_2;
            this._rightSideLoc = _arg_3;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get _Str_5120():Number
        {
            return this._leftSideLoc;
        }

        public function get _Str_4659():Number
        {
            return this._rightSideLoc;
        }
    }
}
