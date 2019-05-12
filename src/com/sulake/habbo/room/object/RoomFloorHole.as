package com.sulake.habbo.room.object
{
    public class RoomFloorHole 
    {
        private var _x:int;
        private var _y:int;
        private var _width:int;
        private var _height:int;

        public function RoomFloorHole(x:int, y:int, width:int, height:int)
        {
            this._x = x;
            this._y = y;
            this._width = width;
            this._height = height;
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
