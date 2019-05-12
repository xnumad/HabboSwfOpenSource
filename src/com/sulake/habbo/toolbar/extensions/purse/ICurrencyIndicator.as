package com.sulake.habbo.toolbar.extensions.purse
{
    import com.sulake.core.window.IWindowContainer;
    import flash.events.IEventDispatcher;

    public interface ICurrencyIndicator 
    {
        function dispose():void;
        function get window():IWindowContainer;
        function registerUpdateEvents(_arg_1:IEventDispatcher):void;
    }
}
