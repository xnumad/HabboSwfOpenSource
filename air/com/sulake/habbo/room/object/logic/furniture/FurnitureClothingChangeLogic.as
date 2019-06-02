//com.sulake.habbo.room.object.logic.furniture.FurnitureClothingChangeLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureClothingChangeLogic extends FurnitureLogic {

        public function FurnitureClothingChangeLogic();

        override public function getEventTypes():Array;

        override public function initialize(k:XML):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function updateClothingData(k:String):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

