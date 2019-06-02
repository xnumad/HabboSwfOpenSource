//com.sulake.habbo.room.object.logic.furniture.FurnitureBadgeDisplayLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureBadgeDisplayLogic extends FurnitureLogic {

        public function FurnitureBadgeDisplayLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;

        protected function updateBadge(k:String):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

