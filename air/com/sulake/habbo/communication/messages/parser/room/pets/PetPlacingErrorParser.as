//com.sulake.habbo.communication.messages.parser.room.pets.PetPlacingErrorParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetPlacingErrorParser implements IMessageParser {

        private var _errorCode:int;

        public function PetPlacingErrorParser();

        public function get errorCode():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

