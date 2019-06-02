//com.sulake.habbo.room.object.logic.furniture.FurnitureExternalImageLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureExternalImageLogic extends FurnitureMultiStateLogic {

        public function FurnitureExternalImageLogic();

        override public function getEventTypes():Array;

        override public function get widget():String;

        override public function initialize(k:XML):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

