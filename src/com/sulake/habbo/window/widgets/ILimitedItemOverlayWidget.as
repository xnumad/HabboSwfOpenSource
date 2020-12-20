package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.IWidget;

    public interface ILimitedItemOverlayWidget extends IWidget
    {
        function set serialNumber(_arg_1:int):void;
        function set seriesSize(_arg_1:int):void;
        function get serialNumber():int;
        function get seriesSize():int;
    }
}
