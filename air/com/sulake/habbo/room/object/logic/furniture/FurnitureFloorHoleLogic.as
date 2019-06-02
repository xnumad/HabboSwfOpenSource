//com.sulake.habbo.room.object.logic.furniture.FurnitureFloorHoleLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureFloorHoleLogic extends FurnitureMultiStateLogic {

        private static const STATE_HOLE:int;

        private var _currentState:int;
        private var _currentLoc:Vector3d;

        public function FurnitureFloorHoleLogic();

        override public function initialize(k:XML):void;

        override public function dispose():void;

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function handleStateUpdate(k:int):void;

        private function handleAutomaticStateUpdate():void;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

