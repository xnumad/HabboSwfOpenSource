//com.sulake.habbo.room.object.logic.furniture.FurnitureIceStormLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;

    public class FurnitureIceStormLogic extends FurnitureMultiStateLogic {

        private var _nextState:int;
        private var _nextStateExtra:Number = 0;
        private var _nextStateTimeStamp:int;

        public function FurnitureIceStormLogic();

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function handleDataUpdateMessage(k:RoomObjectDataUpdateMessage):void;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

