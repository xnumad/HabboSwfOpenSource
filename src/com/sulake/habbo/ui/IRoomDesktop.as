package com.sulake.habbo.ui
{
    import flash.events.IEventDispatcher;
    import flash.events.Event;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.IRoomWidget;

    public interface IRoomDesktop 
    {
        function get events():IEventDispatcher;
        function processEvent(_arg_1:Event):void;
        function get roomSession():IRoomSession;
        function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent;
        function getWidget(_arg_1:String):IRoomWidget;
    }
}
