//com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _effect:int;
        private var _delayMilliSeconds:int;

        public function RoomObjectAvatarEffectUpdateMessage(k:int=0, _arg_2:int=0);

        public function get effect():int;

        public function get delayMilliSeconds():int;


    }
}//package com.sulake.habbo.room.messages

