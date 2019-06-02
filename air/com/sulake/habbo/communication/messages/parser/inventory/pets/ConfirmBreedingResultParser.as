//com.sulake.habbo.communication.messages.parser.inventory.pets.ConfirmBreedingResultParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ConfirmBreedingResultParser implements IMessageParser {

        private var _breedingNestStuffId:int;
        private var _result:int;

        public function ConfirmBreedingResultParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get breedingNestStuffId():int;

        public function get result():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

