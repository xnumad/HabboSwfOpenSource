//com.sulake.habbo.communication.messages.parser.notifications.PetLevelNotificationParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetLevelNotificationParser implements IMessageParser {

        private var _petId:int;
        private var _petName:String;
        private var _level:int;
        private var _figureData:PetFigureData;

        public function PetLevelNotificationParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get petId():int;

        public function get petName():String;

        public function get level():int;

        public function get figureData():PetFigureData;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

