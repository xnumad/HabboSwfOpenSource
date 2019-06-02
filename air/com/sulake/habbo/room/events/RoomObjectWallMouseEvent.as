//com.sulake.habbo.room.events.RoomObjectWallMouseEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectWallMouseEvent extends RoomObjectMouseEvent {

        private var _x:Number;
        private var _y:Number;
        private var _direction:Number;
        private var _wallLoc:Vector3d;
        private var _wallWd:Vector3d;
        private var _wallHt:Vector3d;

        public function RoomObjectWallMouseEvent(k:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:IVector3d, _arg_7:Number, _arg_8:Number, _arg_9:Number, k0:Boolean=false, k1:Boolean=false, k2:Boolean=false, k3:Boolean=false, k4:Boolean=false, k5:Boolean=false);

        public function get wallLocation():IVector3d;

        public function get wallWidth():IVector3d;

        public function get wallHeight():IVector3d;

        public function get x():Number;

        public function get y():Number;

        public function get direction():Number;


    }
}//package com.sulake.habbo.room.events

