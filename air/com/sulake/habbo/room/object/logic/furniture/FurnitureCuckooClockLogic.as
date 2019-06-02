//com.sulake.habbo.room.object.logic.furniture.FurnitureCuckooClockLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureCuckooClockLogic extends FurnitureMultiStateLogic {

        private var _state:int;
        private var _loc:IVector3d;

        public function FurnitureCuckooClockLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function playSoundAt(k:Number):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

