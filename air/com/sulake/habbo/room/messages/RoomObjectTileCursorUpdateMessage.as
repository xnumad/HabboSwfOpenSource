//com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;

    public class RoomObjectTileCursorUpdateMessage extends RoomObjectUpdateMessage {

        private var _height:Number;
        private var _sourceEventId:String;
        private var _visible:Boolean;

        public function RoomObjectTileCursorUpdateMessage(k:Vector3d, _arg_2:Number, _arg_3:Boolean, _arg_4:String);

        public function get height():Number;

        public function get visible():Boolean;

        public function get sourceEventId():String;


    }
}//package com.sulake.habbo.room.messages

