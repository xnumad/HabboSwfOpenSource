package com.sulake.habbo.ui
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.events.MouseEvent;

    public interface IRoomUI extends IUnknown 
    {
        function createDesktop(_arg_1:IRoomSession):IRoomDesktop;
        function get chatContainer():IDisplayObjectWrapper;
        function disposeDesktop(_arg_1:String):void;
        function getDesktop(_arg_1:String):IRoomDesktop;
        function getActiveCanvasId(_arg_1:int):int;
        function set visible(_arg_1:Boolean):void;
        function hideWidget(_arg_1:String):void;
        function showGamePlayerName(_arg_1:int, _arg_2:String, _arg_3:uint, _arg_4:int):void;
        function mouseEventPositionHasContextMenu(_arg_1:MouseEvent):Boolean;
        function triggerbottomBarResize():void;
    }
}
