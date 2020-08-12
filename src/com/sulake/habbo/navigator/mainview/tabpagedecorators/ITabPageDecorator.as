package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.core.window.IWindowContainer;

    public interface ITabPageDecorator 
    {
        function refreshCustomContent(_arg_1:IWindowContainer):void;
        function tabSelected():void;
        function _Str_8146():void;
        function _Str_5920(_arg_1:IWindowContainer):void;
        function get _Str_5960():String;
        function _Str_8025(_arg_1:int):void;
        function _Str_8512(_arg_1:String):String;
    }
}
