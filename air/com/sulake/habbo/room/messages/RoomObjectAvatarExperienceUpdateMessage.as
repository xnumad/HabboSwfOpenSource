//com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage

package com.sulake.habbo.room.messages{
    public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage {

        private var _gainedExperience:int;

        public function RoomObjectAvatarExperienceUpdateMessage(k:int);

        public function get gainedExperience():int;


    }
}//package com.sulake.habbo.room.messages

