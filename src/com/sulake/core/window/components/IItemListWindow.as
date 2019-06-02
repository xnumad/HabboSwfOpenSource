package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;

    public interface IItemListWindow extends IWindow, IScrollableWindow, IIterable 
    {
        function get spacing():int;
        function set spacing(_arg_1:int):void;
        function get _Str_3640():Boolean;
        function set _Str_3640(_arg_1:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(_arg_1:Boolean):void;
        function get _Str_3583():Boolean;
        function set _Str_3583(_arg_1:Boolean):void;
        function get numListItems():int;
        function addListItem(_arg_1:IWindow):IWindow;
        function addListItemAt(_arg_1:IWindow, _arg_2:uint):IWindow;
        function getListItemAt(_arg_1:uint):IWindow;
        function getListItemByID(_arg_1:uint):IWindow;
        function getListItemByName(_arg_1:String):IWindow;
        function getListItemByTag(_arg_1:String):IWindow;
        function getListItemIndex(_arg_1:IWindow):int;
        function removeListItem(_arg_1:IWindow):IWindow;
        function removeListItemAt(_arg_1:int):IWindow;
        function setListItemIndex(_arg_1:IWindow, _arg_2:int):void;
        function swapListItems(_arg_1:IWindow, _arg_2:IWindow):void;
        function groupListItemsWithID(_arg_1:uint, _arg_2:Array, _arg_3:int=0):uint;
        function groupListItemsWithTag(_arg_1:String, _arg_2:Array, _arg_3:int=0):uint;
        function swapListItemsAt(_arg_1:int, _arg_2:int):void;
        function removeListItems():void;
        function destroyListItems():void;
        function arrangeListItems():void;
        function populate(_arg_1:Array):void;
        function stopDragging():void;
        function set disableAutodrag(_arg_1:Boolean):void;
        function get _Str_8004():Boolean;
        function set _Str_8004(_arg_1:Boolean):void;
        function get scrollableWindow():IWindow;
    }
}
