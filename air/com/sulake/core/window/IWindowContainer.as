//com.sulake.core.window.IWindowContainer

package com.sulake.core.window{
    import com.sulake.core.window.utils.IIterable;
    import flash.geom.Point;

    public /*dynamic*/ interface IWindowContainer extends IWindow, IIterable {

        function get numChildren():int;
        function addChild(k:IWindow):IWindow;
        function addChildAt(k:IWindow, _arg_2:int):IWindow;
        function getChildAt(k:int):IWindow;
        function getChildByID(k:uint):IWindow;
        function getChildByTag(k:String):IWindow;
        function getChildByName(k:String):IWindow;
        function getChildIndex(k:IWindow):int;
        function findChildByTag(k:String):IWindow;
        function findChildByName(k:String):IWindow;
        function removeChild(k:IWindow):IWindow;
        function removeChildAt(k:int):IWindow;
        function setChildIndex(k:IWindow, _arg_2:int):void;
        function swapChildren(k:IWindow, _arg_2:IWindow):void;
        function swapChildrenAt(k:int, _arg_2:int):void;
        function groupChildrenWithID(k:uint, _arg_2:Array, _arg_3:int=0):uint;
        function groupChildrenWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint;
        function getChildUnderPoint(k:Point):IWindow;
        function groupChildrenUnderPoint(k:Point, _arg_2:Array):void;

    }
}//package com.sulake.core.window

