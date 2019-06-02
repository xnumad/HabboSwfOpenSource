//com.sulake.habbo.room.object.logic.furniture.FurnitureMannequinLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureMannequinLogic extends FurnitureLogic {

        private static const KEY_GENDER:String;
        private static const KEY_FIGURE:String;
        private static const KEY_OUTFIT_NAME:String;

        public function FurnitureMannequinLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function setObjectVariables():void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

