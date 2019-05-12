package com.sulake.habbo.avatar.structure.figure
{
    import com.sulake.core.utils.Map;

    public interface ISetType 
    {
        function _Str_1020(_arg_1:int):IFigurePartSet;
        function _Str_895(_arg_1:String, _arg_2:int):Boolean;
        function _Str_1002(_arg_1:String):int;
        function get type():String;
        function get _Str_734():int;
        function get _Str_710():Map;
    }
}
