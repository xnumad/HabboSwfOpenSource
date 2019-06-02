//com.sulake.habbo.room.object.logic.furniture.FurnitureDiceLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureDiceLogic extends FurnitureLogic {

        private var _noTags:Boolean;
        private var _noTagsLastStateActivate:Boolean;

        public function FurnitureDiceLogic();

        override public function getEventTypes():Array;

        override public function initialize(k:XML):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

