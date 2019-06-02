//com.sulake.habbo.avatar.structure.figure.Palette

package com.sulake.habbo.avatar.structure.figure{
    import flash.utils.Dictionary;

    public class Palette implements IPalette {

        private var _id:int;
        private var _colors:Dictionary;

        public function Palette(k:XML);

        public function append(k:XML):void;

        public function get id():int;

        public function getColor(k:int):IPartColor;

        public function get colors():Dictionary;


    }
}//package com.sulake.habbo.avatar.structure.figure

