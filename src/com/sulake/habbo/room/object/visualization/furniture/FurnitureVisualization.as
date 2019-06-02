package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.BitmapData;
    import com.sulake.room.object.enum.AlphaTolerance;
    import flash.display.BlendMode;
    import com.sulake.habbo.room.object.visualization.data.LayerData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.object.visualization.data.ColorData;

    public class FurnitureVisualization extends RoomObjectSpriteVisualization 
    {
        protected static const _Str_19020:Number = Math.sqrt(0.5);

        private var _direction:int;
        private var _lastCameraAngle:Number = NaN;
        private var _selectedColor:int = -1;
        protected var _Str_1240:Number = 1;
        private var _clickUrl:String = null;
        private var _clickHandling:Boolean = false;
        private var _data:FurnitureVisualizationData = null;
        private var _type:String = "";
        private var _assetNames:Array;
        private var _assetNamesFrame:Array;
        private var _furnitureLift:Number = 0;
        private var _cacheSize:int = -1;
        private var _updatedLayers:int = -1;
        private var _spriteTags:Array;
        private var _spriteAlphas:Array;
        private var _spriteColors:Array;
        private var _spriteXOffsets:Array;
        private var _spriteYOffsets:Array;
        private var _spriteZOffsets:Array;
        private var _spriteMouseCaptures:Array;
        private var _spriteInks:Array;
        protected var _Str_11460:Boolean = true;
        protected var _Str_3416:int = 0;
        protected var _Str_13574:int = -1;
        private var _maskLayerIndex:int = 0;
        private var Z_MULTIPLIER:Number = 0;

        public function FurnitureVisualization()
        {
            this._assetNames = [];
            this._assetNamesFrame = [];
            this._spriteTags = [];
            this._spriteAlphas = [];
            this._spriteColors = [];
            this._spriteXOffsets = [];
            this._spriteYOffsets = [];
            this._spriteZOffsets = [];
            this._spriteMouseCaptures = [];
            this._spriteInks = [];
            super();
            this.reset();
        }

        protected function set direction(k:int):void
        {
            this._direction = k;
        }

        protected function get direction():int
        {
            return this._direction;
        }

        protected function get type():String
        {
            return this._type;
        }

        override public function dispose():void
        {
            super.dispose();
            this._data = null;
            this._assetNames = null;
            this._assetNamesFrame = null;
            this._spriteTags = null;
            this._spriteAlphas = null;
            this._spriteColors = null;
            this._spriteXOffsets = null;
            this._spriteYOffsets = null;
            this._spriteZOffsets = null;
            this._spriteMouseCaptures = null;
            this._spriteInks = null;
        }

        override protected function reset():void
        {
            super.reset();
            this.direction = -1;
            this._data = null;
            this._assetNames = [];
            this._assetNamesFrame = [];
            this._spriteTags = [];
            this._spriteAlphas = [];
            this._spriteColors = [];
            this._spriteXOffsets = [];
            this._spriteYOffsets = [];
            this._spriteZOffsets = [];
            this._spriteMouseCaptures = [];
            this._spriteInks = [];
            this.createSprites(0);
        }

        override public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            this.reset();
            if (((k == null) || (!(k is FurnitureVisualizationData))))
            {
                return false;
            }
            this._data = (k as FurnitureVisualizationData);
            this._type = this._data.getType();
            return true;
        }

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (k == null)
            {
                return;
            }
            var _local_5:Boolean;
            var _local_6:Number = k.scale;
            if (this.updateObject(_local_6, k.direction.x))
            {
                _local_5 = true;
            }
            if (this.updateModel(_local_6))
            {
                _local_5 = true;
            }
            var _local_7:int;
            if (_arg_4)
            {
                this._maskLayerIndex = (this._maskLayerIndex | this.updateAnimation(_local_6));
            }
            else
            {
                _local_7 = (this.updateAnimation(_local_6) | this._maskLayerIndex);
                this._maskLayerIndex = 0;
            }
            if (((_local_5) || (!(_local_7 == 0))))
            {
                this.updateSprites(_local_6, _local_5, _local_7);
                _currentScale = _local_6;
                increaseUpdateId();
            }
        }

        protected function updateSprites(k:int, _arg_2:Boolean, _arg_3:int):void
        {
            var _local_4:int;
            var _local_5:int;
            if (this._Str_3416 != spriteCount)
            {
                createSprites(this._Str_3416);
            }
            if (_arg_2)
            {
                _local_4 = (spriteCount - 1);
                while (_local_4 >= 0)
                {
                    this.updateSprite(k, _local_4);
                    _local_4--;
                }
            }
            else
            {
                _local_5 = 0;
                while (_arg_3 > 0)
                {
                    if ((_arg_3 & 0x01))
                    {
                        this.updateSprite(k, _local_5);
                    }
                    _local_5++;
                    _arg_3 = (_arg_3 >> 1);
                }
            }
            this._Str_11460 = false;
        }

        protected function updateSprite(k:int, _arg_2:int):void
        {
            var _local_5:IGraphicAsset;
            var _local_6:Number;
            var _local_7:int;
            var _local_3:String = this.getSpriteAssetName(k, _arg_2);
            var _local_4:IRoomObjectSprite = getSprite(_arg_2);
            if (((!(_local_4 == null)) && (!(_local_3 == null))))
            {
                _local_5 = this.getAsset(_local_3, _arg_2);
                if (((!(_local_5 == null)) && (!(_local_5.asset == null))))
                {
                    _local_4.visible = true;
                    _local_4.objectType = this._type;
                    _local_4.asset = (_local_5.asset.content as BitmapData);
                    if (_local_5.asset.content == null)
                    {
                        _modelUpdateID++;
                    }
                    _local_4.flipH = _local_5.flipH;
                    _local_4.flipV = _local_5.flipV;
                    _local_4.direction = this._direction;
                    _local_6 = 0;
                    if (_arg_2 != this._Str_13574)
                    {
                        _local_4.tag = this.getSpriteTag(k, this._direction, _arg_2);
                        _local_4.alpha = this.getSpriteAlpha(k, this._direction, _arg_2);
                        _local_4.color = this.getSpriteColor(k, _arg_2, this._selectedColor);
                        _local_4.offsetX = (_local_5.offsetX + this.getSpriteXOffset(k, this._direction, _arg_2));
                        _local_4.offsetY = (_local_5.offsetY + this.getSpriteYOffset(k, this._direction, _arg_2));
                        _local_4._Str_4023 = ((this.getSpriteMouseCapture(k, this._direction, _arg_2)) ? AlphaTolerance.MATCH_OPAQUE_PIXELS : AlphaTolerance.MATCH_NOTHING);
                        _local_4.blendMode = this.getBlendMode(this.getSpriteInk(k, this._direction, _arg_2));
                        _local_6 = this.getSpriteZOffset(k, this._direction, _arg_2);
                        _local_6 = (_local_6 - (_arg_2 * 0.001));
                    }
                    else
                    {
                        _local_4.offsetX = _local_5.offsetX;
                        _local_4.offsetY = (_local_5.offsetY + this.getSpriteYOffset(k, this._direction, _arg_2));
                        _local_7 = 48;
                        _local_7 = (_local_7 * this._Str_1240);
                        _local_4.alpha = _local_7;
                        _local_4._Str_4023 = AlphaTolerance.MATCH_NOTHING;
                        _local_6 = 1;
                    }
                    _local_6 = (_local_6 * _Str_19020);
                    _local_4.relativeDepth = _local_6;
                    _local_4.assetName = _local_5.assetName;
                    _local_4._Str_3582 = this.getLibraryAssetNameForSprite(_local_5, _local_4);
                    _local_4._Str_8401 = this.getPostureForAssetFile(k, _local_5._Str_3582);
                    _local_4._Str_4530 = this._clickHandling;
                }
                else
                {
                    this.resetSprite(_local_4);
                }
            }
            else
            {
                if (_local_4 != null)
                {
                    this.resetSprite(_local_4);
                }
            }
        }

        protected function getLibraryAssetNameForSprite(k:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            return k._Str_3582;
        }

        private function resetSprite(k:IRoomObjectSprite):void
        {
            k.asset = null;
            k.assetName = "";
            k._Str_8401 = null;
            k.tag = "";
            k.flipH = false;
            k.flipV = false;
            k.offsetX = 0;
            k.offsetY = 0;
            k.relativeDepth = 0;
            k._Str_4530 = false;
        }

        protected function getBlendMode(k:int):String
        {
            var _local_2:String = BlendMode.NORMAL;
            switch (k)
            {
                case LayerData.DEFAULT_INK:
                    break;
                case LayerData.INK_ADD:
                    _local_2 = BlendMode.ADD;
                    break;
                case LayerData.INK_DARKEN:
                    _local_2 = BlendMode.DARKEN;
                    break;
                case LayerData.INK_SUBTRACT:
                    _local_2 = BlendMode.SUBTRACT;
                    break;
            }
            return _local_2;
        }

        protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            var _local_4:Number;
            var _local_5:int;
            var _local_3:IRoomObject = object;
            if (_local_3 == null)
            {
                return false;
            }
            if ((((!(_objectUpdateID == _local_3.getUpdateID())) || (!(k == _currentScale))) || (!(_arg_2 == this._lastCameraAngle))))
            {
                _local_4 = (_local_3.getDirection().x - (_arg_2 + 135));
                _local_4 = (((_local_4 % 360) + 360) % 360);
                if (this._data != null)
                {
                    _local_5 = this._data._Str_15687(k, _local_4);
                    this.direction = _local_5;
                }
                _objectUpdateID = _local_3.getUpdateID();
                this._lastCameraAngle = _arg_2;
                _currentScale = k;
                this.updateAssetAndSpriteCache(k, this._direction);
                return true;
            }
            return false;
        }

        protected function updateModel(k:Number):Boolean
        {
            var _local_4:Number;
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
            if (_modelUpdateID != _local_3.getUpdateID())
            {
                this._selectedColor = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_COLOR);
                _local_4 = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER);
                if (isNaN(_local_4))
                {
                    _local_4 = 1;
                }
                if (_local_4 != this._Str_1240)
                {
                    this._Str_1240 = _local_4;
                    this._Str_11460 = true;
                }
                this._clickUrl = this.getAdClickUrl(_local_3);
                this._clickHandling = (((!(this._clickUrl == null)) && (!(this._clickUrl == ""))) && (this._clickUrl.indexOf("http") == 0));
                this.Z_MULTIPLIER = _local_3.getNumber(RoomObjectVariableEnum.FURNITURE_LIFT_AMOUNT);
                _modelUpdateID = _local_3.getUpdateID();
                return true;
            }
            return false;
        }

        protected function getAdClickUrl(k:IRoomObjectModel):String
        {
            return k.getString(RoomObjectVariableEnum.FURNITURE_AD_URL);
        }

        protected function updateAnimation(k:Number):int
        {
            return 0;
        }

        private function updateAssetAndSpriteCache(k:Number, _arg_2:int):void
        {
            if (((!(this._updatedLayers == _arg_2)) || (!(this._furnitureLift == k))))
            {
                this._assetNames = [];
                this._assetNamesFrame = [];
                this._spriteTags = [];
                this._spriteAlphas = [];
                this._spriteColors = [];
                this._spriteXOffsets = [];
                this._spriteYOffsets = [];
                this._spriteZOffsets = [];
                this._spriteMouseCaptures = [];
                this._spriteInks = [];
                this._updatedLayers = _arg_2;
                this._furnitureLift = k;
                this._cacheSize = this._Str_3033(k);
                this.updateLayerCount((this._data.getLayerCount(k) + this.getAdditionalSpriteCount()));
            }
        }

        protected function updateLayerCount(k:int):void
        {
            this._Str_3416 = k;
            this._Str_13574 = (this._Str_3416 - this.getAdditionalSpriteCount());
        }

        protected function getAdditionalSpriteCount():int
        {
            return 1;
        }

        protected function getFrameNumber(k:int, _arg_2:int):int
        {
            return 0;
        }

        protected function getPostureForAssetFile(k:int, _arg_2:String):String
        {
            return null;
        }

        protected function getAsset(k:String, _arg_2:int=-1):IGraphicAsset
        {
            var _local_3:IGraphicAsset;
            if (assetCollection != null)
            {
                _local_3 = assetCollection.getAsset(k);
                return _local_3;
            }
            return null;
        }

        protected function getSpriteAssetName(k:int, _arg_2:int):String
        {
            if (((this._data == null) || (_arg_2 >= FurnitureVisualizationData.LAYER_NAMES.length)))
            {
                return "";
            }
            var _local_3:String = this._assetNames[_arg_2];
            var _local_4:Boolean = this._assetNamesFrame[_arg_2];
            if (((_local_3 == null) || (_local_3.length == 0)))
            {
                _local_3 = this.getSpriteAssetNameWithoutFrame(k, _arg_2, true);
                _local_4 = (!(this._cacheSize == 1));
            }
            if (_local_4)
            {
                _local_3 = (_local_3 + this.getFrameNumber(k, _arg_2));
            }
            return _local_3;
        }

        protected function getSpriteAssetNameWithoutFrame(k:int, _arg_2:int, _arg_3:Boolean):String
        {
            var _local_4:String = this._type;
            var _local_5:String = "";
            var _local_6:int = ((_arg_3) ? this._cacheSize : this._Str_3033(k));
            var _local_7:* = (!(_local_6 == 1));
            if (_arg_2 != this._Str_13574)
            {
                _local_5 = FurnitureVisualizationData.LAYER_NAMES[_arg_2];
            }
            else
            {
                _local_5 = "sd";
            }
            _local_4 = (_local_4 + ((_local_7) ? (((((("_" + _local_6) + "_") + _local_5) + "_") + this._direction) + "_") : ("_icon_" + _local_5)));
            if (_arg_3)
            {
                this._assetNames[_arg_2] = _local_4;
                this._assetNamesFrame[_arg_2] = _local_7;
            }
            return _local_4;
        }

        protected function getSpriteTag(k:int, _arg_2:int, _arg_3:int):String
        {
            if (this._spriteTags[_arg_3] != null)
            {
                return this._spriteTags[_arg_3];
            }
            if (this._data == null)
            {
                return "";
            }
            var _local_4:String = this._data._Str_6014(k, _arg_2, _arg_3);
            this._spriteTags[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int
        {
            if (((!(this._spriteAlphas[_arg_3] == null)) && (!(this._Str_11460))))
            {
                return this._spriteAlphas[_arg_3];
            }
            if (this._data == null)
            {
                return LayerData.DEFAULT_ALPHA;
            }
            var _local_4:int = this._data._Str_11350(k, _arg_2, _arg_3);
            _local_4 = (_local_4 * this._Str_1240);
            this._spriteAlphas[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._spriteColors[_arg_2] != null)
            {
                return this._spriteColors[_arg_2];
            }
            if (this._data == null)
            {
                return ColorData.DEFAULT_COLOR;
            }
            var _local_4:int = this._data._Str_751(k, _arg_2, _arg_3);
            this._spriteColors[_arg_2] = _local_4;
            return _local_4;
        }

        protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._spriteXOffsets[_arg_3] != null)
            {
                return this._spriteXOffsets[_arg_3];
            }
            if (this._data == null)
            {
                return LayerData.DEFAULT_X_OFFSET;
            }
            var _local_4:int = this._data._Str_10372(k, _arg_2, _arg_3);
            this._spriteXOffsets[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int;
            if (_arg_3 != this._Str_13574)
            {
                if (this._spriteYOffsets[_arg_3] != null)
                {
                    return this._spriteYOffsets[_arg_3];
                }
                if (this._data != null)
                {
                    _local_4 = this._data._Str_10926(k, _arg_2, _arg_3);
                    this._spriteYOffsets[_arg_3] = _local_4;
                    return _local_4;
                }
                return LayerData.DEFAULT_Y_OFFSET;
            }
            return Math.ceil((this.Z_MULTIPLIER * (k / 2)));
        }

        protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            if (this._spriteMouseCaptures[_arg_3] != null)
            {
                return this._spriteMouseCaptures[_arg_3];
            }
            if (this._data == null)
            {
                return true;
            }
            var _local_4:* = (!(this._data._Str_12280(k, _arg_2, _arg_3)));
            this._spriteMouseCaptures[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteInk(k:int, _arg_2:int, _arg_3:int):int
        {
            if (this._spriteInks[_arg_3] != null)
            {
                return this._spriteInks[_arg_3];
            }
            if (this._data == null)
            {
                return LayerData.DEFAULT_INK;
            }
            var _local_4:int = this._data._Str_10682(k, _arg_2, _arg_3);
            this._spriteInks[_arg_3] = _local_4;
            return _local_4;
        }

        protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number
        {
            if (this._spriteZOffsets[_arg_3] != null)
            {
                return this._spriteZOffsets[_arg_3];
            }
            if (this._data == null)
            {
                return LayerData.DEFAULT_Z_OFFSET;
            }
            var _local_4:Number = this._data._Str_8329(k, _arg_2, _arg_3);
            this._spriteZOffsets[_arg_3] = _local_4;
            return _local_4;
        }

        protected function _Str_3033(k:int):int
        {
            if (this._data != null)
            {
                return this._data._Str_3033(k);
            }
            return k;
        }

        protected function get data():FurnitureVisualizationData
        {
            return this._data;
        }
    }
}
