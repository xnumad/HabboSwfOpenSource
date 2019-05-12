package com.sulake.habbo.room.object
{
    public class RoomPlaneMaskData 
    {
        private var _leftSideLoc:Number = 0;
        private var _rightSideLoc:Number = 0;
        private var _leftSideLength:Number = 0;
        private var _rightSideLength:Number = 0;

        public function RoomPlaneMaskData(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
        {
            this._leftSideLoc = k;
            this._rightSideLoc = _arg_2;
            this._leftSideLength = _arg_3;
            this._rightSideLength = _arg_4;
        }

        public function get _Str_5120():Number
        {
            return this._leftSideLoc;
        }

        public function get _Str_4659():Number
        {
            return this._rightSideLoc;
        }

        public function get _Str_9124():Number
        {
            return this._leftSideLength;
        }

        public function get _Str_12156():Number
        {
            return this._rightSideLength;
        }
    }
}
