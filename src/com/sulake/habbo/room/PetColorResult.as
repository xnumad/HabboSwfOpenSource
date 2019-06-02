package com.sulake.habbo.room
{
    public class PetColorResult 
    {
        private static const COLOR_TAGS:Array = ["Null", "Black", "White", "Grey", "Red", "Orange", "Pink", "Green", "Lime", "Blue", "Light-Blue", "Dark-Blue", "Yellow", "Brown", "Dark-Brown", "Beige", "Cyan", "Purple", "Gold"];

        private var _breed:int;
        private var _tag:String;
        private var _id:String;
        private var _primaryColor:int = 0;
        private var _secondaryColor:int = 0;
        private var _isMaster:Boolean = false;
        private var _layerTags:Array;

        public function PetColorResult(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Boolean, _arg_7:Array)
        {
            this._layerTags = [];
            super();
            this._primaryColor = (k & 0xFFFFFF);
            this._secondaryColor = (_arg_2 & 0xFFFFFF);
            this._breed = _arg_3;
            this._tag = (((_arg_4 > -1) && (_arg_4 < COLOR_TAGS.length)) ? COLOR_TAGS[_arg_4] : "");
            this._id = _arg_5;
            this._isMaster = _arg_6;
            this._layerTags = _arg_7;
        }

        public function get _Str_5845():int
        {
            return this._primaryColor;
        }

        public function get _Str_6659():int
        {
            return this._secondaryColor;
        }

        public function get breed():int
        {
            return this._breed;
        }

        public function get tag():String
        {
            return this._tag;
        }

        public function get id():String
        {
            return this._id;
        }

        public function get isMaster():Boolean
        {
            return this._isMaster;
        }

        public function get layerTags():Array
        {
            return this._layerTags;
        }
    }
}
