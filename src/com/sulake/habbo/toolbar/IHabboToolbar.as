package com.sulake.habbo.toolbar
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import com.sulake.core.window.motion.Motion;
    import com.sulake.core.window.IWindow;

    public interface IHabboToolbar extends IUnknown 
    {
        function get events():IEventDispatcher;
        function getIconLocation(_arg_1:String):Rectangle;
        function createTransitionToIcon(_arg_1:String, _arg_2:BitmapData, _arg_3:int, _arg_4:int):Motion;
        function updateVisibility(_arg_1:String):void;
        function setAssetUri(_arg_1:String, _arg_2:BitmapData):void;
        function getRect():Rectangle;
        function get extensionView():IExtensionView;
        function setIconVisibility(_arg_1:String, _arg_2:Boolean):void;
        function toggleWindowVisibility(_arg_1:String):void;
        function set onDuty(_arg_1:Boolean):void;
        function get toolBarAreaWidth():int;
        function _Str_6621(_arg_1:String):IWindow;
    }
}
