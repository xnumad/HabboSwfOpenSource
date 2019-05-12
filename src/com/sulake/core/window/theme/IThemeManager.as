package com.sulake.core.window.theme
{
    public interface IThemeManager 
    {
        function getStyle(_arg_1:String, _arg_2:uint, _arg_3:String):uint;
        function getThemeAndIntent(_arg_1:uint, _arg_2:uint):Object;
        function getIntents(_arg_1:uint, _arg_2:String, _arg_3:uint):Array;
        function getPropertyDefaults(_arg_1:uint):IPropertyMap;
        function getThemes():Array;
    }
}
