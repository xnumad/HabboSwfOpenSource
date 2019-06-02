package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetFigureData 
    {
        private var _typeId:int;
        private var _paletteId:int;
        private var _color:String;
        private var _breedId:int;
        private var _customPartCount:int;
        private var _customParts:Array;

        public function PetFigureData(k:IMessageDataWrapper)
        {
            this._typeId = k.readInteger();
            this._paletteId = k.readInteger();
            this._color = k.readString();
            this._breedId = k.readInteger();
            this._customParts = [];
            this._customPartCount = k.readInteger();
            var _local_2:int;
            while (_local_2 < this._customPartCount)
            {
                this._customParts.push(k.readInteger());
                this._customParts.push(k.readInteger());
                this._customParts.push(k.readInteger());
                _local_2++;
            }
        }

        public function get typeId():int
        {
            return this._typeId;
        }

        public function get paletteId():int
        {
            return this._paletteId;
        }

        public function get color():String
        {
            return this._color;
        }

        public function get breedId():int
        {
            return this._breedId;
        }

        public function get figuredata():String
        {
            var _local_2:int;
            var k:String = ((((this.typeId + " ") + this.paletteId) + " ") + this.color);
            k = (k + (" " + this.customPartCount));
            for each (_local_2 in this._Str_3542)
            {
                k = (k + (" " + _local_2));
            }
            return k;
        }

        public function get _Str_3542():Array
        {
            return this._customParts;
        }

        public function get customPartCount():int
        {
            return this._customPartCount;
        }
    }
}
