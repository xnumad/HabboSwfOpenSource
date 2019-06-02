//com.sulake.habbo.room.object.logic.furniture.FurniturePresentLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurniturePresentLogic extends FurnitureLogic {

        private static const MESSAGE:String;
        private static const PRODUCT_CODE:String;
        private static const EXTRA_PARAM:String;
        private static const PURCHASER_NAME:String;
        private static const PURCHASER_FIGURE:String;

        public function FurniturePresentLogic();

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function setObjectVariables():void;

        private function setObjectVariable(k:String, _arg_2:String):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;

        override public function initialize(k:XML):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

