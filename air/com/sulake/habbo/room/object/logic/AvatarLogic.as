//com.sulake.habbo.room.object.logic.AvatarLogic

package com.sulake.habbo.room.object.logic{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;

    public class AvatarLogic extends MovingObjectLogic {

        private static const WARP_WARN_THRESHOLD:Number;
        private static const EFFECT_TYPE_SPLASH:int;
        private static const EFFECT_TYPE_SWIM:int;
        private static const EFFECT_SPLASH_LENGTH:int;
        private static const CARRY_ITEM_NULL:int;
        private static const CARRY_ITEM_LAST_CONSUMABLE:int;
        private static const CARRY_ITEM_EMPTY_HAND:int;
        private static const CARRY_ITEM_DELAY_BEFORE_USE:int;
        private static const CARRY_ITEM_EMPTY_HAND_ANIMATION_LENGTH:int;

        private var _selected:Boolean;
        private var _reportedLoc:Vector3d;
        private var _effectChangeTimeStamp:int;
        private var _newEffect:int;
        private var _talkingEndTimeStamp:int;
        private var _talkingPauseEndTimeStamp:int;
        private var _talkingPauseStartTimeStamp:int;
        private var _animationEndTimeStamp:int;
        private var _gestureEndTimeStamp:int;
        private var _signEndTimeStamp:int;
        private var _carryObjectStartTimeStamp:int;
        private var _carryObjectEndTimeStamp:int;
        private var _allowUseCarryObject:Boolean;
        private var _blinkingEndTimeStamp:int;
        private var _blinkingStartTimeStamp:int;
        private var _numberValueEndTimeStamp:int;

        public function AvatarLogic();

        override public function getEventTypes():Array;

        override public function dispose():void;

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void;

        private function updateEffect(k:int, _arg_2:int, _arg_3:IRoomObjectModelController):void;

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void;

        override public function update(k:int):void;

        private function updateActions(k:int, _arg_2:IRoomObjectModelController):void;

        private function getTalkingPauseInterval():int;

        private function getTalkingPauseLength():int;

        private function getBlinkInterval():int;

        private function getBlinkLength():int;

        private function targetIsWarping(k:IVector3d):Boolean;


    }
}//package com.sulake.habbo.room.object.logic

