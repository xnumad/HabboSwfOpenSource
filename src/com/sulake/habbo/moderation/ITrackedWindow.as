package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;

    public interface ITrackedWindow extends IDisposable 
    {
        function getType():int;
        function getId():String;
        function _Str_2259():IFrameWindow;
        function show():void;
    }
}
