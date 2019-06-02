//com.sulake.habbo.room.object.logic.furniture.FurnitureJukeboxLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureJukeboxLogic extends FurnitureMultiStateLogic {

        private var _disposeEventsAllowed:Boolean;
        private var _isInitialized:Boolean;
        private var _currentState:int;

        public function FurnitureJukeboxLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;

        private function requestInit():void;

        private function requestPlayList():void;

        private function requestStopPlaying():void;

        private function requestDispose():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

