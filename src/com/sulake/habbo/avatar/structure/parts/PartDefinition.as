package com.sulake.habbo.avatar.structure.parts
{
    public class PartDefinition 
    {
        private var _setType:String;
        private var _flippedSetType:String;
        private var _removeSetType:String;
        private var _appendToFigure:Boolean;
        private var _staticId:int = -1;

        public function PartDefinition(k:XML)
        {
            this._setType = String(k.@["set-type"]);
            this._flippedSetType = String(k.@["flipped-set-type"]);
            this._removeSetType = String(k.@["remove-set-type"]);
            this._appendToFigure = false;
        }

        public function hasStaticId():Boolean
        {
            return this._staticId >= 0;
        }

        public function get _Str_1734():int
        {
            return this._staticId;
        }

        public function set _Str_1734(k:int):void
        {
            this._staticId = k;
        }

        public function get setType():String
        {
            return this._setType;
        }

        public function get _Str_1693():String
        {
            return this._flippedSetType;
        }

        public function get removeSetType():String
        {
            return this._removeSetType;
        }

        public function get _Str_1583():Boolean
        {
            return this._appendToFigure;
        }

        public function set _Str_1583(k:Boolean):void
        {
            this._appendToFigure = k;
        }

        public function set _Str_1693(k:String):void
        {
            this._flippedSetType = k;
        }
    }
}
