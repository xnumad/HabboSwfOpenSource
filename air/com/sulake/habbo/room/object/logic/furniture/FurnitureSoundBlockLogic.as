//com.sulake.habbo.room.object.logic.furniture.FurnitureSoundBlockLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureSoundBlockLogic extends FurnitureMultiStateLogic {

        private static const HIGHEST_SEMITONE:int;
        private static const LOWEST_SEMITONE:int;
        private static const STATE_UNINITIALIZED:int;

        private var _state:int;
        private var _sampleId:int;
        private var _noPitch:Boolean;

        public function FurnitureSoundBlockLogic();

        override public function dispose():void;

        override public function getEventTypes():Array;

        override public function initialize(k:XML):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function playSoundAt(k:Number):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

