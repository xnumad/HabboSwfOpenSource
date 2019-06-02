//com.sulake.habbo.communication.messages.parser.room.furniture.OpenPetPackageRequestedMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OpenPetPackageRequestedMessageParser implements IMessageParser {

        private var _objectId:int;
        private var _figureData:PetFigureData;

        public function OpenPetPackageRequestedMessageParser();

        public function get objectId():int;

        public function get figureData():PetFigureData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

