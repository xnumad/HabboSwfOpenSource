//com.sulake.habbo.communication.messages.parser.inventory.pets.PetRemovedFromInventoryParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetRemovedFromInventoryParser implements IMessageParser {

        private var _petId:int;

        public function PetRemovedFromInventoryParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get petId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

