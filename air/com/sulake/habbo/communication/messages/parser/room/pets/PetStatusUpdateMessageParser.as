//com.sulake.habbo.communication.messages.parser.room.pets.PetStatusUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetStatusUpdateMessageParser implements IMessageParser {

        private var _roomIndex:int;
        private var _petId:int;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _hasBreedingPermission:Boolean;

        public function PetStatusUpdateMessageParser();

        public function get roomIndex():int;

        public function get petId():int;

        public function get canBreed():Boolean;

        public function get canHarvest():Boolean;

        public function get canRevive():Boolean;

        public function flush():Boolean;

        public function get hasBreedingPermission():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

