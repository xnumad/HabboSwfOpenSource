package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;

    public interface IInteractiveWindow extends IWindow 
    {
        function set _Str_2613(_arg_1:String):void;
        function get _Str_2613():String;
        function set _Str_3099(_arg_1:uint):void;
        function get _Str_3099():uint;
        function set _Str_4074(_arg_1:Boolean):void;
        function get _Str_4074():Boolean;
        function showToolTip(_arg_1:IToolTipWindow):void;
        function hideToolTip():void;
        function setMouseCursorForState(_arg_1:uint, _arg_2:uint):uint;
        function getMouseCursorByState(_arg_1:uint):uint;
    }
}
