package com.sulake.habbo.ui.widget
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.window.IWindow;

    public interface IRoomWidget 
    {
        function get state():int;
        function initialize(_arg_1:int=0):void;
        function dispose():void;
        function set messageListener(_arg_1:IRoomWidgetMessageListener):void;
        function registerUpdateEvents(_arg_1:IEventDispatcher):void;
        function unregisterUpdateEvents(_arg_1:IEventDispatcher):void;
        function get mainWindow():IWindow;
    }
}
