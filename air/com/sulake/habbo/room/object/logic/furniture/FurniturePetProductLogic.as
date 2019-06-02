//com.sulake.habbo.room.object.logic.furniture.FurniturePetProductLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurniturePetProductLogic extends FurnitureLogic {

        public function FurniturePetProductLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

