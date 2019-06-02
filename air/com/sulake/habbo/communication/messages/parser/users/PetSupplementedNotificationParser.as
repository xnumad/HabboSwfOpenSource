//com.sulake.habbo.communication.messages.parser.users.PetSupplementedNotificationParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetSupplementedNotificationParser implements IMessageParser {

        private var _petId:int;
        private var _userId:int;
        private var _supplementType:int;

        public function PetSupplementedNotificationParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get petId():int;

        public function get userId():int;

        public function get supplementType():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

