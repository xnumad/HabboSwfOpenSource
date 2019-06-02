//com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage {

        public static const ADD_MASK:String;
        public static const REMOVE_MASK:String;
        public static const MASK_TYPE_DOOR:String;
        public static const MASK_CATEGORY_WINDOW:String;
        public static const MASK_CATEGORY_HOLE:String;

        private var _type:String;
        private var _maskId:String;
        private var _maskType:String;
        private var _maskLoc:Vector3d;
        private var _maskCategory:String;

        public function RoomObjectRoomMaskUpdateMessage(k:String, _arg_2:String, _arg_3:String=null, _arg_4:IVector3d=null, _arg_5:String="window");

        public function get type():String;

        public function get maskId():String;

        public function get maskType():String;

        public function get maskLocation():IVector3d;

        public function get maskCategory():String;


    }
}//package com.sulake.habbo.room.messages

