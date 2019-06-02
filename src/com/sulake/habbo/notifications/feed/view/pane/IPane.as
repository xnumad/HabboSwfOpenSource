package com.sulake.habbo.notifications.feed.view.pane
{
    import com.sulake.core.runtime.IDisposable;

    public interface IPane extends IDisposable 
    {
        function get _Str_16687():int;
        function set isVisible(_arg_1:Boolean):void;
        function get isVisible():Boolean;
    }
}
