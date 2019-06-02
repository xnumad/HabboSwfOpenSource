//com.sulake.habbo.communication.messages.incoming.room.furniture.RoomDimmerPresetsMessageData

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    public class RoomDimmerPresetsMessageData {

        private var _id:int;
        private var _type:int;
        private var _color:uint;
        private var _light:uint;
        private var _isReadOnly:Boolean;

        public function RoomDimmerPresetsMessageData(k:int);

        public function setReadOnly():void;

        public function get id():int;

        public function get type():int;

        public function set type(k:int):void;

        public function get color():uint;

        public function set color(k:uint):void;

        public function get light():int;

        public function set light(k:int):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

