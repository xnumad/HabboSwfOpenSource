//com.sulake.habbo.room.object.logic.furniture.FurnitureScoreBoardLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureScoreBoardLogic extends FurnitureLogic {

        private static const UPDATE_INTERVAL:int;
        private static const MAX_UPDATE_TIME:int;

        private var _score:int;
        private var _lastUpdate:int;
        private var _updateInterval:int;

        public function FurnitureScoreBoardLogic();

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function updateScore(k:int):void;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

