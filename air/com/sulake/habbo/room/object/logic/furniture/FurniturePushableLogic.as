//com.sulake.habbo.room.object.logic.furniture.FurniturePushableLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;

    public class FurniturePushableLogic extends FurnitureMultiStateLogic {

        private static const ANIMATION_NOT_MOVING:int;
        private static const ANIMATION_MOVING:int;
        private static const MAX_ANIMATION_COUNT:int;

        private var _oldLocation:Vector3d;

        public function FurniturePushableLogic();

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        protected function getUpdateIntervalValue(k:int):int;

        protected function getAnimationValue(k:int):int;

        private function handleDataUpdateMessage(k:RoomObjectDataUpdateMessage):void;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

