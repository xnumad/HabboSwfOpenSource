//com.sulake.habbo.communication.messages.parser.inventory.pets.PetAddedToInventoryParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetAddedToInventoryParser implements IMessageParser {

        private var _pet:PetData;
        private var _openInventory:Boolean;

        public function PetAddedToInventoryParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get pet():PetData;

        public function openInventory():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

