//com.sulake.core.window.components.ISelectorWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface ISelectorWindow extends IWindow {

        function get numSelectables():uint;
        function getSelected():ISelectableWindow;
        function setSelected(k:ISelectableWindow):void;
        function addSelectable(k:ISelectableWindow):ISelectableWindow;
        function addSelectableAt(k:ISelectableWindow, _arg_2:int):ISelectableWindow;
        function getSelectableAt(k:int):ISelectableWindow;
        function getSelectableByID(k:uint):ISelectableWindow;
        function getSelectableByTag(k:String):ISelectableWindow;
        function getSelectableByName(k:String):ISelectableWindow;
        function getSelectableIndex(k:ISelectableWindow):int;
        function removeSelectable(k:ISelectableWindow):ISelectableWindow;

    }
}//package com.sulake.core.window.components

