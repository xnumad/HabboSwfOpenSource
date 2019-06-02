//com.sulake.habbo.communication.messages.parser.users.PetRespectNotificationParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetRespectNotificationParser implements IMessageParser {

        public static const PET_TYPE_MONSTERPLANT:int;

        private var _respect:int;
        private var _petOwnerId:int;
        private var _petData:PetData;

        public function PetRespectNotificationParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get petOwnerId():int;

        public function get respect():int;

        public function get petData():PetData;

        public function isTreat():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.users

