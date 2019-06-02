//com.sulake.habbo.room.object.logic.furniture.FurnitureChangeStateWhenStepOnLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.habbo.room.events.RoomToObjectOwnAvatarMoveEvent;

    public class FurnitureChangeStateWhenStepOnLogic extends FurnitureLogic {

        public function FurnitureChangeStateWhenStepOnLogic();

        override public function initialize(k:XML):void;

        override public function tearDown():void;

        private function onOwnAvatarMove(k:RoomToObjectOwnAvatarMoveEvent):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

