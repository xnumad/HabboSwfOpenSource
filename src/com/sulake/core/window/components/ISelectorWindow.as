package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;

    public interface ISelectorWindow extends IWindow 
    {
        function get numSelectables():uint;
        function getSelected():ISelectableWindow;
        function setSelected(_arg_1:ISelectableWindow):void;
        function addSelectable(_arg_1:ISelectableWindow):ISelectableWindow;
        function addSelectableAt(_arg_1:ISelectableWindow, _arg_2:int):ISelectableWindow;
        function getSelectableAt(_arg_1:int):ISelectableWindow;
        function getSelectableByID(_arg_1:uint):ISelectableWindow;
        function getSelectableByTag(_arg_1:String):ISelectableWindow;
        function getSelectableByName(_arg_1:String):ISelectableWindow;
        function getSelectableIndex(_arg_1:ISelectableWindow):int;
        function removeSelectable(_arg_1:ISelectableWindow):ISelectableWindow;
    }
}
