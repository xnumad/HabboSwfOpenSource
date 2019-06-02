//com.sulake.room.object.logic.IRoomObjectEventHandler

package com.sulake.room.object.logic{
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IRoomObjectEventHandler extends IRoomObjectMouseHandler {

        function set object(k:IRoomObjectController):void;
        function get object():IRoomObjectController;
        function dispose():void;
        function initialize(k:XML):void;
        function tearDown():void;
        function update(k:int):void;
        function processUpdateMessage(k:RoomObjectUpdateMessage):void;
        function useObject():void;
        function set eventDispatcher(k:IEventDispatcher):void;
        function get eventDispatcher():IEventDispatcher;
        function getEventTypes():Array;
        function get widget():String;
        function get contextMenu():String;

    }
}//package com.sulake.room.object.logic

