//com.sulake.habbo.room.object.logic.furniture.FurnitureFireworksLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureFireworksLogic extends FurnitureLogic {

        public function FurnitureFireworksLogic();

        override public function getEventTypes():Array;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;

        override public function initialize(k:XML):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

