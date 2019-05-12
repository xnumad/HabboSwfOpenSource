package com.sulake.habbo.avatar.structure.figure
{
    public class FigurePart implements IFigurePart 
    {
        private var _id:int;
        private var _type:String;
        private var _breed:int = -1;
        private var _colorLayerIndex:int;
        private var _index:int;
        private var _paletteMapId:int = -1;

        public function FigurePart(k:XML)
        {
            this._id = parseInt(k.@id);
            this._type = String(k.@type);
            this._index = parseInt(k.@index);
            this._colorLayerIndex = parseInt(k.@colorindex);
            var _local_2:String = k.@palettemapid;
            if (_local_2 != "")
            {
                this._paletteMapId = int(_local_2);
            }
            var _local_3:String = k.@breed;
            if (_local_3 != "")
            {
                this._breed = int(_local_3);
            }
        }

        public function dispose():void
        {
        }

        public function get id():int
        {
            return this._id;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get breed():int
        {
            return this._breed;
        }

        public function get _Str_827():int
        {
            return this._colorLayerIndex;
        }

        public function get index():int
        {
            return this._index;
        }

        public function get paletteMap():int
        {
            return this._paletteMapId;
        }
    }
}
