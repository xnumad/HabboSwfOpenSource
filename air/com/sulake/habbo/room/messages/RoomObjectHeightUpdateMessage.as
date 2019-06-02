//com.sulake.habbo.room.messages.RoomObjectHeightUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectHeightUpdateMessage extends RoomObjectUpdateMessage {

        private var _height:Number;

        public function RoomObjectHeightUpdateMessage(k:IVector3d, _arg_2:IVector3d, _arg_3:Number);

        public function get height():Number;


    }
}//package com.sulake.habbo.room.messages

