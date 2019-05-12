package org.openvideoads.vast.playlist
{
    import org.openvideoads.vast.schedule.Stream;

    public interface _Str_4575 
    {
        function _Str_16925(_arg_1:String, _arg_2:_Str_6835=null):void;
        function loadFromString(_arg_1:String):void;
        function newPlaylistItem():_Str_3480;
        function _Str_24277(_arg_1:Stream, _arg_2:int):void;
        function getModel():Array;
        function reset():void;
        function rewind():void;
        function get _Str_24840():int;
        function get _Str_23049():int;
        function _Str_23946(_arg_1:int=0, _arg_2:Boolean=false):XML;
        function _Str_18453(_arg_1:Boolean=false, _arg_2:Boolean=true):String;
        function _Str_22737(_arg_1:Boolean=false):XML;
        function _Str_18213(_arg_1:Boolean=false):String;
        function _Str_22903(_arg_1:Boolean=false):XML;
        function _Str_11606(_arg_1:int):_Str_3480;
        function _Str_24195():Boolean;
        function get length():int;
        function _Str_10087():Array;
        function _Str_23134(_arg_1:Boolean=false):XML;
        function toShortString(_arg_1:Boolean=false):String;
        function toString(_arg_1:Boolean=false):String;
    }
}
