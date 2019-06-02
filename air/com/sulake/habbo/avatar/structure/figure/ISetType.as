//com.sulake.habbo.avatar.structure.figure.ISetType

package com.sulake.habbo.avatar.structure.figure{
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface ISetType {

        function getPartSet(k:int):IFigurePartSet;
        function isMandatory(k:String, _arg_2:int):Boolean;
        function optionalFromClubLevel(k:String):int;
        function get type():String;
        function get paletteID():int;
        function get partSets():Map;

    }
}//package com.sulake.habbo.avatar.structure.figure

