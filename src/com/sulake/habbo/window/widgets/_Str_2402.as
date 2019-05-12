package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.IWidget;
    import com.sulake.core.window.utils.IBitmapDataContainer;

    public interface _Str_2402 extends IWidget, IBitmapDataContainer 
    {
        function get type():String;
        function set type(_arg_1:String):void;
        function get badgeId():String;
        function set badgeId(_arg_1:String):void;
        function get groupId():int;
        function set groupId(_arg_1:int):void;
    }
}
