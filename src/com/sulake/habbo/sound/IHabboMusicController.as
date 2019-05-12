package com.sulake.habbo.sound
{
    import flash.events.IEventDispatcher;

    public interface IHabboMusicController 
    {
        function _Str_6500(_arg_1:int=-1):IPlayListController;
        function _Str_16230():int;
        function _Str_19508(_arg_1:int):int;
        function _Str_20038(_arg_1:int):int;
        function _Str_3255(_arg_1:int):ISongInfo;
        function _Str_6665(_arg_1:int):int;
        function _Str_9539(_arg_1:int, _arg_2:int, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0.5, _arg_6:Number=0.5):Boolean;
        function stop(_arg_1:int):void;
        function _Str_13991(_arg_1:int):void;
        function _Str_7732(_arg_1:int):void;
        function _Str_14232():void;
        function _Str_21359(_arg_1:int):void;
        function _Str_7935(_arg_1:Number):void;
        function _Str_20915(_arg_1:Array):void;
        function get _Str_19189():Array;
        function get events():IEventDispatcher;
        function dispose():void;
    }
}
