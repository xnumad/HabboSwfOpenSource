//com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent

package com.sulake.habbo.room.events{
    public class RoomEngineObjectPlacedEvent extends RoomEngineObjectEvent {

        private var _wallLocation:String;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _direction:int;
        private var _placedInRoom:Boolean;
        private var _placedOnFloor:Boolean;
        private var _placedOnWall:Boolean;
        private var _instanceData:String;

        public function RoomEngineObjectPlacedEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:int, k0:Boolean, k1:Boolean, k2:Boolean, k3:String, k4:Boolean=false, k5:Boolean=false);

        public function get wallLocation():String;

        public function get x():Number;

        public function get y():Number;

        public function get z():Number;

        public function get direction():int;

        public function get placedInRoom():Boolean;

        public function get placedOnFloor():Boolean;

        public function get placedOnWall():Boolean;

        public function get instanceData():String;


    }
}//package com.sulake.habbo.room.events

