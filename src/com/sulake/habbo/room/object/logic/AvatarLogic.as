package com.sulake.habbo.room.object.logic
{
	import com.sulake.habbo.room.object.logic.MovingObjectLogic;
    import com.sulake.room.utils.Vector3d;
    import flash.utils.getTimer;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectMoveEvent;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarMutedUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayingGameMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGuideStatusUpdateMessage;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExpressionUpdateMessage;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.habbo.room.messages.RoomObjectAvatarOwnMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.events.MouseEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;

    public class AvatarLogic extends MovingObjectLogic 
    {
        private static const WARP_WARN_THRESHOLD:Number = 1.5;
        private static const EFFECT_TYPE_SPLASH:int = 28;
        private static const EFFECT_TYPE_SWIM:int = 29;
        private static const EFFECT_SPLASH_LENGTH:int = 184;
        private static const CARRY_ITEM_NULL:int = 185;
        private static const CARRY_ITEM_LAST_CONSUMABLE:int = 500;
        private static const CARRY_ITEM_EMPTY_HAND:int = 0;
        private static const CARRY_ITEM_DELAY_BEFORE_USE:int = 999;
        private static const CARRY_ITEM_EMPTY_HAND_ANIMATION_LENGTH:int = 999999999;
        private static const _Str_18795:int = 5000;
        private static const _Str_17418:int = 1500;

        private var _selected:Boolean = false;
        private var _reportedLoc:Vector3d = null;
        private var _effectChangeTimeStamp:int = 0;
        private var _newEffect:int = 0;
        private var _talkingEndTimeStamp:int = 0;
        private var _talkingPauseEndTimeStamp:int = 0;
        private var _talkingPauseStartTimeStamp:int = 0;
        private var _animationEndTimeStamp:int = 0;
        private var _gestureEndTimeStamp:int = 0;
        private var _signEndTimeStamp:int = 0;
        private var _carryObjectStartTimeStamp:int = 0;
        private var _carryObjectEndTimeStamp:int = 0;
        private var _allowUseCarryObject:Boolean = false;
        private var _blinkingEndTimeStamp:int = 0;
        private var _blinkingStartTimeStamp:int = 0;
        private var _numberValueEndTimeStamp:int = 0;

        public function AvatarLogic()
        {
            this._blinkingStartTimeStamp = (getTimer() + this.getBlinkInterval());
        }

        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectMouseEvent.ROE_MOUSE_CLICK, RoomObjectMoveEvent.ROME_POSITION_CHANGED, RoomObjectMouseEvent.ROE_MOUSE_ENTER, RoomObjectMouseEvent.ROE_MOUSE_LEAVE, RoomObjectFurnitureActionEvent.MOUSE_BUTTON, RoomObjectFurnitureActionEvent.MOUSE_ARROW];
            return getAllEventTypes(super.getEventTypes(), k);
        }

        override public function dispose():void
        {
            var k:RoomObjectEvent;
            if (((this._selected) && (!(object == null))))
            {
                if (eventDispatcher != null)
                {
                    k = new RoomObjectMoveEvent(RoomObjectMoveEvent.ROME_OBJECT_REMOVED, object);
                    eventDispatcher.dispatchEvent(k);
                }
            }
            super.dispose();
            this._reportedLoc = null;
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:RoomObjectAvatarPostureUpdateMessage;
            var _local_4:RoomObjectAvatarChatUpdateMessage;
            var _local_5:RoomObjectAvatarTypingUpdateMessage;
            var _local_6:RoomObjectAvatarMutedUpdateMessage;
            var _local_7:RoomObjectAvatarPlayingGameMessage;
            var _local_8:RoomObjectAvatarUpdateMessage;
            var _local_9:RoomObjectAvatarGestureUpdateMessage;
            var _local_10:RoomObjectAvatarDanceUpdateMessage;
            var _local_11:RoomObjectAvatarSleepUpdateMessage;
            var _local_12:RoomObjectAvatarPlayerValueUpdateMessage;
            var _local_13:RoomObjectAvatarEffectUpdateMessage;
            var _local_14:int;
            var _local_15:int;
            var _local_16:RoomObjectAvatarCarryObjectUpdateMessage;
            var _local_17:RoomObjectAvatarUseObjectUpdateMessage;
            var _local_18:RoomObjectAvatarSignUpdateMessage;
            var _local_19:RoomObjectAvatarFlatControlUpdateMessage;
            var _local_20:Number;
            var _local_21:RoomObjectAvatarFigureUpdateMessage;
            var _local_22:String;
            var _local_23:String;
            var _local_24:String;
            var _local_25:RoomObjectAvatarSelectedMessage;
            var _local_26:RoomObjectAvatarGuideStatusUpdateMessage;
            if (((k == null) || (object == null)))
            {
                return;
            }
            super.processUpdateMessage(k);
            var _local_2:IRoomObjectModelController = object.getModelController();
            if ((k is RoomObjectAvatarPostureUpdateMessage))
            {
                _local_3 = (k as RoomObjectAvatarPostureUpdateMessage);
                _local_2.setString(RoomObjectVariableEnum.FIGURE_POSTURE, _local_3.postureType);
                _local_2.setString(RoomObjectVariableEnum.FIGURE_POSTURE_PARAMETER, _local_3.parameter);
                return;
            }
            if ((k is RoomObjectAvatarChatUpdateMessage))
            {
                _local_4 = (k as RoomObjectAvatarChatUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_TALK, 1);
                this._talkingEndTimeStamp = (getTimer() + (_local_4.numberOfWords * 1000));
                return;
            }
            if ((k is RoomObjectAvatarTypingUpdateMessage))
            {
                _local_5 = (k as RoomObjectAvatarTypingUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_IS_TYPING, Number(_local_5._Str_7319));
                return;
            }
            if ((k is RoomObjectAvatarMutedUpdateMessage))
            {
                _local_6 = (k as RoomObjectAvatarMutedUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_IS_MUTED, Number(_local_6.isMuted));
                return;
            }
            if ((k is RoomObjectAvatarPlayingGameMessage))
            {
                _local_7 = (k as RoomObjectAvatarPlayingGameMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_IS_PLAYING_GAME, Number(_local_7.isPlayingGame));
                return;
            }
            if ((k is RoomObjectAvatarUpdateMessage))
            {
                _local_8 = (k as RoomObjectAvatarUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.HEAD_DIRECTION, _local_8.dirHead);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_CAN_STAND_UP, Number(_local_8.canStandUp));
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_VERTICAL_OFFSET, _local_8.baseY);
                return;
            }
            if ((k is RoomObjectAvatarGestureUpdateMessage))
            {
                _local_9 = (k as RoomObjectAvatarGestureUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_GESTURE, _local_9.gesture);
                this._gestureEndTimeStamp = (getTimer() + (3 * 1000));
                return;
            }
            if ((k is RoomObjectAvatarExpressionUpdateMessage))
            {
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION, RoomObjectAvatarExpressionUpdateMessage(k).expressionType);
                this._animationEndTimeStamp = AvatarAction.getExpressionTime(_local_2.getNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION));
                if (this._animationEndTimeStamp > -1)
                {
                    this._animationEndTimeStamp = (this._animationEndTimeStamp + getTimer());
                }
                return;
            }
            if ((k is RoomObjectAvatarDanceUpdateMessage))
            {
                _local_10 = (k as RoomObjectAvatarDanceUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_DANCE, _local_10._Str_8263);
                return;
            }
            if ((k is RoomObjectAvatarSleepUpdateMessage))
            {
                _local_11 = (k as RoomObjectAvatarSleepUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_SLEEP, Number(_local_11.isSleeping));
                return;
            }
            if ((k is RoomObjectAvatarPlayerValueUpdateMessage))
            {
                _local_12 = (k as RoomObjectAvatarPlayerValueUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_NUMBER_VALUE, _local_12.value);
                this._numberValueEndTimeStamp = (getTimer() + 3000);
                return;
            }
            if ((k is RoomObjectAvatarEffectUpdateMessage))
            {
                _local_13 = (k as RoomObjectAvatarEffectUpdateMessage);
                _local_14 = _local_13.effect;
                _local_15 = _local_13.delayMilliSeconds;
                this.updateEffect(_local_14, _local_15, _local_2);
                return;
            }
            if ((k is RoomObjectAvatarCarryObjectUpdateMessage))
            {
                _local_16 = (k as RoomObjectAvatarCarryObjectUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT, _local_16._Str_2887);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT, 0);
                this._carryObjectStartTimeStamp = getTimer();
                if (_local_16._Str_2887 < CARRY_ITEM_EMPTY_HAND_ANIMATION_LENGTH)
                {
                    this._carryObjectEndTimeStamp = 0;
                    this._allowUseCarryObject = (_local_16._Str_2887 <= CARRY_ITEM_DELAY_BEFORE_USE);
                }
                else
                {
                    this._carryObjectEndTimeStamp = (this._carryObjectStartTimeStamp + _Str_17418);
                    this._allowUseCarryObject = false;
                }
                return;
            }
            if ((k is RoomObjectAvatarUseObjectUpdateMessage))
            {
                _local_17 = (k as RoomObjectAvatarUseObjectUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT, _local_17._Str_2887);
                return;
            }
            if ((k is RoomObjectAvatarSignUpdateMessage))
            {
                _local_18 = (k as RoomObjectAvatarSignUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_SIGN, _local_18.signType);
                this._signEndTimeStamp = (getTimer() + (5 * 1000));
                return;
            }
            if ((k is RoomObjectAvatarFlatControlUpdateMessage))
            {
                _local_19 = (k as RoomObjectAvatarFlatControlUpdateMessage);
                _local_20 = parseInt(_local_19.rawData);
                if ((((_local_20 == _local_20) && (_local_20 >= 0)) && (_local_20 <= 5)))
                {
                    _local_2.setNumber(RoomObjectVariableEnum.FIGURE_FLAT_CONTROL, _local_20);
                }
                else
                {
                    _local_2.setNumber(RoomObjectVariableEnum.FIGURE_FLAT_CONTROL, 0);
                }
                return;
            }
            if ((k is RoomObjectAvatarFigureUpdateMessage))
            {
                _local_21 = (k as RoomObjectAvatarFigureUpdateMessage);
                _local_22 = _local_2.getString(RoomObjectVariableEnum.FIGURE);
                _local_23 = _local_21.figure;
                _local_24 = _local_21.gender;
                if (((!(_local_22 == null)) && (!(_local_22.indexOf(".bds-") == -1))))
                {
                    _local_23 = (_local_23 + _local_22.substr(_local_22.indexOf(".bds-")));
                }
                _local_2.setString(RoomObjectVariableEnum.FIGURE, _local_23);
                _local_2.setString(RoomObjectVariableEnum.GENDER, _local_24);
                return;
            }
            if ((k is RoomObjectAvatarSelectedMessage))
            {
                _local_25 = (k as RoomObjectAvatarSelectedMessage);
                this._selected = _local_25.selected;
                this._reportedLoc = null;
                return;
            }
            if ((k is RoomObjectAvatarGuideStatusUpdateMessage))
            {
                _local_26 = (k as RoomObjectAvatarGuideStatusUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_GUIDE_STATUS, _local_26.guideStatus);
                return;
            }
            if ((k is RoomObjectAvatarOwnMessage))
            {
                _local_2.setNumber(RoomObjectVariableEnum.OWN_USER, 1);
                return;
            }
        }

        private function updateEffect(k:int, _arg_2:int, _arg_3:IRoomObjectModelController):void
        {
            if (k == EFFECT_TYPE_SPLASH)
            {
                this._effectChangeTimeStamp = (getTimer() + CARRY_ITEM_LAST_CONSUMABLE);
                this._newEffect = EFFECT_TYPE_SWIM;
            }
            else
            {
                if (k == EFFECT_SPLASH_LENGTH)
                {
                    this._effectChangeTimeStamp = (getTimer() + CARRY_ITEM_LAST_CONSUMABLE);
                    this._newEffect = CARRY_ITEM_NULL;
                }
                else
                {
                    if (_arg_3.getNumber(RoomObjectVariableEnum.FIGURE_EFFECT) == EFFECT_TYPE_SWIM)
                    {
                        this._effectChangeTimeStamp = (getTimer() + CARRY_ITEM_LAST_CONSUMABLE);
                        this._newEffect = k;
                        k = EFFECT_TYPE_SPLASH;
                    }
                    else
                    {
                        if (_arg_3.getNumber(RoomObjectVariableEnum.FIGURE_EFFECT) == CARRY_ITEM_NULL)
                        {
                            this._effectChangeTimeStamp = (getTimer() + CARRY_ITEM_LAST_CONSUMABLE);
                            this._newEffect = k;
                            k = EFFECT_SPLASH_LENGTH;
                        }
                        else
                        {
                            if (_arg_2 == 0)
                            {
                                this._effectChangeTimeStamp = 0;
                            }
                            else
                            {
                                this._effectChangeTimeStamp = (getTimer() + _arg_2);
                                this._newEffect = k;
                                return;
                            }
                        }
                    }
                }
            }
            _arg_3.setNumber(RoomObjectVariableEnum.FIGURE_EFFECT, k);
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_5:RoomObjectEvent;
            if (((object == null) || (k == null)))
            {
                return;
            }
            var _local_3:IRoomObjectModelController = object.getModelController();
            var _local_4:String;
            switch (k.type)
            {
                case MouseEvent.CLICK:
                    _local_4 = RoomObjectMouseEvent.ROE_MOUSE_CLICK;
                    break;
                case MouseEvent.ROLL_OVER:
                    _local_4 = RoomObjectMouseEvent.ROE_MOUSE_ENTER;
                    if (_local_3 != null)
                    {
                        _local_3.setNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT, 1);
                    }
                    eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.MOUSE_BUTTON, object));
                    break;
                case MouseEvent.ROLL_OUT:
                    if (_local_3 != null)
                    {
                        _local_3.setNumber(RoomObjectVariableEnum.FIGURE_HIGHLIGHT, 0);
                    }
                    _local_4 = RoomObjectMouseEvent.ROE_MOUSE_LEAVE;
                    eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.MOUSE_ARROW, object));
                    break;
            }
            if (_local_4 != null)
            {
                if (eventDispatcher != null)
                {
                    _local_5 = new RoomObjectMouseEvent(_local_4, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                    eventDispatcher.dispatchEvent(_local_5);
                }
            }
        }

        override public function update(k:int):void
        {
            var _local_2:IVector3d;
            var _local_3:RoomObjectEvent;
            var _local_4:IRoomObjectModelController;
            super.update(k);
            if (((this._selected) && (!(object == null))))
            {
                if (eventDispatcher != null)
                {
                    _local_2 = object.getLocation();
                    if (((((this._reportedLoc == null) || (!(this._reportedLoc.x == _local_2.x))) || (!(this._reportedLoc.y == _local_2.y))) || (!(this._reportedLoc.z == _local_2.z))))
                    {
                        if (this._reportedLoc == null)
                        {
                            this._reportedLoc = new Vector3d();
                        }
                        this._reportedLoc.assign(_local_2);
                        _local_3 = new RoomObjectMoveEvent(RoomObjectMoveEvent.ROME_POSITION_CHANGED, object);
                        eventDispatcher.dispatchEvent(_local_3);
                    }
                }
            }
            if (object != null)
            {
                _local_4 = object.getModelController();
                if (_local_4 != null)
                {
                    this._Str_1620(k, _local_4);
                }
            }
        }

        private function _Str_1620(k:int, _arg_2:IRoomObjectModelController):void
        {
            if (this._talkingEndTimeStamp > 0)
            {
                if (k > this._talkingEndTimeStamp)
                {
                    _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_TALK, 0);
                    this._talkingEndTimeStamp = 0;
                    this._talkingPauseStartTimeStamp = 0;
                    this._talkingPauseEndTimeStamp = 0;
                }
                else
                {
                    if (((this._talkingPauseEndTimeStamp == 0) && (this._talkingPauseStartTimeStamp == 0)))
                    {
                        this._talkingPauseStartTimeStamp = (k + this.getTalkingPauseInterval());
                        this._talkingPauseEndTimeStamp = (this._talkingPauseStartTimeStamp + this.getTalkingPauseLength());
                    }
                    else
                    {
                        if (((this._talkingPauseStartTimeStamp > 0) && (k > this._talkingPauseStartTimeStamp)))
                        {
                            _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_TALK, 0);
                            this._talkingPauseStartTimeStamp = 0;
                        }
                        else
                        {
                            if (((this._talkingPauseEndTimeStamp > 0) && (k > this._talkingPauseEndTimeStamp)))
                            {
                                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_TALK, 1);
                                this._talkingPauseEndTimeStamp = 0;
                            }
                        }
                    }
                }
            }
            if (((this._animationEndTimeStamp > 0) && (k > this._animationEndTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION, 0);
                this._animationEndTimeStamp = 0;
            }
            if (((this._gestureEndTimeStamp > 0) && (k > this._gestureEndTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_GESTURE, 0);
                this._gestureEndTimeStamp = 0;
            }
            if (((this._signEndTimeStamp > 0) && (k > this._signEndTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_SIGN, -1);
                this._signEndTimeStamp = 0;
            }
            if (this._carryObjectEndTimeStamp > 0)
            {
                if (k > this._carryObjectEndTimeStamp)
                {
                    _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_CARRY_OBJECT, CARRY_ITEM_EMPTY_HAND);
                    _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT, 0);
                    this._carryObjectStartTimeStamp = (this._carryObjectEndTimeStamp = 0);
                    this._allowUseCarryObject = false;
                }
            }
            if (this._allowUseCarryObject)
            {
                if ((k - this._carryObjectStartTimeStamp) > _Str_18795)
                {
                    if (((k - this._carryObjectStartTimeStamp) % 10000) < 1000)
                    {
                        _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT, 1);
                    }
                    else
                    {
                        _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_USE_OBJECT, 0);
                    }
                }
            }
            if (k > this._blinkingStartTimeStamp)
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_BLINK, 1);
                this._blinkingStartTimeStamp = (k + this.getBlinkInterval());
                this._blinkingEndTimeStamp = (k + this.getBlinkLength());
            }
            if (((this._blinkingEndTimeStamp > 0) && (k > this._blinkingEndTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_BLINK, 0);
                this._blinkingEndTimeStamp = 0;
            }
            if (((this._effectChangeTimeStamp > 0) && (k > this._effectChangeTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_EFFECT, this._newEffect);
                this._effectChangeTimeStamp = 0;
            }
            if (((this._numberValueEndTimeStamp > 0) && (k > this._numberValueEndTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_NUMBER_VALUE, 0);
                this._numberValueEndTimeStamp = 0;
            }
        }

        private function getTalkingPauseInterval():int
        {
            return 100 + (Math.random() * 200);
        }

        private function getTalkingPauseLength():int
        {
            return 75 + (Math.random() * 75);
        }

        private function getBlinkInterval():int
        {
            return 4500 + (Math.random() * 1000);
        }

        private function getBlinkLength():int
        {
            return 50 + (Math.random() * 200);
        }

        private function targetIsWarping(k:IVector3d):Boolean
        {
            var _local_2:IVector3d = object.getLocation();
            if (k == null)
            {
                return false;
            }
            if (((_local_2.x == 0) && (_local_2.y == 0)))
            {
                return false;
            }
            if (((Math.abs((_local_2.x - k.x)) > WARP_WARN_THRESHOLD) || (Math.abs((_local_2.y - k.y)) > WARP_WARN_THRESHOLD)))
            {
                return true;
            }
            return false;
        }
    }
}
