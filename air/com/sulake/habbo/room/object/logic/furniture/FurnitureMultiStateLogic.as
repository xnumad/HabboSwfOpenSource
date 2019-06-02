//com.sulake.habbo.room.object.logic.furniture.FurnitureMultiStateLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureMultiStateLogic extends FurnitureLogic {

        public function FurnitureMultiStateLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

