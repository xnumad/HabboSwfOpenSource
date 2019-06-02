package com.sulake.core.window.components
{
    public interface ITextFieldWindow extends ITextWindow, IFocusWindow, IInteractiveWindow 
    {
        function get editable():Boolean;
        function set editable(_arg_1:Boolean):void;
        function get selectable():Boolean;
        function set selectable(_arg_1:Boolean):void;
        function get displayAsPassword():Boolean;
        function set displayAsPassword(_arg_1:Boolean):void;
        function get _Str_16747():Boolean;
        function set _Str_16747(_arg_1:Boolean):void;
        function setSelection(_arg_1:int, _arg_2:int):void;
        function get selectionBeginIndex():int;
        function get selectionEndIndex():int;
        function get restrict():String;
        function set restrict(_arg_1:String):void;
        function requestChangeEvent():void;
        function getWordAt(_arg_1:int, _arg_2:int):String;
    }
}
