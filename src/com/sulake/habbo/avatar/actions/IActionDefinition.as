package com.sulake.habbo.avatar.actions
{
    public interface IActionDefinition 
    {
        function get id():String;
        function get state():String;
        function get precedence():int;
        function get activePartSet():String;
        function get isMain():Boolean;
        function get isDefault():Boolean;
        function get assetPartDefinition():String;
        function get lay():String;
        function get geometryType():String;
        function get isAnimation():Boolean;
        function get startFromFrameZero():Boolean;
        function isAnimated(_arg_1:String):Boolean;
        function getPrevents(_arg_1:String=""):Array;
        function getPreventHeadTurn(_arg_1:String=""):Boolean;
        function setOffsets(_arg_1:String, _arg_2:int, _arg_3:Array):void;
        function getOffsets(_arg_1:String, _arg_2:int):Array;
    }
}
