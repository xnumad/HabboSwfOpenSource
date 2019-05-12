package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.utils.IMargins;

    public interface IFrameWindow extends IWindowContainer 
    {
        function get title():ILabelWindow;
        function get header():IHeaderWindow;
        function get content():IWindowContainer;
        function get margins():IMargins;
        function get scaler():IScalerWindow;
        function _Str_5665():void;
        function set _Str_21008(_arg_1:Function):void;
        function get _Str_7032():String;
        function set _Str_7032(_arg_1:String):void;
    }
}
