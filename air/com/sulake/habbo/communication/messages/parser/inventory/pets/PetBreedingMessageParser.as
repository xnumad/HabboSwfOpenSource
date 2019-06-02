//com.sulake.habbo.communication.messages.parser.inventory.pets.PetBreedingMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetBreedingMessageParser implements IMessageParser {

        public static const STATE_CANCEL:int;
        public static const STATE_ACCEPT:int;
        public static const STATE_REQUEST:int;

        private var _state:int;
        private var _ownPetId:int;
        private var _otherPetId:int;

        public function PetBreedingMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get state():int;

        public function get ownPetId():int;

        public function get otherPetId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

