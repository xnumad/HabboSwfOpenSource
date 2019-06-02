//com.sulake.habbo.communication.messages.parser.inventory.pets.GoToBreedingNestFailureParser

package com.sulake.habbo.communication.messages.parser.inventory.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GoToBreedingNestFailureParser implements IMessageParser {

        public static const PET_TOO_TIRED_TO_BREED:int;

        private var _reason:int;

        public function GoToBreedingNestFailureParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get reason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.pets

