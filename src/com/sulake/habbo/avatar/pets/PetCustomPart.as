package com.sulake.habbo.avatar.pets
{
    public class PetCustomPart 
    {
        private var _layerId:int;
        private var _partId:int;
        private var _paletteId:int;

        public function PetCustomPart(k:int, _arg_2:int, _arg_3:int)
        {
            this._layerId = k;
            this._partId = _arg_2;
            this._paletteId = _arg_3;
        }

        public function get paletteId():int
        {
            return this._paletteId;
        }

        public function set paletteId(k:int):void
        {
            this._paletteId = k;
        }

        public function get _Str_1502():int
        {
            return this._partId;
        }

        public function set _Str_1502(k:int):void
        {
            this._partId = k;
        }

        public function get _Str_11008():int
        {
            return this._layerId;
        }

        public function set _Str_11008(k:int):void
        {
            this._layerId = k;
        }
    }
}
