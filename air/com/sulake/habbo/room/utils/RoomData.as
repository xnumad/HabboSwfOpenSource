//com.sulake.habbo.room.utils.RoomData

package com.sulake.habbo.room.utils{
    public class RoomData {

        private var _roomId:int;
        private var _data:XML;
        private var _floorType:String;
        private var _wallType:String;
        private var _landscapeType:String;

        public function RoomData(k:int, _arg_2:XML);

        public function get roomId():int;

        public function get data():XML;

        public function get floorType():String;

        public function set floorType(k:String):void;

        public function get wallType():String;

        public function set wallType(k:String):void;

        public function get landscapeType():String;

        public function set landscapeType(k:String):void;


    }
}//package com.sulake.habbo.room.utils

