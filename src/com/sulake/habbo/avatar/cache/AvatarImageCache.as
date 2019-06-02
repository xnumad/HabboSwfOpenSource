package com.sulake.habbo.avatar.cache
{
    import com.sulake.habbo.avatar.AvatarStructure;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.utils.getTimer;
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import com.sulake.habbo.avatar.enum.GeometryType;
    import com.sulake.habbo.avatar.animation.Animation;
    import com.sulake.habbo.avatar.animation.AnimationLayerData;
    import flash.geom.Point;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
    import com.sulake.habbo.avatar.AvatarImagePartContainer;
    import com.sulake.habbo.avatar.structure.animation.AnimationFrame;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.data.RoomObjectSpriteData;
    import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
    import com.sulake.habbo.avatar.enum.AvatarFigurePartType;
    import flash.geom.Rectangle;

    public class AvatarImageCache 
    {
        private static const _Str_2189:int = 60000;

        private var _structure:AvatarStructure;
        private var _avatar:IAvatarImage;
        private var _assets:AssetAliasCollection;
        private var _scale:String;
        private var _cache:Map;
        private var _canvas:AvatarCanvas;
        private var _disposed:Boolean;
        private var _geometryType:String;
        private var _unionImages:Array;
        private var _colorTransform:ColorTransform;
        private var _matrix:Matrix;
        private var _serverRenderData:Array;

        public function AvatarImageCache(k:AvatarStructure, _arg_2:IAvatarImage, _arg_3:AssetAliasCollection, _arg_4:String)
        {
            this._unionImages = new Array();
            this._colorTransform = new ColorTransform();
            this._matrix = new Matrix();
            this._serverRenderData = new Array();
            super();
            this._structure = k;
            this._avatar = _arg_2;
            this._assets = _arg_3;
            this._scale = _arg_4;
            this._cache = new Map();
        }

        public function dispose():void
        {
            var k:AvatarImageActionCache;
            var _local_2:Array;
            var _local_3:String;
            if (this._disposed)
            {
                return;
            }
            this._structure = null;
            this._avatar = null;
            this._assets = null;
            if (this._cache != null)
            {
                _local_2 = this._cache.getKeys();
                for each (_local_3 in _local_2)
                {
                    k = (this._cache.getValue(_local_3) as AvatarImageActionCache);
                    if (k != null)
                    {
                        k.dispose();
                    }
                }
                this._cache.dispose();
                this._cache = null;
            }
            this._canvas = null;
            this._disposed = true;
        }

        public function _Str_1086(k:int=60000):void
        {
            var _local_3:AvatarImageActionCache;
            var _local_5:String;
            var _local_2:int = getTimer();
            var _local_4:Array = this._cache.getKeys();
            for each (_local_5 in _local_4)
            {
                _local_3 = (this._cache.getValue(_local_5) as AvatarImageActionCache);
                if (_local_3 != null)
                {
                    _local_3._Str_2089(k, _local_2);
                }
            }
        }

        public function resetBodyPartCache(k:IActiveActionData):void
        {
            var _local_2:AvatarImageActionCache;
            for each (_local_2 in this._cache)
            {
                if (_local_2 != null)
                {
                    _local_2._Str_1565(k, 0);
                }
            }
        }

        public function setDirection(k:String, _arg_2:int):void
        {
            var _local_4:AvatarImageActionCache;
            var _local_5:String;
            var _local_3:Array = this._structure.getBodyPartsUnordered(k);
            for each (_local_5 in _local_3)
            {
                _local_4 = this._Str_1050(_local_5);
                if (_local_4 != null)
                {
                    _local_4.setDirection(_arg_2);
                }
            }
        }

        public function _Str_1565(k:IActiveActionData, _arg_2:int):void
        {
            var _local_4:String;
            var _local_5:AvatarImageActionCache;
            var _local_3:Array = this._structure._Str_2021(k, this._avatar);
            for each (_local_4 in _local_3)
            {
                _local_5 = this._Str_1050(_local_4);
                if (_local_5 != null)
                {
                    _local_5._Str_1565(k, _arg_2);
                }
            }
        }

        public function setGeometryType(k:String):void
        {
            if (this._geometryType == k)
            {
                return;
            }
            if ((((this._geometryType == GeometryType.SITTING) && (k == GeometryType.VERTICAL)) || ((this._geometryType == GeometryType.VERTICAL) && (k == GeometryType.SITTING)) || ((this._geometryType == GeometryType.SNOWWARS_HORIZONTAL) && (k = GeometryType.SNOWWARS_HORIZONTAL))))
            {
                this._geometryType = k;
                this._canvas = null;
                return;
            }
            this._Str_1086(0);
            this._geometryType = k;
            this._canvas = null;
        }

        public function getImageContainer(k:String, _arg_2:int, _arg_3:Boolean=false):AvatarImageBodyPartContainer
        {
            var _local_15:int;
            var _local_16:Animation;
            var _local_17:int;
            var _local_18:AnimationLayerData;
            var _local_19:Array;
            var _local_20:Array;
            var _local_4:AvatarImageActionCache = this._Str_1050(k);
            if (_local_4 == null)
            {
                _local_4 = new AvatarImageActionCache();
                this._cache.add(k, _local_4);
            }
            var _local_5:int = _local_4.getDirection();
            var _local_6:int = _arg_2;
            var _local_7:IActiveActionData = _local_4.getAction();
            if (_local_7.definition.startFromFrameZero)
            {
                _local_6 = (_local_6 - _local_7.startFrame);
            }
            var _local_8:IActiveActionData = _local_7;
            var _local_9:Array = [];
            var _local_10:Map = new Map();
            var _local_11:Point = new Point();
            if (!((!(_local_7)) || (!(_local_7.definition))))
            {
                if (_local_7.definition.isAnimation)
                {
                    _local_15 = _local_5;
                    _local_16 = this._structure.getAnimation(((_local_7.definition.state + ".") + _local_7.actionParameter));
                    _local_17 = (_arg_2 - _local_7.startFrame);
                    if (_local_16 != null)
                    {
                        _local_18 = _local_16.getLayerData(_local_17, k, _local_7.overridingAction);
                        if (_local_18 != null)
                        {
                            _local_15 = (_local_5 + _local_18.dd);
                            if (_local_18.dd < 0)
                            {
                                if (_local_15 < 0)
                                {
                                    _local_15 = (8 + _local_15);
                                }
                                else
                                {
                                    if (_local_15 > 7)
                                    {
                                        _local_15 = (8 - _local_15);
                                    }
                                }
                            }
                            else
                            {
                                if (_local_15 < 0)
                                {
                                    _local_15 = (_local_15 + 8);
                                }
                                else
                                {
                                    if (_local_15 > 7)
                                    {
                                        _local_15 = (_local_15 - 8);
                                    }
                                }
                            }
                            if (this._scale == AvatarScaleType.LARGE)
                            {
                                _local_11.x = _local_18.dx;
                                _local_11.y = _local_18.dy;
                            }
                            else
                            {
                                _local_11.x = (_local_18.dx / 2);
                                _local_11.y = (_local_18.dy / 2);
                            }
                            _local_6 = _local_18.animationFrame;
                            if (_local_18.action != null)
                            {
                                _local_7 = _local_18.action;
                            }
                            if (_local_18.type == AnimationLayerData.BODYPART)
                            {
                                if (_local_18.action != null)
                                {
                                    _local_8 = _local_18.action;
                                }
                                _local_5 = _local_15;
                            }
                            else
                            {
                                if (_local_18.type == AnimationLayerData.FX)
                                {
                                    _local_5 = _local_15;
                                }
                            }
                            _local_10 = _local_18.items;
                        }
                        _local_9 = _local_16.removeData;
                    }
                }
            }
            var _local_12:AvatarImageBodyPartCache = _local_4._Str_1961(_local_8);
            if (((_local_12 == null) || (_arg_3)))
            {
                _local_12 = new AvatarImageBodyPartCache();
                _local_4._Str_1765(_local_8, _local_12);
            }
            var _local_13:AvatarImageDirectionCache = _local_12._Str_2070(_local_5);
            if (((_local_13 == null) || (_arg_3)))
            {
                _local_19 = this._structure._Str_713(k, this._avatar._Str_784(), _local_8, this._geometryType, _local_5, _local_9, this._avatar, _local_10);
                _local_13 = new AvatarImageDirectionCache(_local_19);
                _local_12._Str_2168(_local_5, _local_13);
            }
            var _local_14:AvatarImageBodyPartContainer = _local_13.getImageContainer(_local_6);
            if (((_local_14 == null) || (_arg_3)))
            {
                _local_20 = _local_13._Str_1699();
                _local_14 = this._Str_1834(_local_5, _local_20, _local_6, _local_7, _arg_3);
                if (((!(_local_14 == null)) && (!(_arg_3))))
                {
                    if (_local_14.isCacheable)
                    {
                        _local_13.updateImageContainer(_local_14, _local_6);
                    }
                }
                else
                {
                    return null;
                }
            }
            _local_14.offset = _local_11.add(this._structure._Str_1888(_local_8, _local_5, _local_6, k));
            return _local_14;
        }

        public function _Str_1009():Array
        {
            var k:Array = this._serverRenderData;
            this._serverRenderData = new Array();
            return k;
        }

        public function _Str_1050(k:String):AvatarImageActionCache
        {
            var _local_2:AvatarImageActionCache = (this._cache.getValue(k) as AvatarImageActionCache);
            if (_local_2 == null)
            {
                _local_2 = new AvatarImageActionCache();
                this._cache.add(k, _local_2);
            }
            return _local_2;
        }

        private function _Str_1834(k:int, _arg_2:Array, _arg_3:int, _arg_4:IActiveActionData, _arg_5:Boolean=false):AvatarImageBodyPartContainer
        {
            var _local_8:Boolean;
            var _local_9:int;
            var _local_17:ImageData;
            var partContainer:AvatarImagePartContainer;
            var _local_19:String;
            var _local_20:String;
            var _local_21:String;
            var animationFrame:AnimationFrame;
            var _local_23:int;
            var _local_24:String;
            var bitmapAsset:BitmapDataAsset;
            var bitmapData:BitmapData;
            var _local_27:Boolean;
            var _local_28:Point;
            var colorTransformOne:ColorTransform;
            var colorTransformTwo:ColorTransform;
            var _local_31:RoomObjectSpriteData;
            if (_arg_2 == null)
            {
                return null;
            }
            if (_arg_2.length == 0)
            {
                return null;
            }
            if (!this._canvas)
            {
                this._canvas = this._structure.getCanvas(this._scale, this._geometryType);
                if (!this._canvas)
                {
                    return null;
                }
            }
            var _local_6:int = k;
            var _local_7:Boolean = AvatarDirectionAngle._Str_1859[k];
            var _local_10:String = _arg_4.definition.assetPartDefinition;
            var _local_11:String = _arg_4.definition.state;
            var _local_12:Boolean = true;
            var _local_13:int = (_arg_2.length - 1);
            _local_9 = _local_13;
            while (_local_9 >= 0)
            {
                partContainer = (_arg_2[_local_9] as AvatarImagePartContainer);
                if (!((k == 7) && ((partContainer.partType == "fc") || (partContainer.partType == "ey"))))
                {
                    if (!((partContainer.partType == "ri") && (partContainer._Str_1502 == null)))
                    {
                        _local_19 = partContainer.bodyPartId;
                        _local_20 = partContainer.partType;
                        _local_21 = partContainer._Str_1502;
                        animationFrame = partContainer.getAnimationFrame(_arg_3);
                        if (animationFrame)
                        {
                            _local_23 = animationFrame.number;
                            if (((animationFrame.assetPartDefinition) && (!(animationFrame.assetPartDefinition == ""))))
                            {
                                _local_10 = animationFrame.assetPartDefinition;
                            }
                        }
                        else
                        {
                            _local_23 = partContainer._Str_1674(_arg_3);
                        }
                        _local_6 = k;
                        _local_8 = false;
                        if (_local_7)
                        {
                            if (((_local_10 == "wav") && (((_local_20 == AvatarFigurePartType.LEFT_HAND) || (_local_20 == AvatarFigurePartType.LEFT_SLEEVE)) || (_local_20 == AvatarFigurePartType.LEFT_COAT_SLEEVE))))
                            {
                                _local_8 = true;
                            }
                            else
                            {
                                if (((_local_10 == "drk") && (((_local_20 == AvatarFigurePartType.RIGHT_HAND) || (_local_20 == AvatarFigurePartType.RIGHT_SLEEVE)) || (_local_20 == AvatarFigurePartType.RIGHT_COAT_SLEEVE))))
                                {
                                    _local_8 = true;
                                }
                                else
                                {
                                    if (((_local_10 == "blw") && (_local_20 == AvatarFigurePartType.RIGHT_HAND)))
                                    {
                                        _local_8 = true;
                                    }
                                    else
                                    {
                                        if (((_local_10 == "sig") && (_local_20 == AvatarFigurePartType.LEFT_HAND)))
                                        {
                                            _local_8 = true;
                                        }
                                        else
                                        {
                                            if (((_local_10 == "respect") && (_local_20 == AvatarFigurePartType.LEFT_HAND)))
                                            {
                                                _local_8 = true;
                                            }
                                            else
                                            {
                                                if (_local_20 == AvatarFigurePartType.RIGHT_HAND_ITEM)
                                                {
                                                    _local_8 = true;
                                                }
                                                else
                                                {
                                                    if (_local_20 == AvatarFigurePartType.LEFT_HAND_ITEM)
                                                    {
                                                        _local_8 = true;
                                                    }
                                                    else
                                                    {
                                                        if (_local_20 == AvatarFigurePartType.CHEST_PRINT)
                                                        {
                                                            _local_8 = true;
                                                        }
                                                        else
                                                        {
                                                            if (k == 4)
                                                            {
                                                                _local_6 = 2;
                                                            }
                                                            else
                                                            {
                                                                if (k == 5)
                                                                {
                                                                    _local_6 = 1;
                                                                }
                                                                else
                                                                {
                                                                    if (k == 6)
                                                                    {
                                                                        _local_6 = 0;
                                                                    }
                                                                }
                                                            }
                                                            if (partContainer.flippedPartType != _local_20)
                                                            {
                                                                _local_20 = partContainer.flippedPartType;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        _local_24 = ((((((((((this._scale + "_") + _local_10) + "_") + _local_20) + "_") + _local_21) + "_") + _local_6) + "_") + _local_23);
                        bitmapAsset = (this._assets.getAssetByName(_local_24) as BitmapDataAsset);
                        if (bitmapAsset == null)
                        {
                            _local_24 = (((((((this._scale + "_std_") + _local_20) + "_") + _local_21) + "_") + _local_6) + "_0");
                            bitmapAsset = (this._assets.getAssetByName(_local_24) as BitmapDataAsset);
                        }
                        if (!bitmapAsset)
                        {
                        }
                        else
                        {
                            bitmapData = (bitmapAsset.content as BitmapData);
                            if (bitmapData == null)
                            {
                                _local_12 = false;
                            }
                            else
                            {
                                _local_27 = false;
                                if (((partContainer.isColorable) && (!(partContainer.color == null))))
                                {
                                    colorTransformTwo = partContainer.color.colorTransform;
                                    this._colorTransform.redMultiplier = colorTransformTwo.redMultiplier;
                                    this._colorTransform.greenMultiplier = colorTransformTwo.greenMultiplier;
                                    this._colorTransform.blueMultiplier = colorTransformTwo.blueMultiplier;
                                    this._colorTransform.alphaMultiplier = colorTransformTwo.alphaMultiplier;
                                    _local_27 = true;
                                }
                                else
                                {
                                    this._colorTransform.redMultiplier = (this._colorTransform.greenMultiplier = (this._colorTransform.blueMultiplier = (this._colorTransform.alphaMultiplier = 1)));
                                }
                                if (partContainer.isBlendable)
                                {
                                    this._colorTransform.concat(partContainer.blendTransform);
                                    _local_27 = true;
                                }
                                _local_28 = bitmapAsset.offset.clone();
                                if (_local_8)
                                {
                                    _local_28.x = (_local_28.x + ((this._scale == AvatarScaleType.LARGE) ? 65 : 31));
                                }
                                colorTransformOne = null;
                                if (_local_27)
                                {
                                    colorTransformOne = new ColorTransform();
                                    colorTransformOne.concat(this._colorTransform);
                                }
                                if (_arg_5)
                                {
                                    _local_31 = new RoomObjectSpriteData();
                                    _local_31.name = this._assets.getAliasByName(_local_24);
                                    _local_31.x = (-(_local_28.x) - 33);
                                    _local_31.y = -(_local_28.y);
                                    _local_31.z = (this._serverRenderData.length * -0.0001);
                                    _local_31.width = bitmapAsset.rectangle.width;
                                    _local_31.height = bitmapAsset.rectangle.height;
                                    _local_31.flipH = _local_8;
                                    if (_local_10 == "lay")
                                    {
                                        _local_31.x = (_local_31.x + 53);
                                    }
                                    if (_local_7)
                                    {
                                        _local_31.flipH = (!(_local_31.flipH));
                                        if (_local_31.flipH)
                                        {
                                            _local_31.x = (-(_local_31.x) - bitmapData.width);
                                        }
                                        else
                                        {
                                            _local_31.x = (_local_31.x + 65);
                                        }
                                    }
                                    if (((partContainer.isColorable) && (colorTransformOne)))
                                    {
                                        _local_31.color = ((("0x" + this._Str_1652(colorTransformOne.redMultiplier)) + this._Str_1652(colorTransformOne.greenMultiplier)) + this._Str_1652(colorTransformOne.blueMultiplier));
                                    }
                                    this._serverRenderData.push(_local_31);
                                }
                                this._unionImages.push(new ImageData(bitmapData, bitmapAsset.rectangle, _local_28, _local_8, colorTransformOne));
                            }
                        }
                    }
                }
                _local_9--;
            }
            if (this._unionImages.length == 0)
            {
                return null;
            }
            var _local_14:ImageData = this._Str_1236(this._unionImages, _local_7);
            var _local_15:int = ((this._scale == AvatarScaleType.LARGE) ? (this._canvas.height - 16) : (this._canvas.height - 8));
            var _local_16:Point = new Point(-(_local_14._Str_1076.x), (_local_15 - _local_14._Str_1076.y));
            if (((_local_7) && (!(_local_10 == "lay"))))
            {
                _local_16.x = (_local_16.x + ((this._scale == AvatarScaleType.LARGE) ? 67 : 31));
            }
            _local_9 = (this._unionImages.length - 1);
            while (_local_9 >= 0)
            {
                _local_17 = this._unionImages.pop();
                if (_local_17)
                {
                    _local_17.dispose();
                }
                _local_9--;
            }
            return new AvatarImageBodyPartContainer(_local_14.bitmap, _local_16, _local_12);
        }

        private function _Str_1652(k:Number):String
        {
            var _local_2:String = (k * 0xFF).toString(16);
            if (_local_2.length < 2)
            {
                _local_2 = ("0" + _local_2);
            }
            return _local_2;
        }

        private function _Str_1236(k:Array, _arg_2:Boolean):ImageData
        {
            var _local_3:Rectangle;
            var _local_4:ImageData;
            var _local_5:Point;
            var _local_6:Point;
            var _local_7:BitmapData;
            var _local_8:Boolean;
            _local_3 = new Rectangle();
            for each (_local_4 in k)
            {
                _local_3 = _local_3.union(_local_4.offsetRect);
            }
            _local_6 = new Point(-(_local_3.left), -(_local_3.top));
            _local_7 = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
            for each (_local_4 in k)
            {
                _local_5 = _local_6.subtract(_local_4._Str_1076);
                if (_arg_2)
                {
                    _local_5.x = (_local_7.width - (_local_5.x + _local_4.rect.width));
                }
                _local_8 = ((!((_arg_2) && (_local_4.flipH))) && ((_arg_2) || (_local_4.flipH)));
                if (_local_8)
                {
                    this._matrix.a = -1;
                    this._matrix.tx = ((_local_4.rect.x + _local_4.rect.width) + _local_5.x);
                    this._matrix.ty = (_local_5.y - _local_4.rect.y);
                    _local_3.x = _local_5.x;
                    _local_3.y = _local_5.y;
                    _local_3.width = _local_4.rect.width;
                    _local_3.height = _local_4.rect.height;
                    _local_7.draw(_local_4.bitmap, this._matrix, _local_4.colorTransform, null, _local_3);
                }
                else
                {
                    if (_local_4.colorTransform)
                    {
                        this._matrix.a = 1;
                        this._matrix.tx = (_local_5.x - _local_4.rect.x);
                        this._matrix.ty = (_local_5.y - _local_4.rect.y);
                        _local_3.x = _local_5.x;
                        _local_3.y = _local_5.y;
                        _local_3.width = _local_4.rect.width;
                        _local_3.height = _local_4.rect.height;
                        _local_7.draw(_local_4.bitmap, this._matrix, _local_4.colorTransform, null, _local_3);
                    }
                    else
                    {
                        _local_7.copyPixels(_local_4.bitmap, _local_4.rect, _local_5, null, null, true);
                    }
                }
            }
            return new ImageData(_local_7, _local_7.rect, _local_6, _arg_2, null);
        }

        private function drawBorders(k:BitmapData, _arg_2:Rectangle, _arg_3:uint):void
        {
            var _local_4:int;
            var _local_5:int = (_arg_2.bottom - 1);
            _local_4 = _arg_2.left;
            while (_local_4 < (_arg_2.right - 1))
            {
                k.setPixel32(_local_4, 0, _arg_3);
                k.setPixel32(_local_4, _local_5, _arg_3);
                _local_4++;
            }
            _local_5 = _arg_2.top;
            while (_local_5 < (_arg_2.bottom - 1))
            {
                k.setPixel32(0, _local_5, _arg_3);
                k.setPixel32(_local_4, _local_5, _arg_3);
                _local_5++;
            }
        }

        private function _Str_587(k:String):void
        {
            Logger.log(("[AvatarImageCache] " + k));
        }
    }
}

