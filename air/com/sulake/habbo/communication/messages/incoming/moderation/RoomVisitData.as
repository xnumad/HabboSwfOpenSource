//com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomVisitData {

        private var _roomId:int;
        private var _roomName:String;
        private var _enterHour:int;
        private var _enterMinute:int;

        public function RoomVisitData(k:IMessageDataWrapper);

        public function get roomId():int;

        public function get roomName():String;

        public function get enterHour():int;

        public function get enterMinute():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

