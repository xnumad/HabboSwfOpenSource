//com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailObjectData

package com.sulake.habbo.communication.messages.incoming.navigator{
    public class RoomThumbnailObjectData {

        private var _pos:int;
        private var _imgId:int;

        public function RoomThumbnailObjectData();

        public function getCopy():RoomThumbnailObjectData;

        public function set pos(k:int):void;

        public function set imgId(k:int):void;

        public function get pos():int;

        public function get imgId():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

