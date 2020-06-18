package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.IWidget;

    public interface IIlluminaChatBubbleWidget extends IWidget
    {
        function get flipped():Boolean;
        function set flipped(_arg_1:Boolean):void;
        function get userName():String;
        function set userName(_arg_1:String):void;
        function get userId():int;
        function set userId(_arg_1:int):void;
        function get figure():String;
        function set figure(_arg_1:String):void;
        function get message():String;
        function set message(_arg_1:String):void;
        function get timeStamp():Number;
        function set timeStamp(_arg_1:Number):void;
        function set friendOnlineStatus(_arg_1:Boolean):void;
    }
}
