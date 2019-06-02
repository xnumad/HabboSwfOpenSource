//com.sulake.habbo.avatar.structure.figure.FigurePartSet

package com.sulake.habbo.avatar.structure.figure{
    public class FigurePartSet implements IFigurePartSet {

        private var _type:String;
        private var _id:int;
        private var _gender:String;
        private var _clubLevel:int;
        private var _isColorable:Boolean;
        private var _isSelectable:Boolean;
        private var _parts:Array;
        private var _hiddenLayers:Array;
        private var _isPreSelectable:Boolean;

        public function FigurePartSet(k:XML, _arg_2:String);

        public function dispose():void;

        private function indexOfPartType(k:FigurePart):int;

        public function getPart(k:String, _arg_2:int):IFigurePart;

        public function get type():String;

        public function get id():int;

        public function get gender():String;

        public function get clubLevel():int;

        public function get isColorable():Boolean;

        public function get isSelectable():Boolean;

        public function get parts():Array;

        public function get hiddenLayers():Array;

        public function get isPreSelectable():Boolean;


    }
}//package com.sulake.habbo.avatar.structure.figure

