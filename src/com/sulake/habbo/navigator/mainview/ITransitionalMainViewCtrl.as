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
        function _Str_8316(_arg_1:int):Boolean;
        function _Str_2798(_arg_1:int, _arg_2:int, _arg_3:String="-1", _arg_4:int=1):void;
        function update(_arg_1:uint):void;
        function get _Str_6414():TextSearchInputs;
        function _Str_20903(_arg_1:Point):void;
        function get _Str_13071():Boolean;
    }
}
