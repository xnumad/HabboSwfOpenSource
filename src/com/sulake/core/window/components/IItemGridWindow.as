package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;

    public interface IItemGridWindow extends IWindow, IScrollableWindow, IIterable 
    {
        function get spacing():int;
        function set spacing(_arg_1:int):void;
        function set verticalSpacing(_arg_1:int):void;
        function get scaleToFitItems():Boolean;
        function set scaleToFitItems(_arg_1:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(_arg_1:Boolean):void;
        function get resizeOnItemUpdate():Boolean;
        function set resizeOnItemUpdate(_arg_1:Boolean):void;
        function get numColumns():uint;
        function get numRows():uint;
        function get numGridItems():uint;
        function addGridItem(_arg_1:IWindow):IWindow;
        function addGridItemAt(_arg_1:IWindow, _arg_2:uint):IWindow;
        function getGridItemAt(_arg_1:uint):IWindow;
        function getGridItemByID(_arg_1:uint):IWindow;
        function getGridItemByName(_arg_1:String):IWindow;
        function getGridItemByTag(_arg_1:String):IWindow;
        function getGridItemIndex(_arg_1:IWindow):int;
        function removeGridItem(_arg_1:IWindow):IWindow;
        function removeGridItemAt(_arg_1:int):IWindow;
        function setGridItemIndex(_arg_1:IWindow, _arg_2:int):void;
        function swapGridItems(_arg_1:IWindow, _arg_2:IWindow):void;
        function swapGridItemsAt(_arg_1:int, _arg_2:int):void;
        function removeGridItems():void;
        function destroyGridItems():void;
        function set shouldRebuildGridOnResize(_arg_1:Boolean):void;
        function get shouldRebuildGridOnResize():Boolean;
        function rebuildGridStructure():void;
        function set containerResizeToColumns(_arg_1:Boolean):void;
        function get containerResizeToColumns():Boolean;
        function populate(_arg_1:Array):void;
    }
}
