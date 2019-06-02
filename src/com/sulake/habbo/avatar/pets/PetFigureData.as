package com.sulake.habbo.avatar.pets
{
    public class PetFigureData 
    {
        private var _typeId:int;
        private var _paletteId:int;
        private var _color:int;
        private var _customParts:Array;
        private var _customLayerIds:Array;
        private var _customPartIds:Array;
        private var _customPaletteIds:Array;
        private var _headOnly:Boolean;

        public function PetFigureData(k:String)
        {
            this._typeId = this._Str_19576(k);
            this._paletteId = this.getPaletteId(k);
            this._color = this._Str_751(k);
            this._headOnly = this.getHeadOnly(k);
            var _local_2:Array = this.getCustomData(k);
            this._customLayerIds = this.getCustomLayerIds(_local_2);
            this._customPartIds = this.getCustomPartIds(_local_2);
            this._customPaletteIds = this.getCustomPaletteIds(_local_2);
            this._customParts = [];
            var _local_3:int;
            while (_local_3 < this._customLayerIds.length)
            {
                this._customParts.push(new PetCustomPart(this._customLayerIds[_local_3], this._customPartIds[_local_3], this._customPaletteIds[_local_3]));
                _local_3++;
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

        public function get color():int
        {
            return this._color;
        }

        public function get customLayerIds():Array
        {
            return this._customLayerIds;
        }

        public function get customPartIds():Array
        {
            return this._customPartIds;
        }

        public function get customPaletteIds():Array
        {
            return this._customPaletteIds;
        }

        public function get _Str_3542():Array
        {
            return this._customParts;
        }

        public function getCustomPart(k:int):PetCustomPart
        {
            var _local_2:PetCustomPart;
            if (this._customParts != null)
            {
                for each (_local_2 in this._customParts)
                {
                    if (_local_2._Str_11008 == k)
                    {
                        return _local_2;
                    }
                }
            }
            return null;
        }

        public function get hasCustomParts():Boolean
        {
            return (!(this._customLayerIds == null)) && (this._customLayerIds.length > 0);
        }

        public function get headOnly():Boolean
        {
            return this._headOnly;
        }

        public function get figureString():String
        {
            var _local_2:PetCustomPart;
            var k:String = ((((this.typeId + " ") + this.paletteId) + " ") + this.color.toString(16));
            k = (k + (" " + this._Str_3542.length));
            for each (_local_2 in this._Str_3542)
            {
                k = (k + (((((" " + _local_2._Str_11008) + " ") + _local_2._Str_1502) + " ") + _local_2.paletteId));
            }
            return k;
        }

        private function getCustomData(k:String):Array
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_2:Array = [];
            if (k != null)
            {
                _local_3 = k.split(" ");
                _local_4 = ((this._headOnly) ? 1 : 0);
                _local_5 = (4 + _local_4);
                if (_local_3.length > _local_5)
                {
                    _local_6 = (3 + _local_4);
                    _local_7 = parseInt(_local_3[_local_6]);
                    _local_2 = _local_3.slice(_local_5, (_local_5 + (_local_7 * 3)));
                }
            }
            return _local_2;
        }

        private function getCustomLayerIds(k:Array):Array
        {
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_2.push(parseInt(k[(_local_3 + 0)]));
                _local_3 = (_local_3 + 3);
            }
            return _local_2;
        }

        private function getCustomPartIds(k:Array):Array
        {
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_2.push(parseInt(k[(_local_3 + 1)]));
                _local_3 = (_local_3 + 3);
            }
            return _local_2;
        }

        private function getCustomPaletteIds(k:Array):Array
        {
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < k.length)
            {
                _local_2.push(parseInt(k[(_local_3 + 2)]));
                _local_3 = (_local_3 + 3);
            }
            return _local_2;
        }

        private function _Str_19576(k:String):int
        {
            var _local_2:Array;
            if (k != null)
            {
                _local_2 = k.split(" ");
                if (_local_2.length >= 1)
                {
                    return parseInt(_local_2[0]);
                }
            }
            return 0;
        }

        private function getPaletteId(k:String):int
        {
            var _local_2:Array;
            if (k != null)
            {
                _local_2 = k.split(" ");
                if (_local_2.length >= 2)
                {
                    return parseInt(_local_2[1]);
                }
            }
            return 0;
        }

        private function _Str_751(k:String):int
        {
            var _local_2:Array;
            if (k != null)
            {
                _local_2 = k.split(" ");
                if (_local_2.length >= 3)
                {
                    return parseInt(_local_2[2], 16);
                }
            }
            return 0xFFFFFF;
        }

        private function getHeadOnly(k:String):Boolean
        {
            var _local_2:Array;
            if (k != null)
            {
                _local_2 = k.split(" ");
                if (_local_2.length >= 4)
                {
                    return _local_2[3] == "head";
                }
            }
            return false;
        }
    }
}
