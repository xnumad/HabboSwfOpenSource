package com.sulake.room.object.logic
{
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.events.IEventDispatcher;

    public interface IRoomObjectEventHandler extends IRoomObjectMouseHandler 
    {
        function set object(_arg_1:IRoomObjectController):void;
        function get object():IRoomObjectController;
        function dispose():void;
        function initialize(_arg_1:XML):void;
        function tearDown():void;
        function update(_arg_1:int):void;
        function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void;
        function useObject():void;
        function set eventDispatcher(_arg_1:IEventDispatcher):void;
        function get eventDispatcher():IEventDispatcher;
        function getEventTypes():Array;
        function get widget():String;
        function get contextMenu():String;
    }
}
