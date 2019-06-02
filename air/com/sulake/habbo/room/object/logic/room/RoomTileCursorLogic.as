//com.sulake.habbo.room.object.logic.room.RoomTileCursorLogic

package com.sulake.habbo.room.object.logic.room{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomTileCursorLogic extends ObjectLogicBase {

        private static const STATE_ENABLED:int;
        private static const STATE_DISABLED:int;
        private static const STATE_SHOW_TILE_HEIGHT:int;

        private var _lastEventId:String;

        public function RoomTileCursorLogic();

        override public function initialize(k:XML):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;


    }
}//package com.sulake.habbo.room.object.logic.room

