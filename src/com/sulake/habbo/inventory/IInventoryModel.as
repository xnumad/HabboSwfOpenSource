package com.sulake.habbo.inventory
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;

    public interface IInventoryModel extends IDisposable 
    {
        function getWindowContainer():IWindowContainer;
        function _Str_4889():void;
        function _Str_5913(_arg_1:String):void;
        function _Str_5813(_arg_1:String):void;
        function _Str_5100():void;
        function _Str_2491():void;
        function _Str_5725(_arg_1:String):void;
    }
}
