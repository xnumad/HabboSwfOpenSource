//com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBrandingLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.core.runtime.events.LowMemoryEvent;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureRoomBrandingLogic extends FurnitureLogic {

        public static const STUFF_DATA_KEY_STATE:String;
        public static const STUFF_DATA_KEY_IMAGEURL:String;
        public static const STUFF_DATA_KEY_CLICKURL:String;
        public static const STUFF_DATA_KEY_OFFSET_X:String;
        public static const STUFF_DATA_KEY_OFFSET_Y:String;
        public static const STUFF_DATA_KEY_OFFSET_Z:String;
        private static var _lowMemWarningApplied:Boolean;

        protected var _disableFurnitureSelection:Boolean;
        protected var _clickUrlSupported:Boolean;

        public function FurnitureRoomBrandingLogic();

        override public function dispose():void;

        private function onLowMemory(k:LowMemoryEvent):void;

        override public function initialize(k:XML):void;

        override public function getEventTypes():Array;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function setupImageFromFurnitureData():Boolean;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        private function updateOffset(k:String, _arg_2:int, _arg_3:int):Boolean;


    }
}//package com.sulake.habbo.room.object.logic.furniture

