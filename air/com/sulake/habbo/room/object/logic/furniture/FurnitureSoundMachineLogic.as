//com.sulake.habbo.room.object.logic.furniture.FurnitureSoundMachineLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureSoundMachineLogic extends FurnitureMultiStateLogic {

        private var _disposeEventsAllowed:Boolean;
        private var _isInitialized:Boolean;
        private var _currentState:int;

        public function FurnitureSoundMachineLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function requestInitialize():void;

        private function requestPlayList():void;

        private function requestStopPlaying():void;

        private function requestDispose():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

