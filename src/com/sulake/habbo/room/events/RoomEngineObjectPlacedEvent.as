package com.sulake.habbo.room.events
{
    public class RoomEngineObjectPlacedEvent extends RoomEngineObjectEvent 
    {
        private var _wallLocation:String = "";
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _direction:int = 0;
        private var _placedInRoom:Boolean = false;
        private var _placedOnFloor:Boolean = false;
        private var _placedOnWall:Boolean = false;
        private var _instanceData:String = null;

        public function RoomEngineObjectPlacedEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:int, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:String, _arg_14:Boolean=false, _arg_15:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_14, _arg_15);
            this._wallLocation = _arg_5;
            this._x = _arg_6;
            this._y = _arg_7;
            this._z = _arg_8;
            this._direction = _arg_9;
            this._placedInRoom = _arg_10;
            this._placedOnFloor = _arg_11;
            this._placedOnWall = _arg_12;
            this._instanceData = _arg_13;
        }

        public function get _Str_7031():String
        {
            return this._wallLocation;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function get y():Number
        {
            return this._y;
        }

        public function get z():Number
        {
            return this._z;
        }

        public function get direction():int
        {
            return this._direction;
        }

        public function get _Str_4057():Boolean
        {
            return this._placedInRoom;
        }

        public function get placedOnFloor():Boolean
        {
            return this._placedOnFloor;
        }

        public function get placedOnWall():Boolean
        {
            return this._placedOnWall;
        }

        public function get _Str_4766():String
        {
            return this._instanceData;
        }
    }
}
