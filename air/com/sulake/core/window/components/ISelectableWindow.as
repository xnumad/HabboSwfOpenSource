//com.sulake.core.window.components.ISelectableWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface ISelectableWindow extends IWindow {

        function get selector():ISelectorWindow;
        function get isSelected():Boolean;
        function set isSelected(k:Boolean):void;
        function select():Boolean;
        function unselect():Boolean;

    }
}//package com.sulake.core.window.components

