//com.sulake.habbo.communication.messages.parser.room.pets.PetCommandsMessageParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetCommandsMessageParser implements IMessageParser {

        private var _petId:int;
        private var _allCommands:Array;
        private var _enabledCommands:Array;

        public function PetCommandsMessageParser();

        public function get petId():int;

        public function get allCommands():Array;

        public function get enabledCommands():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

