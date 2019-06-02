package com.sulake.habbo.toolbar
{
    import com.sulake.core.window.IWindow;

    public interface IExtensionView 
    {
        function set visible(_arg_1:Boolean):void;
        function get visible():Boolean;
        function get screenHeight():uint;
        function attachExtension(_arg_1:String, _arg_2:IWindow, _arg_3:int=-1, _arg_4:Array=null):void;
        function detachExtension(_arg_1:String):void;
        function hasExtension(_arg_1:String):Boolean;
        function set extraMargin(_arg_1:int):void;
        function get extraMargin():int;
        function refreshItemWindow():void;
    }
}
