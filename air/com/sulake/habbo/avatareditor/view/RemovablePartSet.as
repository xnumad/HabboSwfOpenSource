//com.sulake.habbo.avatareditor.view.RemovablePartSet

package com.sulake.habbo.avatareditor.view{
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.figure.IFigurePart;

    public class RemovablePartSet implements IFigurePartSet {

        public function RemovablePartSet();

        public function getPart(k:String, _arg_2:int):IFigurePart;

        public function get type():String;

        public function get id():int;

        public function get gender():String;

        public function get clubLevel():int;

        public function get isColorable():Boolean;

        public function get isSelectable():Boolean;

        public function get isPreSelectable():Boolean;

        public function get parts():Array;

        public function get hiddenLayers():Array;


    }
}//package com.sulake.habbo.avatareditor.view

