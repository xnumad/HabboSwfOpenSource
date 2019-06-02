package com.sulake.core.window
{
    import com.sulake.core.window.utils.IIterable;
    import flash.geom.Point;

    public interface IWindowContainer extends IWindow, IIterable 
    {
        function get numChildren():int;
        function addChild(_arg_1:IWindow):IWindow;
        function addChildAt(_arg_1:IWindow, _arg_2:int):IWindow;
        function getChildAt(_arg_1:int):IWindow;
        function getChildByID(_arg_1:int):IWindow;
        function getChildByTag(_arg_1:String):IWindow;
        function getChildByName(_arg_1:String):IWindow;
        function getChildIndex(_arg_1:IWindow):int;
        function findChildByTag(_arg_1:String):IWindow;
        function findChildByName(_arg_1:String):IWindow;
        function removeChild(_arg_1:IWindow):IWindow;
        function removeChildAt(_arg_1:int):IWindow;
        function setChildIndex(_arg_1:IWindow, _arg_2:int):void;
        function swapChildren(_arg_1:IWindow, _arg_2:IWindow):void;
        function swapChildrenAt(_arg_1:int, _arg_2:int):void;
        function groupChildrenWithID(_arg_1:uint, _arg_2:Array, _arg_3:int=0):uint;
        function groupChildrenWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function getChildUnderPoint(_arg_1:Point):IWindow;
        function groupChildrenUnderPoint(_arg_1:Point, _arg_2:Array):void;
    }
}
