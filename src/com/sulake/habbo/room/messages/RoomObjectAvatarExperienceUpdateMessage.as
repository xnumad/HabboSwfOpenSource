package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _gainedExperience:int;

        public function RoomObjectAvatarExperienceUpdateMessage(k:int)
        {
            this._gainedExperience = k;
        }

        public function get _Str_18578():int
        {
            return this._gainedExperience;
        }
    }
}
