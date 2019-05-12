package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.IDisposable;

    public interface IPlayListController extends IDisposable 
    {
        function get priority():int;
        function get length():int;
        function get _Str_15560():int;
        function get _Str_13794():int;
        function get isPlaying():Boolean;
        function _Str_4666(_arg_1:int):ISongInfo;
        function _Str_5930():void;
    }
}
