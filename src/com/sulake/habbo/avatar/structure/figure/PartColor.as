package com.sulake.habbo.avatar.structure.figure
{
    import flash.geom.ColorTransform;

    public class PartColor implements IPartColor 
    {
        private var _id:int;
        private var _index:int;
        private var _clubLevel:int;
        private var _isSelectable:Boolean = false;
        private var _rgb:uint;
        private var _r:uint;
        private var _g:uint;
        private var _b:uint;
        private var _redMultiplier:Number;
        private var _greenMultiplier:Number;
        private var _blueMultiplier:Number;
        private var _colorTransform:ColorTransform;

        public function PartColor(k:XML)
        {
            this._id = parseInt(k.@id);
            this._index = parseInt(k.@index);
            this._clubLevel = parseInt(k.@club);
            this._isSelectable = Boolean(parseInt(k.@selectable));
            var _local_2:String = k.text();
            this._rgb = parseInt(_local_2, 16);
            this._r = ((this._rgb >> 16) & 0xFF);
            this._g = ((this._rgb >> 8) & 0xFF);
            this._b = ((this._rgb >> 0) & 0xFF);
            this._redMultiplier = ((this._r / 0xFF) * 1);
            this._greenMultiplier = ((this._g / 0xFF) * 1);
            this._blueMultiplier = ((this._b / 0xFF) * 1);
            this._colorTransform = new ColorTransform(this._redMultiplier, this._greenMultiplier, this._blueMultiplier);
        }

        public function get colorTransform():ColorTransform
        {
            return this._colorTransform;
        }

        public function get redMultiplier():Number
        {
            return this._redMultiplier;
        }

        public function get greenMultiplier():Number
        {
            return this._greenMultiplier;
        }

        public function get blueMultiplier():Number
        {
            return this._blueMultiplier;
        }

        public function get _Str_915():uint
        {
            return this._rgb;
        }

        public function get r():uint
        {
            return this._r;
        }

        public function get g():uint
        {
            return this._g;
        }

        public function get b():uint
        {
            return this._b;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get index():int
        {
            return this._index;
        }

        public function get clubLevel():int
        {
            return this._clubLevel;
        }

        public function get isSelectable():Boolean
        {
            return this._isSelectable;
        }
    }
}
