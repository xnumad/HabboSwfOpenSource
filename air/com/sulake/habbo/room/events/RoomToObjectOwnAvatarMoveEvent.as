//com.sulake.habbo.room.events.RoomToObjectOwnAvatarMoveEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomToObjectEvent;
    import com.sulake.room.utils.IVector3d;

    public class RoomToObjectOwnAvatarMoveEvent extends RoomToObjectEvent {

        public static const MOVE_TO:String;

        private var _targetLoc:IVector3d;

        public function RoomToObjectOwnAvatarMoveEvent(k:String, _arg_2:IVector3d, _arg_3:Boolean=false, _arg_4:Boolean=false);

        public function get targetLoc():IVector3d;


    }
}//package com.sulake.habbo.room.events

