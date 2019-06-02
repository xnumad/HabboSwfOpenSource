//com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _figure:String;
        private var _race:String;
        private var _gender:String;
        private var _isRiding:Boolean;

        public function RoomObjectAvatarFigureUpdateMessage(k:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false);

        public function get figure():String;

        public function get race():String;

        public function get gender():String;

        public function get isRiding():Boolean;


    }
}//package com.sulake.habbo.room.messages

