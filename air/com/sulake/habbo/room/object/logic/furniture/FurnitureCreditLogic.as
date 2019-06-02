//com.sulake.habbo.room.object.logic.furniture.FurnitureCreditLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureCreditLogic extends FurnitureLogic {

        public function FurnitureCreditLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function initialize(k:XML):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

