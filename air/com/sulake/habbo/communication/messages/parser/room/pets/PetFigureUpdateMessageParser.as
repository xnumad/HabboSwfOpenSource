//com.sulake.habbo.communication.messages.parser.room.pets.PetFigureUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.pets{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PetFigureUpdateMessageParser implements IMessageParser {

        private var _roomIndex:int;
        private var _petId:int;
        private var _figureData:PetFigureData;
        private var _hasSaddle:Boolean;
        private var _isRiding:Boolean;

        public function PetFigureUpdateMessageParser();

        public function get roomIndex():int;

        public function get petId():int;

        public function get figureData():PetFigureData;

        public function get hasSaddle():Boolean;

        public function get isRiding():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.pets

