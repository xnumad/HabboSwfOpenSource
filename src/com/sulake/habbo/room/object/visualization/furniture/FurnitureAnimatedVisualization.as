package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.room.object.visualization.data.AnimationStateData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.visualization.data.AnimationData;
    import com.sulake.habbo.room.object.visualization.data.AnimationFrame;

    public class FurnitureAnimatedVisualization extends FurnitureVisualization 
    {
        public static const _Str_13674:int = 0;

        private var _Str_1033:AnimatedFurnitureVisualizationData = null;
        private var _state:int = -1;
        private var _Str_3566:AnimationStateData;
        private var _Str_16292:int = 0;
        private var _Str_12376:int = 1;
        private var _Str_5575:Number = 0;
        private var _Str_9825:int = 0;
        private var _Str_9006:Boolean = false;

        public function FurnitureAnimatedVisualization()
        {
            this._Str_3566 = new AnimationStateData();
        }

        protected function get _Str_24695():int
        {
            return this._Str_9825;
        }

        protected function get frameIncrease():int
        {
            return this._Str_12376;
        }

        override protected function set direction(k:int):void
        {
            if (super.direction != k)
            {
                super.direction = k;
                this._Str_9006 = true;
            }
        }

        override public function dispose():void
        {
            super.dispose();
            this._Str_1033 = null;
            if (this._Str_3566 != null)
            {
                this._Str_3566.dispose();
                this._Str_3566 = null;
            }
        }

        public function get animationId():int
        {
            return this._Str_3566.animationId;
        }

        protected function getAnimationId(k:AnimationStateData):int
        {
            var _local_2:int = this.animationId;
            if (((!(_local_2 == _Str_13674)) && (this._Str_1033._Str_6839(this._Str_5575, _local_2))))
            {
                return _local_2;
            }
            return _Str_13674;
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            if (!(k is AnimatedFurnitureVisualizationData))
            {
                return false;
            }
            this._Str_1033 = (k as AnimatedFurnitureVisualizationData);
            return super.initialize(k);
        }

        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            var _local_3:IRoomObject;
            var _local_4:int;
            var _local_5:IRoomObjectModel;
            var _local_6:int;
            if (super.updateObject(k, _arg_2))
            {
                _local_3 = object;
                if (_local_3 == null)
                {
                    return false;
                }
                _local_4 = _local_3.getState(0);
                if (_local_4 != this._state)
                {
                    this.setAnimation(_local_4);
                    this._state = _local_4;
                    _local_5 = _local_3.getModel();
                    if (_local_5 != null)
                    {
                        _local_6 = _local_5.getNumber(RoomObjectVariableEnum.FURNITURE_STATE_UPDATE_TIME);
                        this._Str_16292 = _local_6;
                    }
                }
                return true;
            }
            return false;
        }

        override protected function updateModel(k:Number):Boolean
        {
            var _local_2:IRoomObject;
            var _local_3:IRoomObjectModel;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:int;
            if (super.updateModel(k))
            {
                _local_2 = object;
                if (_local_2 != null)
                {
                    _local_3 = _local_2.getModel();
                    if (_local_3 != null)
                    {
                        if (this.usesAnimationResetting())
                        {
                            _local_5 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_STATE_UPDATE_TIME);
                            if (_local_5 > this._Str_16292)
                            {
                                this._Str_16292 = _local_5;
                                this.setAnimation(this._state);
                            }
                        }
                        _local_4 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_AUTOMATIC_STATE_INDEX);
                        if (!isNaN(_local_4))
                        {
                            _local_6 = this._Str_1033.getAnimationId(this._Str_5575, _local_4);
                            this.setAnimation(_local_6);
                        }
                    }
                }
                return true;
            }
            return false;
        }

        private function _Str_25107(k:AnimationStateData, _arg_2:int):Boolean
        {
            var _local_3:int = k.animationId;
            if (((AnimationData.isTransitionFromAnimation(_local_3)) || (AnimationData.isTransitionToAnimation(_local_3))))
            {
                if (_arg_2 == k._Str_5355)
                {
                    if (!k._Str_5293)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        private function _Str_22935(k:AnimationStateData):int
        {
            var _local_2:int = k.animationId;
            if (((AnimationData.isTransitionFromAnimation(_local_2)) || (AnimationData.isTransitionToAnimation(_local_2))))
            {
                return k._Str_5355;
            }
            return _local_2;
        }

        protected function setAnimation(k:int):void
        {
            if (this._Str_1033 != null)
            {
                this._Str_17687(this._Str_3566, k, (this._state >= 0));
            }
        }

        protected function _Str_17687(k:AnimationStateData, _arg_2:int, _arg_3:Boolean=true):Boolean
        {
            var _local_5:int;
            var _local_6:int;
            var _local_4:int = k.animationId;
            if (_arg_3)
            {
                if (this._Str_25107(k, _arg_2))
                {
                    return false;
                }
                _local_5 = this._Str_22935(k);
                if (_arg_2 != _local_5)
                {
                    if (!this._Str_1033._Str_12484(this._Str_5575, _arg_2, _local_5))
                    {
                        _local_6 = AnimationData.getTransitionFromAnimationId(_local_5);
                        if (this._Str_1033._Str_6839(this._Str_5575, _local_6))
                        {
                            k._Str_5355 = _arg_2;
                            _arg_2 = _local_6;
                        }
                        else
                        {
                            _local_6 = AnimationData.getTransitionToAnimationId(_arg_2);
                            if (this._Str_1033._Str_6839(this._Str_5575, _local_6))
                            {
                                k._Str_5355 = _arg_2;
                                _arg_2 = _local_6;
                            }
                        }
                    }
                }
                else
                {
                    if (AnimationData.isTransitionFromAnimation(_local_4))
                    {
                        _local_6 = AnimationData.getTransitionToAnimationId(_arg_2);
                        if (this._Str_1033._Str_6839(this._Str_5575, _local_6))
                        {
                            k._Str_5355 = _arg_2;
                            _arg_2 = _local_6;
                        }
                    }
                    else
                    {
                        if (!AnimationData.isTransitionToAnimation(_local_4))
                        {
                            if (this.usesAnimationResetting())
                            {
                                _local_6 = AnimationData.getTransitionFromAnimationId(_local_5);
                                if (this._Str_1033._Str_6839(this._Str_5575, _local_6))
                                {
                                    k._Str_5355 = _arg_2;
                                    _arg_2 = _local_6;
                                }
                                else
                                {
                                    _local_6 = AnimationData.getTransitionToAnimationId(_arg_2);
                                    if (this._Str_1033._Str_6839(this._Str_5575, _local_6))
                                    {
                                        k._Str_5355 = _arg_2;
                                        _arg_2 = _local_6;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (_local_4 != _arg_2)
            {
                k.animationId = _arg_2;
                return true;
            }
            return false;
        }

        protected function getLastFramePlayed(k:int):Boolean
        {
            return this._Str_3566.getLastFramePlayed(k);
        }

        protected function resetAllAnimationFrames():void
        {
            if (this._Str_3566 != null)
            {
                this._Str_3566.setLayerCount(this._Str_9825);
            }
        }

        override protected function updateAnimation(k:Number):int
        {
            if (this._Str_1033 == null)
            {
                return 0;
            }
            if (k != this._Str_5575)
            {
                this._Str_5575 = k;
                this._Str_9825 = this._Str_1033.getLayerCount(k);
                this.resetAllAnimationFrames();
            }
            var _local_2:int = this.updateAnimations(k);
            this._Str_9006 = false;
            return _local_2;
        }

        protected function updateAnimations(k:Number):int
        {
            var _local_2:int;
            if (((!(this._Str_3566._Str_5293)) || (this._Str_9006)))
            {
                _local_2 = this._Str_18198(this._Str_3566, k);
                if (this._Str_3566._Str_5293)
                {
                    if (((AnimationData.isTransitionFromAnimation(this._Str_3566.animationId)) || (AnimationData.isTransitionToAnimation(this._Str_3566.animationId))))
                    {
                        this.setAnimation(this._Str_3566._Str_5355);
                        this._Str_3566._Str_5293 = false;
                    }
                }
            }
            return _local_2;
        }

        protected function _Str_18198(k:AnimationStateData, _arg_2:Number):int
        {
            var _local_8:Boolean;
            var _local_9:Boolean;
            var _local_10:AnimationFrame;
            var _local_11:int;
            if (((k._Str_5293) && (!(this._Str_9006))))
            {
                return 0;
            }
            var _local_3:int = k._Str_16814;
            var _local_4:int = this.getAnimationId(k);
            if (_local_3 == 0)
            {
                _local_3 = this._Str_1033._Str_9722(_arg_2, _local_4, direction);
            }
            _local_3 = (_local_3 + this.frameIncrease);
            k._Str_16814 = _local_3;
            var _local_5:int;
            k._Str_5293 = true;
            var _local_6:* = (1 << (this._Str_9825 - 1));
            var _local_7:int = (this._Str_9825 - 1);
            while (_local_7 >= 0)
            {
                _local_8 = k.getAnimationPlayed(_local_7);
                if (((!(_local_8)) || (this._Str_9006)))
                {
                    _local_9 = k.getLastFramePlayed(_local_7);
                    _local_10 = k._Str_2259(_local_7);
                    if (_local_10 != null)
                    {
                        if (((_local_10.isLastFrame) && (_local_10._Str_9508 <= this.frameIncrease)))
                        {
                            _local_9 = true;
                        }
                    }
                    if ((((this._Str_9006) || (_local_10 == null)) || ((_local_10._Str_9508 >= 0) && ((_local_10._Str_9508 = (_local_10._Str_9508 - this.frameIncrease)) <= 0))))
                    {
                        _local_11 = AnimationFrame.SEQUENCE_NOT_DEFINED;
                        if (_local_10 != null)
                        {
                            _local_11 = _local_10.activeSequence;
                        }
                        if (_local_11 == AnimationFrame.SEQUENCE_NOT_DEFINED)
                        {
                            _local_10 = this._Str_1033._Str_2259(_arg_2, _local_4, direction, _local_7, _local_3);
                        }
                        else
                        {
                            _local_10 = this._Str_1033._Str_7945(_arg_2, _local_4, direction, _local_7, _local_11, (_local_10.activeSequenceOffset + _local_10.repeats), _local_3);
                        }
                        k.setFrame(_local_7, _local_10);
                        _local_5 = (_local_5 | _local_6);
                    }
                    if (((_local_10 == null) || (_local_10._Str_9508 == AnimationFrame.FRAME_REPEAT_FOREVER)))
                    {
                        _local_9 = true;
                        _local_8 = true;
                    }
                    else
                    {
                        k._Str_5293 = false;
                    }
                    k.setLastFramePlayed(_local_7, _local_9);
                    k.setAnimationPlayed(_local_7, _local_8);
                }
                _local_6 = (_local_6 >> 1);
                _local_7--;
            }
            return _local_5;
        }

        override protected function getFrameNumber(k:int, _arg_2:int):int
        {
            var _local_3:AnimationFrame = this._Str_3566._Str_2259(_arg_2);
            if (_local_3 != null)
            {
                return _local_3.id;
            }
            return super.getFrameNumber(k, _arg_2);
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int = super.getSpriteXOffset(k, _arg_2, _arg_3);
            var _local_5:AnimationFrame = this._Str_3566._Str_2259(_arg_3);
            if (_local_5 != null)
            {
                _local_4 = (_local_4 + _local_5.x);
            }
            return _local_4;
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int = super.getSpriteYOffset(k, _arg_2, _arg_3);
            var _local_5:AnimationFrame = this._Str_3566._Str_2259(_arg_3);
            if (_local_5 != null)
            {
                _local_4 = (_local_4 + _local_5.y);
            }
            return _local_4;
        }

        protected function usesAnimationResetting():Boolean
        {
            return false;
        }
    }
}
