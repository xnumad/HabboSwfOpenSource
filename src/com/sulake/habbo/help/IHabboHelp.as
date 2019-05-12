package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboHelp extends IUnknown 
    {
        function _Str_18271():void;
        function get events():IEventDispatcher;
        function _Str_17200(_arg_1:int):void;
        function _Str_21718(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:int):void;
        function _Str_6694(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function _Str_25290(_arg_1:int, _arg_2:String):void;
        function _Str_19984(_arg_1:int):void;
        function reportRoom(_arg_1:int, _arg_2:String, _arg_3:String):void;
        function _Str_10138(_arg_1:int, _arg_2:int):void;
        function _Str_11424(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function _Str_12812(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function _Str_14206(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function _Str_1131():void;
        function _Str_8205(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:String=null):void;
        function set _Str_16063(_arg_1:Boolean):void;
        function showHabboWay():void;
        function _Str_8723():void;
        function _Str_24154():void;
    }
}
