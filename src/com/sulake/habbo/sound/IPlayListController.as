package com.sulake.habbo.sound
{
    import com.sulake.core.runtime.IDisposable;

    public interface IPlayListController extends IDisposable 
    {
        function get priority():int;
        function get length():int;
        function get playPosition():int;
        function get nowPlayingSongId():int;
        function get isPlaying():Boolean;
        function getEntry(_arg_1:int):ISongInfo;
        function requestPlayList():void;
    }
}
