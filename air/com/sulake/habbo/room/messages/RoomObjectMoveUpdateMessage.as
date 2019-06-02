//com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectMoveUpdateMessage extends RoomObjectUpdateMessage {

        private var _targetLoc:IVector3d;
        private var _isSlideUpdate:Boolean;

        public function RoomObjectMoveUpdateMessage(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:Boolean=false);

        public function get targetLoc():IVector3d;

        public function get realTargetLoc():IVector3d;

        public function get isSlideUpdate():Boolean;


    }
}//package com.sulake.habbo.room.messages

