//com.sulake.habbo.room.object.logic.furniture.FurnitureRandomStateLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureRandomStateLogic extends FurnitureLogic {

        public function FurnitureRandomStateLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

