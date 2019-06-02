//com.sulake.habbo.communication.messages.parser.inventory.pets.PetReceivedMessageParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetReceivedMessageParser implements IMessageParser {

        private var _boughtAsGift:Boolean;
        private var _pet:PetData;

        public function PetReceivedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get boughtAsGift():Boolean;

        public function get pet():PetData;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

