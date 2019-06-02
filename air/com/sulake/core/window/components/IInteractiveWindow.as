//com.sulake.core.window.components.IInteractiveWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface IInteractiveWindow extends IWindow {

        function set toolTipCaption(k:String):void;
        function get toolTipCaption():String;
        function set toolTipDelay(k:uint):void;
        function get toolTipDelay():uint;
        function set toolTipIsDynamic(k:Boolean):void;
        function get toolTipIsDynamic():Boolean;
        function showToolTip(k:IToolTipWindow):void;
        function hideToolTip():void;
        function setMouseCursorForState(k:uint, _arg_2:uint):uint;
        function getMouseCursorByState(k:uint):uint;

    }
}//package com.sulake.core.window.components

