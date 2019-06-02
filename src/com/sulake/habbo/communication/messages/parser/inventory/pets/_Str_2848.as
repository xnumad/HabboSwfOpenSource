package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2848 
    {
        private var _id:int;
        private var _name:String;
        private var _figureData:PetFigureData;
        private var _level:int;

        public function _Str_2848(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._name = k.readString();
            this._figureData = new PetFigureData(k);
            this._level = k.readInteger();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get typeId():int
        {
            return this._figureData.typeId;
        }

        public function get paletteId():int
        {
            return this._figureData.paletteId;
        }

        public function get color():String
        {
            return this._figureData.color;
        }

        public function get breedId():int
        {
            return this._figureData.breedId;
        }

        public function get customPartCount():int
        {
            return this._figureData.customPartCount;
        }

        public function get figureString():String
        {
            return this._figureData.figuredata;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }

        public function get level():int
        {
            return this._level;
        }
    }
}
