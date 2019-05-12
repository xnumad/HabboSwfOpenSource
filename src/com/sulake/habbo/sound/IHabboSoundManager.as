package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboSoundManager extends IUnknown 
    {
        function set _Str_3960(_arg_1:Number):void;
        function set _Str_3410(_arg_1:Number):void;
        function set _Str_3488(_arg_1:Number):void;
        function get _Str_3960():Number;
        function get _Str_3410():Number;
        function get _Str_3488():Number;
        function get _Str_2774():IHabboMusicController;
        function _Str_4375(_arg_1:String, _arg_2:int=0):void;
        function _Str_25775(_arg_1:String):void;
        function _Str_20382(_arg_1:String, _arg_2:Number):IHabboSound;
        function _Str_17576(_arg_1:int, _arg_2:String):IHabboSound;
        function mute(_arg_1:Boolean):void;
        function _Str_15711(_arg_1:Number, _arg_2:Number, _arg_3:Number):void;
        function get events():IEventDispatcher;
    }
}
