//com.sulake.habbo.communication.messages.incoming.users.RoomEntryData

package com.sulake.habbo.communication.messages.incoming.users{
    public class RoomEntryData {

        private var _roomId:int;
        private var _roomName:String;
        private var _hasControllers:Boolean;

        public function RoomEntryData(k:int, _arg_2:String, _arg_3:Boolean);

        public function get roomId():int;

        public function get roomName():String;

        public function get hasControllers():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

