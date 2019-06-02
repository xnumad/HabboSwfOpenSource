//com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.display.BitmapData;

    public class RoomObjectRoomAdUpdateMessage extends RoomObjectUpdateMessage {

        public static const ROOM_AD_ACTIVATE:String;
        public static const ROOM_BILLBOARD_IMAGE_LOADED:String;
        public static const ROOM_BILLBOARD_LOADING_FAILED:String;

        private var _type:String;
        private var _asset:String;
        private var _clickUrl:String;
        private var _objectId:int;
        private var _bitmapData:BitmapData;

        public function RoomObjectRoomAdUpdateMessage(k:String, _arg_2:String, _arg_3:String, _arg_4:int=-1, _arg_5:BitmapData=null);

        public function get type():String;

        public function get asset():String;

        public function get clickUrl():String;

        public function get objectId():int;

        public function get bitmapData():BitmapData;


    }
}//package com.sulake.habbo.room.messages

