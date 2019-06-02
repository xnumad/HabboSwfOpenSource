//com.sulake.habbo.room.object.logic.furniture.FurnitureOneWayDoorLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureOneWayDoorLogic extends FurnitureLogic {

        public function FurnitureOneWayDoorLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

