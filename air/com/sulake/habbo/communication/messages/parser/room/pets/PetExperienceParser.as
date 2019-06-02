//com.sulake.habbo.communication.messages.parser.room.pets.PetExperienceParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetExperienceParser implements IMessageParser {

        private var _petId:int;
        private var _petRoomIndex:int;
        private var _gainedExperience:int;

        public function PetExperienceParser();

        public function get petId():int;

        public function get petRoomIndex():int;

        public function get gainedExperience():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

