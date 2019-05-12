package com.sulake.habbo.room.object.visualization.data
{
    public class AnimationFrameData 
    {
        private var _id:int = 0;
        private var _x:int = 0;
        private var _y:int = 0;
        private var _randomX:int = 0;
        private var _randomY:int = 0;
        private var _repeats:int = 1;

        public function AnimationFrameData(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            this._id = k;
            this._x = _arg_2;
            this._y = _arg_3;
            this._randomX = _arg_4;
            this._randomY = _arg_5;
            this._repeats = _arg_6;
        }

        public function get id():int
        {
            return this._id;
        }

        public function hasDirectionalOffsets():Boolean
        {
            return false;
        }

        public function getX(k:int):int
        {
            return this._x;
        }

        public function getY(k:int):int
        {
            return this._y;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._x;
        }

        public function get randomX():int
        {
            return this._randomX;
        }

        public function get randomY():int
        {
            return this._randomY;
        }

        public function get repeats():int
        {
            return this._repeats;
        }
    }
}
