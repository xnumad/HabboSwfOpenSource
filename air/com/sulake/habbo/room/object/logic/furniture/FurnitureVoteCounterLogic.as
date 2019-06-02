//com.sulake.habbo.room.object.logic.furniture.FurnitureVoteCounterLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureVoteCounterLogic extends FurnitureMultiStateLogic {

        private static const UPDATE_INTERVAL:int;
        private static const MAX_UPDATE_TIME:int;

        private var _total:int;
        private var _lastUpdate:int;
        private var _updateInterval:int;

        public function FurnitureVoteCounterLogic();

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function get currentTotal():int;

        private function updateTotal(k:int):void;

        override public function update(k:int):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

