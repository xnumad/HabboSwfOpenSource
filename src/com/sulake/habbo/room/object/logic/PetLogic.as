package com.sulake.habbo.room.object.logic
{
	import com.sulake.habbo.room.object.logic.MovingObjectLogic;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import com.sulake.habbo.room.events.RoomObjectMoveEvent;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.utils.XMLValidator;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.object.IRoomObjectModelController;
    import flash.utils.getTimer;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;
    import flash.events.MouseEvent;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class PetLogic extends MovingObjectLogic 
    {
        private var _talkingEndTimeStamp:int = 0;
        private var _gestureEndTimeStamp:int = 0;
        private var _expressionEndTimeStamp:int = 0;
        private var _selected:Boolean = false;
        private var _reportedLoc:Vector3d = null;
        private var _debugMode:Boolean = false;
        private var _postureIndex:int = 0;
        private var _gestureIndex:int = 0;
        private var _headDirectionDelta:int = 0;
        private var _debugDirectionIndex:int = 0;
        private var _directions:Array;

        public function PetLogic()
        {
            this._directions = [];
            super();
        }

        override public function getEventTypes():Array
        {
            var k:Array = [RoomObjectMouseEvent.ROE_MOUSE_CLICK, RoomObjectMoveEvent.ROME_POSITION_CHANGED];
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
            this._directions = null;
            super.dispose();
            this._reportedLoc = null;
        }

        override public function initialize(k:XML):void
        {
            var _local_5:XML;
            var _local_6:int;
            super.initialize(k);
            this._directions = [];
            var _local_2:XMLList = k.model.directions.direction;
            var _local_3:Array = ["id"];
            var _local_4:int;
            while (_local_4 < _local_2.length())
            {
                _local_5 = _local_2[_local_4];
                if (XMLValidator.checkRequiredAttributes(_local_5, _local_3))
                {
                    _local_6 = parseInt(_local_5.@id);
                    this._directions.push(_local_6);
                }
                _local_4++;
            }
            this._directions.sort(Array.NUMERIC);
            object.getModelController().setNumberArray(RoomObjectVariableEnum.PET_ALLOWED_DIRECTIONS, this._directions, true);
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:RoomObjectAvatarPostureUpdateMessage;
            var _local_4:RoomObjectAvatarUpdateMessage;
            var _local_5:RoomObjectAvatarChatUpdateMessage;
            var _local_6:RoomObjectAvatarPetGestureUpdateMessage;
            var _local_7:RoomObjectAvatarSleepUpdateMessage;
            var _local_8:RoomObjectAvatarSelectedMessage;
            var _local_9:RoomObjectAvatarExperienceUpdateMessage;
            var _local_10:RoomObjectAvatarFigureUpdateMessage;
            var _local_11:String;
            var _local_12:PetFigureData;
            if (((k == null) || (object == null)))
            {
                return;
            }
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (!this._debugMode)
            {
                super.processUpdateMessage(k);
                if ((k is RoomObjectAvatarPostureUpdateMessage))
                {
                    _local_3 = (k as RoomObjectAvatarPostureUpdateMessage);
                    _local_2.setString(RoomObjectVariableEnum.FIGURE_POSTURE, _local_3.postureType);
                    return;
                }
                if ((k is RoomObjectAvatarUpdateMessage))
                {
                    _local_4 = (k as RoomObjectAvatarUpdateMessage);
                    _local_2.setNumber(RoomObjectVariableEnum.HEAD_DIRECTION, _local_4.dirHead);
                    return;
                }
                if ((k is RoomObjectAvatarChatUpdateMessage))
                {
                    _local_5 = (k as RoomObjectAvatarChatUpdateMessage);
                    _local_2.setNumber(RoomObjectVariableEnum.FIGURE_TALK, 1);
                    this._talkingEndTimeStamp = (getTimer() + (_local_5.numberOfWords * 1000));
                    return;
                }
                if ((k is RoomObjectAvatarPetGestureUpdateMessage))
                {
                    _local_6 = (k as RoomObjectAvatarPetGestureUpdateMessage);
                    _local_2.setString(RoomObjectVariableEnum.FIGURE_GESTURE, _local_6.gesture);
                    this._gestureEndTimeStamp = (getTimer() + (3 * 1000));
                    return;
                }
                if ((k is RoomObjectAvatarSleepUpdateMessage))
                {
                    _local_7 = (k as RoomObjectAvatarSleepUpdateMessage);
                    _local_2.setNumber(RoomObjectVariableEnum.FIGURE_SLEEP, Number(_local_7.isSleeping));
                    return;
                }
            }
            if ((k is RoomObjectAvatarSelectedMessage))
            {
                _local_8 = (k as RoomObjectAvatarSelectedMessage);
                this._selected = _local_8.selected;
                this._reportedLoc = null;
                return;
            }
            if ((k is RoomObjectAvatarExperienceUpdateMessage))
            {
                _local_9 = (k as RoomObjectAvatarExperienceUpdateMessage);
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_EXPERIENCE_TIMESTAMP, Number(getTimer()));
                _local_2.setNumber(RoomObjectVariableEnum.FIGURE_GAINED_EXPERIENCE, Number(_local_9._Str_18578));
                return;
            }
            if ((k is RoomObjectAvatarFigureUpdateMessage))
            {
                _local_10 = (k as RoomObjectAvatarFigureUpdateMessage);
                _local_11 = _local_2.getString(RoomObjectVariableEnum.FIGURE);
                _local_12 = new PetFigureData(_local_10.figure);
                _local_2.setString(RoomObjectVariableEnum.FIGURE, _local_10.figure);
                _local_2.setString(RoomObjectVariableEnum.RACE, _local_10.race);
                _local_2.setNumber(RoomObjectVariableEnum.PET_PALETTE_INDEX, _local_12.paletteId);
                _local_2.setNumber(RoomObjectVariableEnum.PET_COLOR, _local_12.color);
                _local_2.setNumber(RoomObjectVariableEnum.PET_TYPE, _local_12.typeId);
                _local_2.setNumberArray(RoomObjectVariableEnum.PET_CUSTOM_LAYER_IDS, _local_12.customLayerIds);
                _local_2.setNumberArray(RoomObjectVariableEnum.PET_CUSTOM_PARTS_IDS, _local_12.customPartIds);
                _local_2.setNumberArray(RoomObjectVariableEnum.PET_CUSTOM_PALETTE_IDS, _local_12.customPaletteIds);
                _local_2.setNumber(RoomObjectVariableEnum.PET_IS_RIDING, ((_local_10.isRiding) ? 1 : 0));
                return;
            }
        }

        override public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_7:int;
            var _local_8:RoomObjectEvent;
            if (((object == null) || (k == null)))
            {
                return;
            }
            var _local_3:IRoomObjectModelController = object.getModelController();
            var _local_4:IVector3d;
            var _local_5:Vector3d;
            var _local_6:String;
            switch (k.type)
            {
                case MouseEvent.CLICK:
                    _local_6 = RoomObjectMouseEvent.ROE_MOUSE_CLICK;
                    if (this._debugMode)
                    {
                        this.debugMouseEvent(k);
                    }
                    break;
                case MouseEvent.DOUBLE_CLICK:
                    break;
                case MouseEvent.MOUSE_DOWN:
                    if (!this._debugMode)
                    {
                        _local_7 = _local_3.getNumber(RoomObjectVariableEnum.PET_TYPE);
                        if (_local_7 == PetTypeEnum.MONSTERPLANT)
                        {
                            if (eventDispatcher != null)
                            {
                                _local_8 = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROE_MOUSE_DOWN, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                                eventDispatcher.dispatchEvent(_local_8);
                            }
                        }
                    }
                    break;
            }
            if (_local_6 != null)
            {
                if (eventDispatcher != null)
                {
                    _local_8 = new RoomObjectMouseEvent(_local_6, object, k.eventId, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
                    eventDispatcher.dispatchEvent(_local_8);
                }
            }
        }

        private function debugMouseEvent(k:RoomSpriteMouseEvent):void
        {
            var _local_3:int;
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (((!(k.altKey)) && (!(k.ctrlKey))))
            {
                _local_3 = this._directions[this._debugDirectionIndex];
                object.setDirection(new Vector3d(_local_3));
                _local_2.setNumber(RoomObjectVariableEnum.HEAD_DIRECTION, (_local_3 + this._headDirectionDelta));
                this._debugDirectionIndex++;
                if (this._debugDirectionIndex == this._directions.length)
                {
                    this._debugDirectionIndex = 0;
                }
            }
            else
            {
                if (((k.altKey) && (!(k.ctrlKey))))
                {
                    this._postureIndex++;
                    _local_2.setNumber(RoomObjectVariableEnum.FIGURE_POSTURE, this._postureIndex);
                    _local_2.setNumber(RoomObjectVariableEnum.FIGURE_GESTURE, NaN);
                }
                else
                {
                    if (((k.ctrlKey) && (!(k.altKey))))
                    {
                        this._gestureIndex++;
                        _local_2.setNumber(RoomObjectVariableEnum.FIGURE_GESTURE, this._gestureIndex);
                    }
                    else
                    {
                        this._headDirectionDelta = (this._headDirectionDelta + 45);
                        if (this._headDirectionDelta > 45)
                        {
                            this._headDirectionDelta = -45;
                        }
                        _local_3 = object.getDirection().x;
                        _local_2.setNumber(RoomObjectVariableEnum.HEAD_DIRECTION, (_local_3 + this._headDirectionDelta));
                    }
                }
            }
        }

        override public function update(k:int):void
        {
            var _local_2:IVector3d;
            var _local_3:RoomObjectEvent;
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
            if (((!(object == null)) && (!(object.getModelController() == null))))
            {
                this._Str_1620(k, object.getModelController());
            }
        }

        private function _Str_1620(k:int, _arg_2:IRoomObjectModelController):void
        {
            if (((this._gestureEndTimeStamp > 0) && (k > this._gestureEndTimeStamp)))
            {
                _arg_2.setString(RoomObjectVariableEnum.FIGURE_GESTURE, null);
                this._gestureEndTimeStamp = 0;
            }
            if (this._talkingEndTimeStamp > 0)
            {
                if (k > this._talkingEndTimeStamp)
                {
                    _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_TALK, 0);
                    this._talkingEndTimeStamp = 0;
                }
            }
            if (((this._expressionEndTimeStamp > 0) && (k > this._expressionEndTimeStamp)))
            {
                _arg_2.setNumber(RoomObjectVariableEnum.FIGURE_EXPRESSION, 0);
                this._expressionEndTimeStamp = 0;
            }
        }
    }
}
