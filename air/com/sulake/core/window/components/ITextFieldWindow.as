//com.sulake.core.window.components.ITextFieldWindow

package com.sulake.core.window.components{
    public /*dynamic*/ interface ITextFieldWindow extends ITextWindow, IFocusWindow, IInteractiveWindow {

        function get editable():Boolean;
        function set editable(k:Boolean):void;
        function get selectable():Boolean;
        function set selectable(k:Boolean):void;
        function get displayAsPassword():Boolean;
        function set displayAsPassword(k:Boolean):void;
        function get displayRaw():Boolean;
        function set displayRaw(k:Boolean):void;
        function setSelection(k:int, _arg_2:int):void;
        function get selectionBeginIndex():int;
        function get selectionEndIndex():int;
        function get restrict():String;
        function set restrict(k:String):void;
        function requestChangeEvent():void;
        function getWordAt(k:int, _arg_2:int):String;

    }
}//package com.sulake.core.window.components

