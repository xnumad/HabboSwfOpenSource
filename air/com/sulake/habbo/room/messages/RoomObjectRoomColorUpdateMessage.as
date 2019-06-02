//com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage {

        public static const BACKGROUND_COLOR:String;

        private var _type:String;
        private var _color:uint;
        private var _light:int;
        private var _bgOnly:Boolean;

        public function RoomObjectRoomColorUpdateMessage(k:String, _arg_2:uint, _arg_3:int, _arg_4:Boolean);

        public function get type():String;

        public function get color():uint;

        public function get light():uint;

        public function get bgOnly():Boolean;


    }
}//package com.sulake.habbo.room.messages

