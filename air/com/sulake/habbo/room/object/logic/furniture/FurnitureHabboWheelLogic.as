//com.sulake.habbo.room.object.logic.furniture.FurnitureHabboWheelLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureHabboWheelLogic extends FurnitureLogic {

        public function FurnitureHabboWheelLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

