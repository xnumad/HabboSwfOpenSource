//com.sulake.habbo.avatar.structure.figure.FigurePart

package com.sulake.habbo.avatar.structure.figure{
    public class FigurePart implements IFigurePart {

        private var _id:int;
        private var _type:String;
        private var _breed:int;
        private var _colorLayerIndex:int;
        private var _index:int;
        private var _paletteMapId:int;

        public function FigurePart(k:XML);

        public function dispose():void;

        public function get id():int;

        public function get type():String;

        public function get breed():int;

        public function get colorLayerIndex():int;

        public function get index():int;

        public function get paletteMap():int;


    }
}//package com.sulake.habbo.avatar.structure.figure

