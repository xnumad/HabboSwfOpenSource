package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetLevelNotificationParser implements IMessageParser
    {
        private var _petId:int;
        private var _petName:String;
        private var _level:int;
        private var _figureData:PetFigureData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._petId = k.readInteger();
            this._petName = k.readString();
            this._level = k.readInteger();
            this._figureData = new PetFigureData(k);
            return true;
        }

        public function get petId():int
        {
            return this._petId;
        }

        public function get petName():String
        {
            return this._petName;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }
    }
}
