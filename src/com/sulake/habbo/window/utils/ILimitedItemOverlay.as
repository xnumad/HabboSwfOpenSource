package com.sulake.habbo.window.utils
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;

    public interface ILimitedItemOverlay extends IDisposable
    {
        function get window():IWindowContainer;
        function set serialNumber(_arg_1:int):void;
        function set seriesSize(_arg_1:int):void;
    }
}
