//com.sulake.habbo.communication.messages.incoming.room.engine.AvatarActionMessageData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    public class AvatarActionMessageData {

        private var _actionType:String;
        private var _actionParameter:String;

        public function AvatarActionMessageData(k:String, _arg_2:String);

        public function get actionType():String;

        public function get actionParameter():String;

        public function toString():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

