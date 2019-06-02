//com.sulake.habbo.room.object.logic.furniture.FurnitureLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.habbo.room.object.logic.MovingObjectLogic;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectHeightUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class FurnitureLogic extends MovingObjectLogic {

        private static const BOUNCE_STEPS:int;
        private static const BOUNCE_STEP_HEIGHT:Number;

        private var _mouseOver:Boolean;
        private var _sizeX:Number = 0;
        private var _sizeY:Number = 0;
        private var _sizeZ:Number = 0;
        private var _centerX:Number = 0;
        private var _centerY:Number = 0;
        private var _centerZ:Number = 0;
        private var _directionInitialized:Boolean;
        private var _bouncingStep:int;
        private var _storedRotateMessage:RoomObjectUpdateMessage;
        private var _locationOffset:Vector3d;
        private var _directions:Array;

        public function FurnitureLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function set object(k:IRoomObjectController):void;

        override public function initialize(k:XML):void;

        protected function getAdClickUrl(k:IRoomObjectModelController):String;

        protected function handleAdClick(k:int, _arg_2:String, _arg_3:String):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function useObject():void;

        private function handleDataUpdateMessage(k:RoomObjectDataUpdateMessage):void;

        private function handleHeightUpdateMessage(k:RoomObjectHeightUpdateMessage):void;

        private function handleItemDataUpdateMessage(k:RoomObjectItemDataUpdateMessage):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override protected function getLocationOffset():IVector3d;

        override public function update(k:int):void;

        override public function tearDown():void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

