//com.sulake.habbo.communication.messages.parser.room.pets.PetRespectFailedParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetRespectFailedParser implements IMessageParser {

        private var _requiredDays:int;
        private var _avatarAgeInDays:int;

        public function PetRespectFailedParser();

        public function get requiredDays():int;

        public function get avatarAgeInDays():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

