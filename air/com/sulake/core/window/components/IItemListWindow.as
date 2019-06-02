//com.sulake.core.window.components.IItemListWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.IIterable;

    public /*dynamic*/ interface IItemListWindow extends IWindow, IScrollableWindow, IIterable {

        function get spacing():int;
        function set spacing(k:int):void;
        function get scaleToFitItems():Boolean;
        function set scaleToFitItems(k:Boolean):void;
        function get autoArrangeItems():Boolean;
        function set autoArrangeItems(k:Boolean):void;
        function get resizeOnItemUpdate():Boolean;
        function set resizeOnItemUpdate(k:Boolean):void;
        function get numListItems():int;
        function addListItem(k:IWindow):IWindow;
        function addListItemAt(k:IWindow, _arg_2:uint):IWindow;
        function getListItemAt(k:uint):IWindow;
        function getListItemByID(k:uint):IWindow;
        function getListItemByName(k:String):IWindow;
        function getListItemByTag(k:String):IWindow;
        function getListItemIndex(k:IWindow):int;
        function removeListItem(k:IWindow):IWindow;
        function removeListItemAt(k:int):IWindow;
        function setListItemIndex(k:IWindow, _arg_2:int):void;
        function swapListItems(k:IWindow, _arg_2:IWindow):void;
        function groupListItemsWithID(k:uint, _arg_2:Array, _arg_3:int=0):uint;
        function groupListItemsWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint;
        function swapListItemsAt(k:int, _arg_2:int):void;
        function removeListItems():void;
        function destroyListItems():void;
        function arrangeListItems():void;
        function populate(k:Array):void;
        function stopDragging():void;
        function set disableAutodrag(k:Boolean):void;
        function get isPartOfGridWindow():Boolean;
        function set isPartOfGridWindow(k:Boolean):void;
        function get scrollableWindow():IWindow;

    }
}//package com.sulake.core.window.components

