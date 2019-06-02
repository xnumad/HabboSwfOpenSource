//com.sulake.habbo.room.object.logic.furniture.FurnitureFriendFurniLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureFriendFurniLogic extends FurnitureMultiStateLogic {

        private static const STATE_UNINITIALIZED:int;
        private static const STATE_UNLOCKED:int;
        private static const STATE_LOCKED:int;

        private var _state:int;

        public function FurnitureFriendFurniLogic();

        protected function get engravingDialogType():int;

        override public function get contextMenu():String;

        override public function getEventTypes():Array;

        override public function initialize(k:XML):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

