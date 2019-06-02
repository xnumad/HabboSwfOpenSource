//com.sulake.habbo.room.object.logic.room.RoomLogic

package com.sulake.habbo.room.object.logic.room{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
    import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.geom.Point;

    public class RoomLogic extends ObjectLogicBase {

        protected var _planeParser:RoomPlaneParser;
        private var _planeMaskParser:RoomPlaneBitmapMaskParser;
        private var _color:uint;
        private var _light:int;
        private var _originalColor:uint;
        private var _originalLight:int;
        private var _targetColor:uint;
        private var _targetLight:int;
        private var _colorChangedTime:int;
        private var _colorTransitionLength:int;
        private var _floorHolesUpdated:Boolean;

        public function RoomLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function initialize(k:XML):void;

        override public function update(k:int):void;

        private function updateBackgroundColor(k:int):void;

        private function updatePlaneTypes(k:RoomObjectRoomUpdateMessage, _arg_2:IRoomObjectModelController):void;

        private function updatePlaneMasks(k:RoomObjectRoomMaskUpdateMessage, _arg_2:IRoomObjectModelController):void;

        private function updatePlaneVisibilities(k:RoomObjectRoomPlaneVisibilityUpdateMessage, _arg_2:IRoomObjectModelController):void;

        private function updatePlaneProperties(k:RoomObjectRoomPlanePropertyUpdateMessage, _arg_2:IRoomObjectModelController):void;

        private function updateFloorHoles(k:RoomObjectRoomFloorHoleUpdateMessage, _arg_2:IRoomObjectModelController):void;

        private function updateColors(k:RoomObjectRoomColorUpdateMessage, _arg_2:IRoomObjectModelController):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function handleRoomTouchAtLocation(k:Point, _arg_2:IRoomGeometry, _arg_3:String):void;

        private function handleWallTouchAtLocation(k:Point, _arg_2:IRoomGeometry, _arg_3:String):Boolean;

        public function handleFloorTouchAtLocation(k:Point, _arg_2:IRoomGeometry, _arg_3:String):Boolean;


    }
}//package com.sulake.habbo.room.object.logic.room

