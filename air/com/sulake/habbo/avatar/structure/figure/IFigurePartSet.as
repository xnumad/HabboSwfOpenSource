//com.sulake.habbo.avatar.structure.figure.IFigurePartSet

package com.sulake.habbo.avatar.structure.figure{
    public /*dynamic*/ interface IFigurePartSet {

        function getPart(k:String, _arg_2:int):IFigurePart;
        function get type():String;
        function get id():int;
        function get gender():String;
        function get clubLevel():int;
        function get isColorable():Boolean;
        function get isSelectable():Boolean;
        function get isPreSelectable():Boolean;
        function get parts():Array;
        function get hiddenLayers():Array;

    }
}//package com.sulake.habbo.avatar.structure.figure

