package com.sulake.habbo.navigator
{
    import com.sulake.core.window.IWindowContainer;

    public interface IViewCtrl 
    {
        function refresh():void;
        function set content(_arg_1:IWindowContainer):void;
        function get content():IWindowContainer;
    }
}
