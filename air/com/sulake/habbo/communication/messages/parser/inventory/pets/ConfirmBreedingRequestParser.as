//com.sulake.habbo.communication.messages.parser.inventory.pets.ConfirmBreedingRequestParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.pets.BreedingPetInfo;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ConfirmBreedingRequestParser implements IMessageParser {

        private var _nestId:int;
        private var _pet1:BreedingPetInfo;
        private var _pet2:BreedingPetInfo;
        private var _rarityCategories:Array;
        private var _resultPetType:int;

        public function ConfirmBreedingRequestParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get nestId():int;

        public function get pet1():BreedingPetInfo;

        public function get pet2():BreedingPetInfo;

        public function get rarityCategories():Array;

        public function get resultPetType():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

