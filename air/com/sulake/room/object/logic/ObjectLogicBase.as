//com.sulake.room.object.logic.ObjectLogicBase

package com.sulake.room.object.logic{
    import flash.events.IEventDispatcher;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.geom.Point;

    public class ObjectLogicBase implements IRoomObjectEventHandler {

        private var _events:IEventDispatcher;
        private var _object:IRoomObjectController;

        public function ObjectLogicBase();

        public function get eventDispatcher():IEventDispatcher;

        public function set eventDispatcher(k:IEventDispatcher):void;

        public function getEventTypes():Array;

        protected function getAllEventTypes(k:Array, _arg_2:Array):Array;

        public function dispose():void;

        public function set object(k:IRoomObjectController):void;

        public function get object():IRoomObjectController;

        public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        public function initialize(k:XML):void;

        public function update(k:int):void;

        public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        public function useObject():void;

        public function tearDown():void;

        public function get widget():String;

        public function get contextMenu():String;

        public function handleRoomTouchAtLocation(k:Point, _arg_2:IRoomGeometry, _arg_3:String):void;


    }
}//package com.sulake.room.object.logic

