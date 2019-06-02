//com.sulake.habbo.communication.messages.parser.room.pets.PetBreedingResultMessageParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetBreedingResultData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetBreedingResultMessageParser implements IMessageParser {

        private var _resultData:PetBreedingResultData;
        private var _otherResultData:PetBreedingResultData;

        public function PetBreedingResultMessageParser();

        public function get resultData():PetBreedingResultData;

        public function get otherResultData():PetBreedingResultData;

        public function flush():Boolean;

        private function parseResultData(k:IMessageDataWrapper):PetBreedingResultData;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

