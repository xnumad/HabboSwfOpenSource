package com.sulake.habbo.room.object.visualization.pet
{
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureAnimatedVisualization;
    import com.sulake.habbo.room.object.visualization.data.AnimationStateData;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.habbo.room.object.visualization.data.AnimationData;
    import com.sulake.habbo.room.object.visualization.data.AnimationFrame;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.habbo.room.object.visualization.data.LayerData;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;
    import com.sulake.habbo.room.object.visualization.data.DirectionData;

    public class AnimatedPetVisualization extends FurnitureAnimatedVisualization 
    {
        private static const HEAD:String = "head";
        private static const SADDLE:String = "saddle";
        private static const HAIR:String = "hair";
        private static const ADDITIONAL_SPRITE_COUNT:int = 1;
        private static const EXPERIENCE_BUBBLE_VISIBLE_IN_MS:int = 1000;
        private static const PET_EXPERIENCE_BUBBLE_PNG:String = "pet_experience_bubble_png";
        private static const POSTURE_ANIMATION_INDEX:int = 0;
        private static const GESTURE_ANIMATION_INDEX:int = 1;
        private static const ANIMATION_INDEX_COUNT:int = 2;

        private var _posture:String = "";
        private var _gesture:String = "";
        private var _isSleeping:Boolean = false;
        private var _headDirection:int = 0;
        private var _experienceData:ExperienceData;
        private var _experienceTimeStamp:int = 0;
        private var _experience:int = 0;
        private var _animationData:AnimatedPetVisualizationData = null;
        private var _paletteName:String = "";
        private var _paletteIndex:int = -1;
        private var _customLayerIds:Array;
        private var _customPartIds:Array;
        private var _customPaletteIds:Array;
        private var _color:int = 0xFFFFFF;
        private var _headOnly:Boolean = false;
        private var _isRiding:Boolean = false;
        private var _animationStates:Array;
        private var _animationOver:Boolean = false;
        private var _headSprites:Array;
        private var _nonHeadSprites:Array;
        private var _saddleSprites:Array;
        private var _previousAnimationDirection:int = -1;

        public function AnimatedPetVisualization()
        {
            this._customLayerIds = [];
            this._customPartIds = [];
            this._customPaletteIds = [];
            this._animationStates = [];
            this._headSprites = [];
            this._nonHeadSprites = [];
            this._saddleSprites = [];
            super();
            while (this._animationStates.length < ANIMATION_INDEX_COUNT)
            {
                this._animationStates.push(new AnimationStateData());
            }
        }

        override public function dispose():void
        {
            var k:int;
            var _local_2:AnimationStateData;
            super.dispose();
            if (this._animationStates != null)
            {
                k = 0;
                while (k < this._animationStates.length)
                {
                    _local_2 = (this._animationStates[k] as AnimationStateData);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._animationStates = null;
            }
            if (this._experienceData)
            {
                this._experienceData.dispose();
                this._experienceData = null;
            }
        }

        override protected function getAnimationId(k:AnimationStateData):int
        {
            return k.animationId;
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            var _local_3:BitmapDataAsset;
            if (!(k is AnimatedPetVisualizationData))
            {
                return false;
            }
            this._animationData = (k as AnimatedPetVisualizationData);
            var _local_2:BitmapData;
            if (this._animationData._Str_14822 != null)
            {
                _local_3 = (this._animationData._Str_14822.getAssetByName(PET_EXPERIENCE_BUBBLE_PNG) as BitmapDataAsset);
                if (_local_3 != null)
                {
                    _local_2 = (_local_3.content as BitmapData).clone();
                    this._experienceData = new ExperienceData(_local_2);
                }
            }
            if (super.initialize(k))
            {
                return true;
            }
            return false;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            super.update(k, _arg_2, _arg_3, _arg_4);
            this.updateExperienceBubble(_arg_2);
        }

        override protected function updateAnimation(k:Number):int
        {
            var _local_3:int;
            var _local_2:IRoomObject = object;
            if (_local_2 != null)
            {
                _local_3 = _local_2.getDirection().x;
                if (_local_3 != this._previousAnimationDirection)
                {
                    this._previousAnimationDirection = _local_3;
                    this.resetAllAnimationFrames();
                }
            }
            return super.updateAnimation(k);
        }

        override protected function updateModel(k:Number):Boolean
        {
            var _local_4:String;
            var _local_5:String;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:int;
            var _local_11:Array;
            var _local_12:Array;
            var _local_13:Array;
            var _local_14:int;
            var _local_15:Number;
            var _local_16:int;
            var _local_17:int;
            var _local_2:IRoomObject = object;
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:IRoomObjectModel = _local_2.getModel();
            if (_local_3 == null)
            {
                return false;
            }
            if (_local_3.getUpdateID() != _modelUpdateID)
            {
                _local_4 = _local_3.getString(RoomObjectVariableEnum.FIGURE_POSTURE);
                _local_5 = _local_3.getString(RoomObjectVariableEnum.FIGURE_GESTURE);
                _local_6 = _local_3.getNumber(RoomObjectVariableEnum.FIGURE_POSTURE);
                if (!isNaN(_local_6))
                {
                    _local_16 = this._animationData._Str_17398(_currentScale);
                    if (_local_16 > 0)
                    {
                        _local_4 = this._animationData._Str_14207(_currentScale, (_local_6 % _local_16), true);
                        _local_5 = null;
                    }
                }
                _local_7 = _local_3.getNumber(RoomObjectVariableEnum.FIGURE_GESTURE);
                if (!isNaN(_local_7))
                {
                    _local_17 = this._animationData._Str_16869(_currentScale);
                    if (_local_17 > 0)
                    {
                        _local_5 = this._animationData._Str_17844(_currentScale, (_local_7 % _local_17));
                    }
                }
                this.validateActions(_local_4, _local_5);
                _local_8 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER);
                if (isNaN(_local_8))
                {
                    _local_8 = 1;
                }
                if (_local_8 != _Str_1240)
                {
                    _Str_1240 = _local_8;
                    _Str_11460 = true;
                }
                this._isSleeping = (_local_3.getNumber(RoomObjectVariableEnum.FIGURE_SLEEP) > 0);
                _local_9 = _local_3.getNumber(RoomObjectVariableEnum.HEAD_DIRECTION);
                if (((!(isNaN(_local_9))) && (this._animationData.isAllowedToTurnHead)))
                {
                    this._headDirection = _local_9;
                }
                else
                {
                    this._headDirection = _local_2.getDirection().x;
                }
                this._experienceTimeStamp = _local_3.getNumber(RoomObjectVariableEnum.FIGURE_EXPERIENCE_TIMESTAMP);
                this._experience = _local_3.getNumber(RoomObjectVariableEnum.FIGURE_GAINED_EXPERIENCE);
                _local_10 = _local_3.getNumber(RoomObjectVariableEnum.PET_PALETTE_INDEX);
                if (_local_10 != this._paletteIndex)
                {
                    this._paletteIndex = _local_10;
                    this._paletteName = this._paletteIndex.toString();
                }
                _local_11 = _local_3.getNumberArray(RoomObjectVariableEnum.PET_CUSTOM_LAYER_IDS);
                this._customLayerIds = ((_local_11 != null) ? _local_11 : []);
                _local_12 = _local_3.getNumberArray(RoomObjectVariableEnum.PET_CUSTOM_PARTS_IDS);
                this._customPartIds = ((_local_12 != null) ? _local_12 : []);
                _local_13 = _local_3.getNumberArray(RoomObjectVariableEnum.PET_CUSTOM_PALETTE_IDS);
                this._customPaletteIds = ((_local_13 != null) ? _local_13 : []);
                _local_14 = _local_3.getNumber(RoomObjectVariableEnum.PET_IS_RIDING);
                this._isRiding = ((!(isNaN(_local_14))) && (_local_14 > 0));
                _local_15 = _local_3.getNumber(RoomObjectVariableEnum.PET_COLOR);
                if (((!(isNaN(_local_15))) && (!(_local_15 == this._color))))
                {
                    this._color = _local_15;
                }
                this._headOnly = (_local_3.getNumber(RoomObjectVariableEnum.PET_HEAD_ONLY) > 0);
                _modelUpdateID = _local_3.getUpdateID();
                return true;
            }
            return false;
        }

        private function updateExperienceBubble(k:int):void
        {
            var _local_2:int;
            var _local_3:IRoomObjectSprite;
            if (this._experienceData != null)
            {
                this._experienceData.alpha = 0;
                if (this._experienceTimeStamp > 0)
                {
                    _local_2 = (k - this._experienceTimeStamp);
                    if (_local_2 < EXPERIENCE_BUBBLE_VISIBLE_IN_MS)
                    {
                        this._experienceData.alpha = int((Math.sin(((_local_2 / EXPERIENCE_BUBBLE_VISIBLE_IN_MS) * Math.PI)) * 0xFF));
                        this._experienceData.setExperience(this._experience);
                    }
                    else
                    {
                        this._experienceTimeStamp = 0;
                    }
                    _local_3 = getSprite((spriteCount - 1));
                    if (_local_3 != null)
                    {
                        if (this._experienceData.alpha > 0)
                        {
                            _local_3.asset = this._experienceData.image;
                            _local_3.offsetX = -20;
                            _local_3.offsetY = -80;
                            _local_3.alpha = this._experienceData.alpha;
                            _local_3.visible = true;
                        }
                        else
                        {
                            _local_3.asset = null;
                            _local_3.visible = false;
                        }
                    }
                }
            }
        }

        private function validateActions(k:String, _arg_2:String):void
        {
            var _local_3:int;
            if (k != this._posture)
            {
                this._posture = k;
                _local_3 = this._animationData._Str_17648(_currentScale, k);
                this.setAnimationForIndex(POSTURE_ANIMATION_INDEX, _local_3);
            }
            if (this._animationData._Str_18284(_currentScale, k))
            {
                _arg_2 = null;
            }
            if (_arg_2 != this._gesture)
            {
                this._gesture = _arg_2;
                _local_3 = this._animationData._Str_18268(_currentScale, _arg_2);
                this.setAnimationForIndex(GESTURE_ANIMATION_INDEX, _local_3);
            }
        }

        override protected function updateLayerCount(k:int):void
        {
            super.updateLayerCount(k);
            this._headSprites = [];
        }

        override protected function getAdditionalSpriteCount():int
        {
            return super.getAdditionalSpriteCount() + ADDITIONAL_SPRITE_COUNT;
        }

        override protected function setAnimation(k:int):void
        {
        }

        private function getAnimationStateData(k:int):AnimationStateData
        {
            var _local_2:AnimationStateData;
            if (((k >= 0) && (k < this._animationStates.length)))
            {
                _local_2 = this._animationStates[k];
                return _local_2;
            }
            return null;
        }

        private function setAnimationForIndex(k:int, _arg_2:int):void
        {
            var _local_3:AnimationStateData = this.getAnimationStateData(k);
            if (_local_3 != null)
            {
                if (_Str_17687(_local_3, _arg_2))
                {
                    this._animationOver = false;
                }
            }
        }

        override protected function resetAllAnimationFrames():void
        {
            var _local_2:AnimationStateData;
            this._animationOver = false;
            var k:int = (this._animationStates.length - 1);
            while (k >= 0)
            {
                _local_2 = this._animationStates[k];
                if (_local_2 != null)
                {
                    _local_2.setLayerCount(_Str_24695);
                }
                k--;
            }
        }

        override protected function updateAnimations(k:Number):int
        {
            var _local_5:AnimationStateData;
            var _local_6:int;
            if (this._animationOver)
            {
                return 0;
            }
            var _local_2:Boolean = true;
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < this._animationStates.length)
            {
                _local_5 = this._animationStates[_local_4];
                if (_local_5 != null)
                {
                    if (!_local_5._Str_5293)
                    {
                        _local_6 = _Str_18198(_local_5, k);
                        _local_3 = (_local_3 | _local_6);
                        if (!_local_5._Str_5293)
                        {
                            _local_2 = false;
                        }
                        else
                        {
                            if (((AnimationData.isTransitionFromAnimation(_local_5.animationId)) || (AnimationData.isTransitionToAnimation(_local_5.animationId))))
                            {
                                this.setAnimationForIndex(_local_4, _local_5._Str_5355);
                                _local_2 = false;
                            }
                        }
                    }
                }
                _local_4++;
            }
            this._animationOver = _local_2;
            return _local_3;
        }

        override protected function getFrameNumber(k:int, _arg_2:int):int
        {
            var _local_4:AnimationStateData;
            var _local_5:AnimationFrame;
            var _local_3:int = (this._animationStates.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = this._animationStates[_local_3];
                if (_local_4 != null)
                {
                    _local_5 = _local_4._Str_2259(_arg_2);
                    if (_local_5 != null)
                    {
                        return _local_5.id;
                    }
                }
                _local_3--;
            }
            return super.getFrameNumber(k, _arg_2);
        }

        override protected function getPostureForAssetFile(k:int, _arg_2:String):String
        {
            var _local_7:String;
            var _local_3:Array = _arg_2.split("_");
            var _local_4:int = _local_3.length;
            var _local_5:int;
            while (_local_5 < _local_3.length)
            {
                if (((_local_3[_local_5] == "64") || (_local_3[_local_5] == "32")))
                {
                    _local_4 = (_local_5 + 3);
                    break;
                }
                _local_5++;
            }
            var _local_6:String;
            if (_local_4 < _local_3.length)
            {
                _local_7 = _local_3[_local_4];
                _local_7 = _local_7.split("@")[0];
                _local_6 = this._animationData._Str_14207(k, (int(_local_7) / 100), false);
                if (_local_6 == null)
                {
                    _local_6 = this._animationData._Str_17976(k, (int(_local_7) / 100));
                }
            }
            return _local_6;
        }

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_6:AnimationStateData;
            var _local_7:AnimationFrame;
            var _local_4:int = super.getSpriteXOffset(k, _arg_2, _arg_3);
            var _local_5:int = (this._animationStates.length - 1);
            while (_local_5 >= 0)
            {
                _local_6 = this._animationStates[_local_5];
                if (_local_6 != null)
                {
                    _local_7 = _local_6._Str_2259(_arg_3);
                    if (_local_7 != null)
                    {
                        _local_4 = (_local_4 + _local_7.x);
                    }
                }
                _local_5--;
            }
            return _local_4;
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_6:AnimationStateData;
            var _local_7:AnimationFrame;
            var _local_4:int = super.getSpriteYOffset(k, _arg_2, _arg_3);
            var _local_5:int = (this._animationStates.length - 1);
            while (_local_5 >= 0)
            {
                _local_6 = this._animationStates[_local_5];
                if (_local_6 != null)
                {
                    _local_7 = _local_6._Str_2259(_arg_3);
                    if (_local_7 != null)
                    {
                        _local_4 = (_local_4 + _local_7.y);
                    }
                }
                _local_5--;
            }
            return _local_4;
        }

        override protected function getAsset(k:String, _arg_2:int=-1):IGraphicAsset
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IGraphicAsset;
            if (assetCollection != null)
            {
                _local_3 = this._customLayerIds.indexOf(_arg_2);
                _local_4 = this._paletteName;
                _local_5 = -1;
                _local_6 = -1;
                if (_local_3 > -1)
                {
                    _local_5 = this._customPartIds[_local_3];
                    _local_6 = this._customPaletteIds[_local_3];
                    _local_4 = ((_local_6 > -1) ? String(_local_6) : this._paletteName);
                }
                if (((!(isNaN(_local_5))) && (_local_5 > -1)))
                {
                    k = (k + ("_" + _local_5));
                }
                _local_7 = assetCollection.getAssetWithPalette(k, _local_4);
                return _local_7;
            }
            return null;
        }

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            if (this._animationData == null)
            {
                return LayerData.DEFAULT_Z_OFFSET;
            }
            var _local_4:Number = this._animationData._Str_8329(k, this.getDirection(k, _arg_3), _arg_3);
            return _local_4;
        }

        override protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            var _local_4:int;
            var _local_5:String;
            if (((this._headOnly) && (this.isNonHeadSprite(_arg_2))))
            {
                return null;
            }
            if (((this._isRiding) && (this._parser3(_arg_2))))
            {
                return null;
            }
            var _local_3:int = spriteCount;
            if (_arg_2 < (_local_3 - ADDITIONAL_SPRITE_COUNT))
            {
                _local_4 = _Str_3033(k);
                if (_arg_2 < (_local_3 - (1 + ADDITIONAL_SPRITE_COUNT)))
                {
                    if (_arg_2 >= FurnitureVisualizationData.LAYER_NAMES.length)
                    {
                        return null;
                    }
                    _local_5 = FurnitureVisualizationData.LAYER_NAMES[_arg_2];
                    if (_local_4 == 1)
                    {
                        return (type + "_icon_") + _local_5;
                    }
                    return (((((((type + "_") + _local_4) + "_") + _local_5) + "_") + this.getDirection(k, _arg_2)) + "_") + this.getFrameNumber(_local_4, _arg_2);
                }
                return ((((type + "_") + _local_4) + "_sd_") + this.getDirection(k, _arg_2)) + "_0";
            }
            return null;
        }

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            if (_arg_2 < (spriteCount - ADDITIONAL_SPRITE_COUNT))
            {
                return this._color;
            }
            return 0xFFFFFF;
        }

        private function getDirection(k:int, _arg_2:int):int
        {
            if (this.isHeadSprite(_arg_2))
            {
                return this._animationData._Str_15687(k, this._headDirection);
            }
            return direction;
        }

        private function isHeadSprite(k:int):Boolean
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            if (this._headSprites[k] == null)
            {
                _local_2 = (this._animationData._Str_6014(_currentScale, DirectionData.USE_DEFAULT_DIRECTION, k) == HEAD);
                _local_3 = (this._animationData._Str_6014(_currentScale, DirectionData.USE_DEFAULT_DIRECTION, k) == HAIR);
                if (((_local_2) || (_local_3)))
                {
                    this._headSprites[k] = true;
                }
                else
                {
                    this._headSprites[k] = false;
                }
            }
            return this._headSprites[k];
        }

        private function isNonHeadSprite(k:int):Boolean
        {
            var _local_2:String;
            if (this._nonHeadSprites[k] == null)
            {
                if (k < (spriteCount - (1 + ADDITIONAL_SPRITE_COUNT)))
                {
                    _local_2 = this._animationData._Str_6014(_currentScale, DirectionData.USE_DEFAULT_DIRECTION, k);
                    if (((((!(_local_2 == null)) && (_local_2.length > 0)) && (!(_local_2 == HEAD))) && (!(_local_2 == HAIR))))
                    {
                        this._nonHeadSprites[k] = true;
                    }
                    else
                    {
                        this._nonHeadSprites[k] = false;
                    }
                }
                else
                {
                    this._nonHeadSprites[k] = true;
                }
            }
            return this._nonHeadSprites[k];
        }

        private function _parser3(k:int):Boolean
        {
            if (this._saddleSprites[k] == null)
            {
                if (this._animationData._Str_6014(_currentScale, DirectionData.USE_DEFAULT_DIRECTION, k) == SADDLE)
                {
                    this._saddleSprites[k] = true;
                }
                else
                {
                    this._saddleSprites[k] = false;
                }
            }
            return this._saddleSprites[k];
        }
    }
}
