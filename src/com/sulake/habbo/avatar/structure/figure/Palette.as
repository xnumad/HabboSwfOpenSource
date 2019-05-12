package com.sulake.habbo.avatar.structure.figure
{
    import flash.utils.Dictionary;

    public class Palette implements IPalette 
    {
        private var _id:int;
        private var _colors:Dictionary;

        public function Palette(k:XML)
        {
            this._id = parseInt(k.@id);
            this._colors = new Dictionary();
            this._Str_2015(k);
        }

        public function _Str_2015(k:XML):void
        {
            var _local_2:XML;
            for each (_local_2 in k.color)
            {
                this._colors[String(_local_2.@id)] = new PartColor(_local_2);
            }
        }

        public function get id():int
        {
            return this._id;
        }

        public function _Str_751(k:int):IPartColor
        {
            return this._colors[String(k)];
        }

        public function get colors():Dictionary
        {
            return this._colors;
        }
    }
}
