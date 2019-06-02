package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.actions.IActiveActionData;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.habbo.avatar.cache.AvatarImageCache;
    import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.actions.ActiveActionData;
    import com.sulake.habbo.avatar.enum.AvatarAction;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
    import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
    import com.sulake.habbo.avatar.animation.IAnimationLayerData;
    import com.sulake.habbo.avatar.structure.AvatarCanvas;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import flash.filters.ConvolutionFilter;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.animation.Animation;
    import flash.utils.getTimer;
    import flash.filters.ColorMatrixFilter;

    public class AvatarImage implements IAvatarImage, IDisposable, _Str_936 
    {
        private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
        private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
        private static const CHANNELS_RED:String = "CHANNELS_RED";
        private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
        private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
        private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
        private static const DEFAULT:String = "Default";
        private static const DEFAULT_DIR:int = 2;
        private static const DEFAULT_AVATAR_SET:String = AvatarSetType.FULL;//"full"

        protected var _Str_581:AvatarStructure;
        protected var _scale:String;
        protected var _Str_1668:int;
        protected var _Str_1374:int;
        protected var _Str_1708:IActiveActionData;
        protected var _Str_580:Boolean;
        protected var _Str_903:Array;
        protected var _assets:AssetAliasCollection;
        protected var _Str_586:AvatarImageCache;
        protected var _figure:AvatarFigureContainer;
        protected var _Str_2121:IAvatarDataContainer;
        protected var _Str_614:Array;
        protected var _Str_671:BitmapData;
        private var _defaultAction:IActiveActionData;
        private var _frameCounter:int = 0;
        private var _directionOffset:int = 0;
        private var _useTextures:Boolean;
        private var _layersInUse:Array;
        private var _gpuMode:Boolean;
        private var _isAnimating:Boolean = false;
        private var _animationHasResetOnToggle:Boolean = false;
        private var _Str_1163:Array;
        private var _lastActionsStr:String;
        private var _currentActionsStr:String;
        private var _fullImageCache:Map;
        protected var _Str_1586:Boolean = false;
        private var _actionsSorted:Boolean;
        private var _effectIdInUse:int = -1;
        private var _animFrameCount:int;
        private var _Str_1945:Array;
        private var _cachedBodyPartsDirection:int = -1;
        private var _cachedBodyPartsGeometryType:String = null;
        private var _cachedBodyPartsAvatarSet:String = null;
        private var _Str_1210:EffectAssetDownloadManager;
        private var _Str_1153:_Str_936;

        public function AvatarImage(k:AvatarStructure, _arg_2:AssetAliasCollection, _arg_3:AvatarFigureContainer, _arg_4:String, _arg_5:EffectAssetDownloadManager, _arg_6:_Str_936)
        {
            this._Str_903 = new Array();
            this._Str_614 = [];
            this._Str_1945 = [];
            super();
            this._useTextures = true;
            this._Str_1210 = _arg_5;
            this._Str_581 = k;
            this._assets = _arg_2;
            this._scale = _arg_4;
            this._Str_1153 = _arg_6;
            if (this._scale == null)
            {
                this._scale = AvatarScaleType.LARGE;
            }
            if (_arg_3 == null)
            {
                _arg_3 = new AvatarFigureContainer("hr-893-45.hd-180-2.ch-210-66.lg-270-82.sh-300-91.wa-2007-.ri-1-");
                Logger.log("Using default avatar figure");
            }
            this._figure = _arg_3;
            this._Str_586 = new AvatarImageCache(this._Str_581, this, this._assets, this._scale);
            this.setDirection(DEFAULT_AVATAR_SET, DEFAULT_DIR);
            this._Str_614 = new Array();
            this._defaultAction = new ActiveActionData(AvatarAction.POSTURE_STAND);
            this._defaultAction.definition = this._Str_581._Str_1675(DEFAULT);
            this._Str_1632();
            this._fullImageCache = new Map();
        }

        public function _Str_1009():Array
        {
            this.errorThis(AvatarSetType.FULL);
            return this._Str_586._Str_1009();
        }

        public function dispose():void
        {
            var k:BitmapData;
            if (!this._Str_580)
            {
                this._Str_581 = null;
                this._assets = null;
                this._Str_1708 = null;
                this._figure = null;
                this._Str_2121 = null;
                this._Str_614 = null;
                if (this._Str_671)
                {
                    this._Str_671.dispose();
                }
                if (this._Str_586)
                {
                    this._Str_586.dispose();
                    this._Str_586 = null;
                }
                if (this._fullImageCache)
                {
                    for each (k in this._fullImageCache)
                    {
                        k.dispose();
                    }
                    this._fullImageCache.dispose();
                    this._fullImageCache = null;
                }
                this._Str_671 = null;
                this._Str_903 = null;
                this._Str_580 = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._Str_580;
        }

        public function _Str_784():IAvatarFigureContainer
        {
            return this._figure;
        }

        public function _Str_797():String
        {
            return this._scale;
        }

        public function _Str_867(k:String):IPartColor
        {
            return this._Str_581._Str_867(this._figure, k);
        }

        public function setDirection(k:String, _arg_2:int):void
        {
            _arg_2 = (_arg_2 + this._directionOffset);
            if (_arg_2 < AvatarDirectionAngle._Str_1562)
            {
                _arg_2 = (AvatarDirectionAngle._Str_1257 + (_arg_2 + 1));
            }
            if (_arg_2 > AvatarDirectionAngle._Str_1257)
            {
                _arg_2 = (_arg_2 - (AvatarDirectionAngle._Str_1257 + 1));
            }
            if (this._Str_581._Str_1939(k))
            {
                this._Str_1668 = _arg_2;
            }
            if (((k == AvatarSetType.HEAD) || (k == AvatarSetType.FULL)))
            {
                if (((k == AvatarSetType.HEAD) && (this.resetActions())))
                {
                    _arg_2 = this._Str_1668;
                }
                this._Str_1374 = _arg_2;
            }
            this._Str_586.setDirection(k, _arg_2);
            this._useTextures = true;
        }

        public function setDirectionAngle(k:String, _arg_2:int):void
        {
            var _local_3:int;
            _local_3 = (_arg_2 / 45);
            this.setDirection(k, _local_3);
        }

        public function _Str_754():Array
        {
            return this._layersInUse;
        }

        public function _Str_781():Array
        {
            return this._Str_903;
        }

        public function getLayerData(k:ISpriteDataContainer):IAnimationLayerData
        {
            return this._Str_581.getBodyPartData(k.animation.id, this._frameCounter, k.id);
        }

        public function _Str_953(k:int=1):void
        {
            this._frameCounter = (this._frameCounter + k);
            this._useTextures = true;
        }

        public function _Str_833():void
        {
            this._frameCounter = 0;
            this._useTextures = true;
        }

        private function getFullImageCacheKey():String
        {
            var k:IActiveActionData;
            var _local_2:int;
            if (!this._actionsSorted)
            {
                return null;
            }
            if (((this._Str_1163.length == 1) && (this._Str_1668 == this._Str_1374)))
            {
                if (this._Str_1708 == "std")
                {
                    return this._Str_1668 + this._currentActionsStr;
                }
                return (this._Str_1668 + this._currentActionsStr) + (this._frameCounter % 4);
            }
            if (this._Str_1163.length == 2)
            {
                for each (k in this._Str_1163)
                {
                    if (((k.actionType == "fx") && ((((k.actionParameter == "33") || (k.actionParameter == "34")) || (k.actionParameter == "35")) || (k.actionParameter == "36"))))
                    {
                        return (this._Str_1668 + this._currentActionsStr) + 0;
                    }
                    if (((k.actionType == "fx") && ((k.actionParameter == "38") || (k.actionParameter == "39"))))
                    {
                        _local_2 = (this._frameCounter % 11);
                        return (((this._Str_1668 + "_") + this._Str_1374) + this._currentActionsStr) + _local_2;
                    }
                }
            }
            return null;
        }

        private function getBodyParts(k:String, _arg_2:String, _arg_3:int):Array
        {
            if ((((!(_arg_3 == this._cachedBodyPartsDirection)) || (!(_arg_2 == this._cachedBodyPartsGeometryType))) || (!(k == this._cachedBodyPartsAvatarSet))))
            {
                this._cachedBodyPartsDirection = _arg_3;
                this._cachedBodyPartsGeometryType = _arg_2;
                this._cachedBodyPartsAvatarSet = k;
                this._Str_1945 = this._Str_581.getBodyParts(k, _arg_2, _arg_3);
            }
            return this._Str_1945;
        }

        public function errorThis(k:String):void
        {
            var _local_4:String;
            var _local_5:AvatarImageBodyPartContainer;
            if (this._Str_1708 == null)
            {
                return;
            }
            var _local_2:AvatarCanvas = this._Str_581.getCanvas(this._scale, this._Str_1708.definition.geometryType);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:Array = this.getBodyParts(k, this._Str_1708.definition.geometryType, this._Str_1668);
            var _local_6:int = (_local_3.length - 1);
            while (_local_6 >= 0)
            {
                _local_4 = _local_3[_local_6];
                _local_5 = this._Str_586.getImageContainer(_local_4, this._frameCounter, true);
                _local_6--;
            }
        }

        public function getImage(k:String, _arg_2:Boolean, _arg_3:Number=1):BitmapData
        {
            var _local_7:String;
            var _local_8:AvatarImageBodyPartContainer;
            var _local_9:BitmapData;
            var _local_10:Point;
            var _local_13:BitmapData;
            var _local_14:BitmapData;
            var _local_15:Matrix;
            if (!this._useTextures)
            {
                return this._Str_671;
            }
            if (this._Str_1708 == null)
            {
                return null;
            }
            if (!this._animationHasResetOnToggle)
            {
                this._Str_962();
            }
            var _local_4:String = this.getFullImageCacheKey();
            if (_local_4 != null)
            {
                if (this.getFullImage(_local_4))
                {
                    this._useTextures = false;
                    if (_arg_2)
                    {
                        return (this.getFullImage(_local_4) as BitmapData).clone();
                    }
                    this._Str_671 = (this.getFullImage(_local_4) as BitmapData);
                    this._Str_1586 = true;
                    return this._Str_671;
                }
            }
            var _local_5:AvatarCanvas = this._Str_581.getCanvas(this._scale, this._Str_1708.definition.geometryType);
            if (_local_5 == null)
            {
                return null;
            }
            if ((((this._Str_1586) || (this._Str_671 == null)) || ((!(this._Str_671.width == _local_5.width)) || (!(this._Str_671.height == _local_5.height)))))
            {
                if (((!(this._Str_671 == null)) && (!(this._Str_1586))))
                {
                    this._Str_671.dispose();
                }
                this._Str_671 = new BitmapData(_local_5.width, _local_5.height, true, 0);
                this._Str_1586 = false;
            }
            var _local_6:Array = this.getBodyParts(k, this._Str_1708.definition.geometryType, this._Str_1668);
            this._Str_671.lock();
            this._Str_671.fillRect(this._Str_671.rect, 0);
            var _local_11:Boolean = true;
            var _local_12:int = (_local_6.length - 1);
            while (_local_12 >= 0)
            {
                _local_7 = _local_6[_local_12];
                _local_8 = this._Str_586.getImageContainer(_local_7, this._frameCounter);
                if (_local_8)
                {
                    _local_11 = ((_local_11) && (_local_8.isCacheable));
                    _local_9 = _local_8.image;
                    _local_10 = _local_8._Str_1076.add(_local_5.offset);
                    if (((_local_9) && (_local_10)))
                    {
                        _local_10 = _local_10.add(_local_5._Str_1076);
                        this._Str_671.copyPixels(_local_9, _local_9.rect, _local_10, null, null, true);
                    }
                }
                _local_12--;
            }
            this._Str_671.unlock();
            this._useTextures = false;
            if (this._Str_2121 != null)
            {
                if (this._Str_2121.paletteIsGrayscale)
                {
                    _local_13 = this.convertToGrayscale(this._Str_671);
                    if (this._Str_671)
                    {
                        this._Str_671.dispose();
                    }
                    this._Str_671 = _local_13;
                    this._Str_671.paletteMap(this._Str_671, this._Str_671.rect, new Point(0, 0), this._Str_2121.reds, [], []);
                }
                else
                {
                    this._Str_671.copyChannel(this._Str_671, this._Str_671.rect, new Point(0, 0), 2, 8);
                }
            }
            if (((!(_local_4 == null)) && (_local_11)))
            {
                this.cacheFullImage(_local_4, this._Str_671.clone());
            }
            if (_arg_3 != 1)
            {
                _local_14 = new BitmapData((this._Str_671.width * _arg_3), (this._Str_671.height * _arg_3), true, 0);
                _local_15 = new Matrix();
                _local_15.scale(_arg_3, _arg_3);
                _local_14.draw(this._Str_671, _local_15, null, null, null, true);
                _local_14.applyFilter(_local_14, _local_14.rect, new Point(), this._Str_1901());
                this._Str_671 = _local_14;
            }
            if (((this._Str_671) && (_arg_2)))
            {
                return this._Str_671.clone();
            }
            return this._Str_671;
        }

        private function _Str_1901():ConvolutionFilter
        {
            var k:Number = 8;
            var _local_2:Number = (k / -100);
            var _local_3:Number = ((_local_2 * -8) + 1);
            var _local_4:Array = [_local_2, _local_2, _local_2, _local_2, _local_3, _local_2, _local_2, _local_2, _local_2];
            return new ConvolutionFilter(3, 3, _local_4, 1);
        }

        public function _Str_818(k:String, _arg_2:Number=1):BitmapData
        {
            var _local_6:Rectangle;
            var _local_7:String;
            var _local_8:AvatarImageBodyPartContainer;
            var _local_9:BitmapData;
            var _local_10:Point;
            var _local_14:BitmapData;
            var _local_15:Matrix;
            if (this._Str_1708 == null)
            {
                return null;
            }
            if (!this._animationHasResetOnToggle)
            {
                this._Str_962();
            }
            var _local_3:AvatarCanvas = this._Str_581.getCanvas(this._scale, this._Str_1708.definition.geometryType);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:BitmapData = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
            var _local_5:Array = this._Str_581.getBodyParts(k, this._Str_1708.definition.geometryType, this._Str_1668);
            var _local_11:Rectangle = new Rectangle();
            var _local_12:int = (_local_5.length - 1);
            while (_local_12 >= 0)
            {
                _local_7 = _local_5[_local_12];
                _local_8 = this._Str_586.getImageContainer(_local_7, this._frameCounter);
                if (_local_8 != null)
                {
                    _local_9 = _local_8.image;
                    if (_local_9 == null)
                    {
                        _local_4.dispose();
                        return null;
                    }
                    _local_10 = _local_8._Str_1076;
                    _local_4.copyPixels(_local_9, _local_9.rect, _local_10, null, null, true);
                    _local_11.x = _local_10.x;
                    _local_11.y = _local_10.y;
                    _local_11.width = _local_9.width;
                    _local_11.height = _local_9.height;
                    if (_local_6 == null)
                    {
                        _local_6 = _local_11.clone();
                    }
                    else
                    {
                        _local_6 = _local_6.union(_local_11);
                    }
                }
                _local_12--;
            }
            if (_local_6 == null)
            {
                _local_6 = new Rectangle(0, 0, 1, 1);
            }
            var _local_13:BitmapData = new BitmapData(_local_6.width, _local_6.height, true, 0xFFFFFF);
            _local_13.copyPixels(_local_4, _local_6, new Point(0, 0), null, null, true);
            _local_4.dispose();
            if (_arg_2 != 1)
            {
                _local_14 = new BitmapData((_local_13.width * _arg_2), (_local_13.height * _arg_2), true, 0);
                _local_15 = new Matrix();
                _local_15.scale(_arg_2, _arg_2);
                _local_14.draw(_local_13, _local_15, null, null, null, true);
                _local_14.applyFilter(_local_14, _local_14.rect, new Point(), this._Str_1901());
                _local_13 = _local_14;
            }
            return _local_13;
        }

        protected function getFullImage(k:String):BitmapData
        {
            return this._fullImageCache[k];
        }

        protected function cacheFullImage(k:String, _arg_2:BitmapData):void
        {
            if (this._fullImageCache.getValue(k))
            {
                (this._fullImageCache.getValue(k) as BitmapData).dispose();
                this._fullImageCache.remove(k);
            }
            this._fullImageCache[k] = _arg_2;
        }

        public function getAsset(k:String):BitmapDataAsset
        {
            return this._assets.getAssetByName(k) as BitmapDataAsset;
        }

        public function getDirection():int
        {
            return this._Str_1668;
        }

        public function _Str_913():void
        {
            this._Str_614 = new Array();
            this._animationHasResetOnToggle = false;
            this._currentActionsStr = "";
            this._actionsSorted = false;
        }

        public function _Str_962():void
        {
            var k:ActiveActionData;
            if (this.isHeadTurnPreventedByAction())
            {
                for each (k in this._Str_1163)
                {
                    if (k.actionType == AvatarAction.EFFECT)
                    {
                        if (!this._Str_1210.isReady(parseInt(k.actionParameter)))
                        {
                            this._Str_1210._Str_1914(parseInt(k.actionParameter), this);
                        }
                    }
                }
                this._Str_1632();
                this.setActionsToParts();
            }
        }

        public function appendAction(k:String, ... _args):Boolean
        {
            var _local_3:String;
            var _local_4:ActionDefinition;
            this._animationHasResetOnToggle = false;
            if (((!(_args == null)) && (_args.length > 0)))
            {
                _local_3 = _args[0];
            }
            switch (k)
            {
                case AvatarAction.POSTURE:
                    switch (_local_3)
                    {
                        case AvatarAction.POSTURE_LAY:
                            if (this._Str_1668 == 0)
                            {
                                this.setDirection(AvatarSetType.FULL, 4);
                            }
                            else
                            {
                                this.setDirection(AvatarSetType.FULL, 2);
                            }
                        case AvatarAction.POSTURE_WALK:
                            this._actionsSorted = true;
                        case AvatarAction.POSTURE_STAND:
                            this._actionsSorted = true;
                        case AvatarAction.POSTURE_SWIM:
                        case AvatarAction.POSTURE_FLOAT:
                        case AvatarAction.POSTURE_SIT:
                        case AvatarAction.SNOWWAR_RUN:
                        case AvatarAction.SNOWWAR_DIE_FRONT:
                        case AvatarAction.SNOWWAR_DIE_BACK:
                        case AvatarAction.SNOWWAR_PICK:
                        case AvatarAction.SNOWWAR_THROW:
                            this.addActionData(_local_3);
                            break;
                        default:
                            this.logThis(("appendAction() >> UNKNOWN POSTURE TYPE: " + _local_3));
                    }
                    break;
                case AvatarAction.GESTURE:
                    switch (_local_3)
                    {
                        case AvatarAction.GESTURE_AGGRAVATED:
                        case AvatarAction.GESTURE_SAD:
                        case AvatarAction.GESTURE_SMILE:
                        case AvatarAction.GESTURE_SURPRISED:
                            this.addActionData(_local_3);
                            break;
                        default:
                            this.logThis(("appendAction() >> UNKNOWN GESTURE TYPE: " + _local_3));
                    }
                    break;
                case AvatarAction.EFFECT:
                    if (((((((_local_3 == "33") || (_local_3 == "34")) || (_local_3 == "35")) || (_local_3 == "36")) || (_local_3 == "38")) || (_local_3 == "39")))
                    {
                        this._actionsSorted = true;
                    }
                case AvatarAction.DANCE:
                case AvatarAction.TALK:
                case AvatarAction.EXPRESSION_WAVE:
                case AvatarAction.SLEEP:
                case AvatarAction.SIGN:
                case AvatarAction.EXPRESSION_RESPECT:
                case AvatarAction.EXPRESSION_BLOW_A_KISS:
                case AvatarAction.EXPRESSION_LAUGH:
                case AvatarAction.EXPRESSION_CRY:
                case AvatarAction.EXPRESSION_IDLE:
                case AvatarAction.EXPRESSION_SNOWBOARD_OLLIE:
                case AvatarAction.EXPRESSION_SNOWBORD_360:
                case AvatarAction.EXPRESSION_RIDE_JUMP:
                    this.addActionData(k, _local_3);
                    break;
                case AvatarAction.CARRY_OBJECT:
                case AvatarAction.USE_OBJECT:
                    _local_4 = this._Str_581._Str_2018(k);
                    if (_local_4 != null)
                    {
                        this.setUniqueIdentifier(("appendAction:" + [_local_3, "->", _local_4.getParameterValue(_local_3)]));
                        _local_3 = _local_4.getParameterValue(_local_3);
                    }
                    this.addActionData(k, _local_3);
                    break;
                default:
                    this.logThis(("appendAction() >> UNKNOWN ACTION TYPE: " + k));
            }
            return true;
        }

        protected function addActionData(k:String, _arg_2:String=""):void
        {
            var _local_3:ActiveActionData;
            if (this._Str_614 == null)
            {
                this._Str_614 = new Array();
            }
            var _local_4:int;
            while (_local_4 < this._Str_614.length)
            {
                _local_3 = this._Str_614[_local_4];
                if (((_local_3.actionType == k) && (_local_3.actionParameter == _arg_2)))
                {
                    return;
                }
                _local_4++;
            }
            this._Str_614.push(new ActiveActionData(k, _arg_2, this._frameCounter));
        }

        public function _Str_899():Boolean
        {
            return (this._gpuMode) || (this._animFrameCount > 1);
        }

        private function _Str_1632():Boolean
        {
            this._isAnimating = false;
            this._gpuMode = false;
            this._layersInUse = [];
            this._Str_2121 = null;
            this._directionOffset = 0;
            this._Str_581._Str_2101(this);
            this._Str_1708 = this._defaultAction;
            this._Str_1708.definition = this._defaultAction.definition;
            this.resetBodyPartCache(this._defaultAction);
            return true;
        }

        private function resetActions():Boolean
        {
            var _local_2:IActionDefinition;
            var _local_3:ActiveActionData;
            var k:Boolean;
            if (this._Str_1163 == null)
            {
                return false;
            }
            for each (_local_3 in this._Str_1163)
            {
                _local_2 = this._Str_581._Str_2018(_local_3.actionType);
                if (((!(_local_2 == null)) && (_local_2.getPreventHeadTurn(_local_3.actionParameter))))
                {
                    k = true;
                }
            }
            return k;
        }

        private function isHeadTurnPreventedByAction():Boolean
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:ActiveActionData;
            var _local_5:int;
            var k:Boolean;
            this._currentActionsStr = "";
            this._Str_1163 = this._Str_581.isHeadTurnPreventedByAction(this._Str_614);
            this._animFrameCount = this._Str_581._Str_1936(this._Str_1163);
            if (this._Str_1163 == null)
            {
                this._Str_903 = new Array(0, 0, 0);
                if (this._lastActionsStr != "")
                {
                    k = true;
                    this._lastActionsStr = "";
                }
            }
            else
            {
                this._Str_903 = this._Str_581._Str_781(this._Str_1163, this._scale, this._Str_1668);
                for each (_local_4 in this._Str_1163)
                {
                    this._currentActionsStr = (this._currentActionsStr + (_local_4.actionType + _local_4.actionParameter));
                    if (_local_4.actionType == AvatarAction.EFFECT)
                    {
                        _local_5 = parseInt(_local_4.actionParameter);
                        if (this._effectIdInUse != _local_5)
                        {
                            _local_2 = true;
                        }
                        this._effectIdInUse = _local_5;
                        _local_3 = true;
                    }
                }
                if (!_local_3)
                {
                    if (this._effectIdInUse > -1)
                    {
                        _local_2 = true;
                    }
                    this._effectIdInUse = -1;
                }
                if (_local_2)
                {
                    this._Str_586._Str_1086(0);
                }
                if (this._lastActionsStr != this._currentActionsStr)
                {
                    k = true;
                    this._lastActionsStr = this._currentActionsStr;
                }
            }
            this._animationHasResetOnToggle = true;
            return k;
        }

        private function setActionsToParts():void
        {
            var k:ActiveActionData;
            var _local_2:Animation;
            var _local_5:Array;
            var _local_6:String;
            if (this._Str_1163 == null)
            {
                return;
            }
            var _local_3:int = getTimer();
            var _local_4:Array = new Array();
            for each (k in this._Str_1163)
            {
                _local_4.push(k.actionType);
            }
            for each (k in this._Str_1163)
            {
                if ((((k) && (k.definition)) && (k.definition.isAnimation)))
                {
                    _local_2 = this._Str_581.getAnimation(((k.definition.state + ".") + k.actionParameter));
                    if (((_local_2) && (_local_2.hasOverriddenActions())))
                    {
                        _local_5 = _local_2.overriddenActionNames();
                        if (_local_5)
                        {
                            for each (_local_6 in _local_5)
                            {
                                if (_local_4.indexOf(_local_6) >= 0)
                                {
                                    k.overridingAction = _local_2.overridingAction(_local_6);
                                }
                            }
                        }
                    }
                    if (((_local_2) && (_local_2.resetOnToggle)))
                    {
                        this._isAnimating = true;
                    }
                }
            }
            for each (k in this._Str_1163)
            {
                if (!((!(k)) || (!(k.definition))))
                {
                    if (((k.definition.isAnimation) && (k.actionParameter == "")))
                    {
                        k.actionParameter = "1";
                    }
                    this._Str_1496(k, _local_3);
                    if (k.definition.isAnimation)
                    {
                        this._gpuMode = k.definition.isAnimated(k.actionParameter);
                        _local_2 = this._Str_581.getAnimation(((k.definition.state + ".") + k.actionParameter));
                        if (_local_2 != null)
                        {
                            this._layersInUse = this._layersInUse.concat(_local_2.spriteData);
                            if (_local_2.hasDirectionData())
                            {
                                this._directionOffset = _local_2.directionData.offset;
                            }
                            if (_local_2.hasAvatarData())
                            {
                                this._Str_2121 = _local_2.avatarData;
                            }
                        }
                    }
                }
            }
        }

        private function _Str_1496(k:IActiveActionData, _arg_2:int):void
        {
            if (((k == null) || (k.definition == null)))
            {
                return;
            }
            if (k.definition.assetPartDefinition == "")
            {
                return;
            }
            if (k.definition.isMain)
            {
                this._Str_1708 = k;
                this._Str_586.setGeometryType(k.definition.geometryType);
            }
            this._Str_586._Str_1565(k, _arg_2);
            this._useTextures = true;
        }

        private function resetBodyPartCache(k:IActiveActionData):void
        {
            if (k == null)
            {
                return;
            }
            if (k.definition.assetPartDefinition == "")
            {
                return;
            }
            if (k.definition.isMain)
            {
                this._Str_1708 = k;
                this._Str_586.setGeometryType(k.definition.geometryType);
            }
            this._Str_586.resetBodyPartCache(k);
            this._useTextures = true;
        }

        public function get _Str_920():IAvatarDataContainer
        {
            return this._Str_2121;
        }

        private function convertToGrayscale(k:BitmapData, _arg_2:String="CHANNELS_EQUAL"):BitmapData
        {
            var _local_3:Number = 0.33;
            var _local_4:Number = 0.33;
            var _local_5:Number = 0.33;
            var _local_6:Number = 1;
            switch (_arg_2)
            {
                case "CHANNELS_UNIQUE":
                    _local_3 = 0.3;
                    _local_4 = 0.59;
                    _local_5 = 0.11;
                    break;
                case "CHANNELS_RED":
                    _local_3 = 1;
                    _local_4 = 0;
                    _local_5 = 0;
                    break;
                case "CHANNELS_GREEN":
                    _local_3 = 0;
                    _local_4 = 1;
                    _local_5 = 0;
                    break;
                case "CHANNELS_BLUE":
                    _local_3 = 0;
                    _local_4 = 0;
                    _local_5 = 1;
                    break;
                case "CHANNELS_DESATURATED":
                    _local_3 = 0.3086;
                    _local_4 = 0.6094;
                    _local_5 = 0.082;
                    break;
            }
            var _local_7:Array = [_local_3, _local_4, _local_5, 0, 0, _local_3, _local_4, _local_5, 0, 0, _local_3, _local_4, _local_5, 0, 0, 0, 0, 0, 1, 0];
            var _local_8:ColorMatrixFilter = new ColorMatrixFilter(_local_7);
            var _local_9:BitmapData = new BitmapData(k.width, k.height, k.transparent, 0xFFFFFFFF);
            _local_9.copyPixels(k, k.rect, new Point(0, 0), null, null, false);
            _local_9.applyFilter(_local_9, _local_9.rect, new Point(0, 0), _local_8);
            return _local_9;
        }

        private function logThis(k:String):void
        {
        }

        private function setUniqueIdentifier(k:String):void
        {
        }

        public function isPlaceholder():Boolean
        {
            return false;
        }

        public function _Str_998():void
        {
            this._lastActionsStr = "";
        }

        public function get _Str_677():Boolean
        {
            return this._isAnimating;
        }

        public function get _Str_792():String
        {
            return this._Str_1708.actionType;
        }

        public function updateAnimationByFrames(k:int):void
        {
            if (k == this._effectIdInUse)
            {
                this._Str_1632();
                this.setActionsToParts();
                this._isAnimating = true;
                this._useTextures = true;
                if (this._Str_1153)
                {
                    this._Str_1153.updateAnimationByFrames(k);
                }
            }
        }
    }
}
