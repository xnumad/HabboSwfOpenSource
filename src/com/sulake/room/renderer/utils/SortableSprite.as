package com.sulake.room.renderer.utils
{
    import com.sulake.room.object.visualization.ISortableSprite;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class SortableSprite implements ISortableSprite 
    {
        public static const Z_INFINITY:Number = 100000000;

        private var _x:int = 0;
        private var _y:int = 0;
        private var _z:Number = 0;
        public var name:String = "";
        private var _sprite:IRoomObjectSprite = null;


        public function dispose():void
        {
            this._sprite = null;
            this._z = -(Z_INFINITY);
        }

        public function get x():int
        {
            return this._x;
        }

        public function set x(k:int):void
        {
            this._x = k;
        }

        public function get y():int
        {
            return this._y;
        }

        public function set y(k:int):void
        {
            this._y = k;
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set z(k:Number):void
        {
            this._z = k;
        }

        public function get sprite():IRoomObjectSprite
        {
            return this._sprite;
        }

        public function set sprite(k:IRoomObjectSprite):void
        {
            this._sprite = k;
        }
    }
}
