//com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBackgroundColorLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureRoomBackgroundColorLogic extends FurnitureMultiStateLogic {

        private var _roomColorUpdated:Boolean;

        public function FurnitureRoomBackgroundColorLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function setupObject():void;

        override public function dispose():void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

