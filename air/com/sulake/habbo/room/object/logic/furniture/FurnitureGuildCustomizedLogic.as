//com.sulake.habbo.room.object.logic.furniture.FurnitureGuildCustomizedLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureGuildCustomizedLogic extends FurnitureMultiStateLogic {

        public static const GUILD_ID_STUFFDATA_KEY:int;
        public static const BADGE_CODE_STUFFDATA_KEY:int;
        public static const COLOR_1_STUFFDATA_KEY:int;
        public static const COLOR_2_STUFFDATA_KEY:int;

        public function FurnitureGuildCustomizedLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        protected function openContextMenu():void;

        private function updateGuildColors(k:String, _arg_2:String):void;

        private function updateGuildBadge(k:String):void;

        protected function updateGuildId(k:String):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

