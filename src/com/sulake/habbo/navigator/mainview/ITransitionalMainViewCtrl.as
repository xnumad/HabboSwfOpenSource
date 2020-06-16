package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.navigator.TextSearchInputs;
    import flash.geom.Point;

    public interface ITransitionalMainViewCtrl 
    {
        function get disposed():Boolean;
        function _Str_18392():void;
        function dispose():void;
        function open():void;
        function isOpen():Boolean;
        function close():void;
        function get mainWindow():IFrameWindow;
        function refresh():void;
        function reloadRoomList(_arg_1:int):Boolean;
        function startSearch(_arg_1:int, _arg_2:int, _arg_3:String="-1", _arg_4:int=1):void;
        function update(_arg_1:uint):void;
        function get searchInput():TextSearchInputs;
        function openAtPosition(_arg_1:Point):void;
        function get isPhaseOneNavigator():Boolean;
    }
}
