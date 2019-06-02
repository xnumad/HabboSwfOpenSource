//com.sulake.habbo.room.object.logic.furniture.FurnitureRoomDimmerLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureRoomDimmerLogic extends FurnitureLogic {

        private var _roomColorUpdated:Boolean;

        public function FurnitureRoomDimmerLogic();

        override public function getEventTypes():Array;

        override public function useObject():void;

        override public function dispose():void;

        private function dispatchColorUpdateEvent(k:String):void;

        private function readState(k:String):int;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

