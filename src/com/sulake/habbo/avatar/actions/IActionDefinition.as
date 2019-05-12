package com.sulake.habbo.avatar.actions
{
    public interface IActionDefinition 
    {
        function get id():String;
        function get state():String;
        function get precedence():int;
        function get activePartSet():String;
        function get _Str_779():Boolean;
        function get _Str_804():Boolean;
        function get _Str_778():String;
        function get lay():String;
        function get _Str_868():String;
        function get _Str_861():Boolean;
        function get _Str_812():Boolean;
        function _Str_801(_arg_1:String):Boolean;
        function _Str_733(_arg_1:String=""):Array;
        function _Str_715(_arg_1:String=""):Boolean;
        function _Str_772(_arg_1:String, _arg_2:int, _arg_3:Array):void;
        function _Str_805(_arg_1:String, _arg_2:int):Array;
    }
}
