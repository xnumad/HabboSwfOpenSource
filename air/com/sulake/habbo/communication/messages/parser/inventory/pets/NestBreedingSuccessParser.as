//com.sulake.habbo.communication.messages.parser.inventory.pets.NestBreedingSuccessParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NestBreedingSuccessParser implements IMessageParser {

        private var _rarityCategory:int;
        private var _petId:int;

        public function NestBreedingSuccessParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get rarityCategory():int;

        public function get petId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

