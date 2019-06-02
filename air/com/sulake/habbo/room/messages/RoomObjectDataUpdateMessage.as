//com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.IStuffData;

    public class RoomObjectDataUpdateMessage extends RoomObjectUpdateMessage {

        private var _state:int;
        private var _data:IStuffData;
        private var _extra:Number;

        public function RoomObjectDataUpdateMessage(k:int, _arg_2:IStuffData, _arg_3:Number=NaN);

        public function get state():int;

        public function get data():IStuffData;

        public function get extra():Number;


    }
}//package com.sulake.habbo.room.messages

