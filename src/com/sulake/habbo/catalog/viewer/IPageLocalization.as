package com.sulake.habbo.catalog.viewer
{
    public interface IPageLocalization 
    {
        function get imageCount():int;
        function get textCount():int;
        function getTextElementName(_arg_1:int, _arg_2:String):String;
        function getImageElementName(_arg_1:int, _arg_2:String):String;
        function getTextElementContent(_arg_1:int):String;
        function getImageElementContent(_arg_1:int):String;
        function dispose():void;
        function hasLinks(_arg_1:String):Boolean;
        function _Str_20312(_arg_1:String):Array;
        function _Str_22305(_arg_1:int):uint;
    }
}
