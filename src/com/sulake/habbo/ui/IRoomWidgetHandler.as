package com.sulake.habbo.ui
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public interface IRoomWidgetHandler extends IDisposable 
    {
        function get type():String;
        function set container(_arg_1:IRoomWidgetHandlerContainer):void;
        function getWidgetMessages():Array;
        function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent;
        function getProcessedEvents():Array;
        function processEvent(_arg_1:Event):void;
        function update():void;
    }
}
