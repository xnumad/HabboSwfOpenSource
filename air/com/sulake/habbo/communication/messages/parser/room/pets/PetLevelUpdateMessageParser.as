//com.sulake.habbo.communication.messages.parser.room.pets.PetLevelUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetLevelUpdateMessageParser implements IMessageParser {

        private var _roomIndex:int;
        private var _petId:int;
        private var _level:int;

        public function PetLevelUpdateMessageParser();

        public function get roomIndex():int;

        public function get petId():int;

        public function get level():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

