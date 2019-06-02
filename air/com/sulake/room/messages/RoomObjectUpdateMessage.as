//com.sulake.room.messages.RoomObjectUpdateMessage

package com.sulake.room.messages{
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectUpdateMessage {

        protected var _loc:IVector3d;
        protected var _dir:IVector3d;

        public function RoomObjectUpdateMessage(k:IVector3d, _arg_2:IVector3d);

        public function get loc():IVector3d;

        public function get dir():IVector3d;


    }
}//package com.sulake.room.messages

