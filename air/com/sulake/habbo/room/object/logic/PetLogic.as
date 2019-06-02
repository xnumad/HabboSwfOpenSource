//com.sulake.habbo.room.object.logic.PetLogic

package com.sulake.habbo.room.object.logic{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.IRoomObjectModelController;

    public class PetLogic extends MovingObjectLogic {

        private var _talkingEndTimeStamp:int;
        private var _gestureEndTimeStamp:int;
        private var _expressionEndTimeStamp:int;
        private var _selected:Boolean;
        private var _reportedLoc:Vector3d;
        private var _debugMode:Boolean;
        private var _postureIndex:int;
        private var _gestureIndex:int;
        private var _headDirectionDelta:int;
        private var _debugDirectionIndex:int;
        private var _directions:Array;

        public function PetLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function initialize(k:XML):void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        private function debugMouseEvent(k:RoomSpriteMouseEvent):void;

        override public function update(k:int):void;

        private function updateActions(k:int, _arg_2:IRoomObjectModelController):void;


    }
}//package com.sulake.habbo.room.object.logic

