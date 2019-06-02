//com.sulake.habbo.room.messages.RoomObjectModelDataUpdateMessage

package com.sulake.habbo.room.messages{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectModelDataUpdateMessage extends RoomObjectUpdateMessage {

        private var _numberKey:String;
        private var _numberValue:int;

        public function RoomObjectModelDataUpdateMessage(k:String, _arg_2:int);

        public function get numberKey():String;

        public function get numberValue():int;


    }
}//package com.sulake.habbo.room.messages

