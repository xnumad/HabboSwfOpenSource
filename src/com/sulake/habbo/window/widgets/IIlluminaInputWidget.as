package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.IWidget;

    public interface IIlluminaInputWidget extends IWidget
    {
        function get message():String;
        function set message(_arg_1:String):void;
        function get submitHandler():IIlluminaInputHandler;
        function set submitHandler(_arg_1:IIlluminaInputHandler):void;
        function get buttonCaption():String;
        function set buttonCaption(_arg_1:String):void;
        function get emptyMessage():String;
        function set emptyMessage(_arg_1:String):void;
        function get multiline():Boolean;
        function set multiline(_arg_1:Boolean):void;
        function get maxChars():int;
        function set maxChars(_arg_1:int):void;
    }
}
