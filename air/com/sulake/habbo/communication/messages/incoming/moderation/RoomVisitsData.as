//com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitsData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomVisitsData {

        private var _userId:int;
        private var _userName:String;
        private var _rooms:Array;

        public function RoomVisitsData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get rooms():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

