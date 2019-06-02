package com.sulake.room.renderer
{
    import flash.geom.Point;
    import com.sulake.room.utils.RoomGeometry;
    import flash.display.Sprite;
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.cache.BitmapDataCache;
    import com.sulake.room.renderer.cache.RoomObjectCache;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.events.MouseEvent;
    import com.sulake.room.utils.Vector3d;
    import flash.display.DisplayObject;
    import com.sulake.room.utils.IRoomGeometry;
    import __AS3__.vec.Vector;
    import com.sulake.room.data.RoomObjectSpriteData;
    import flash.display.StageQuality;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.room.renderer.utils.ExtendedSprite;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.renderer.utils.SortableSprite;
    import com.sulake.room.renderer.cache.RoomObjectCacheItem;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.room.renderer.cache.RoomObjectLocationCacheItem;
    import com.sulake.room.renderer.cache.RoomObjectSortableSpriteCacheItem;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import flash.display.PixelSnapping;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.room.renderer.utils.ExtendedBitmapData;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.renderer.utils.ObjectMouseData;
    import com.sulake.room.object.logic.IRoomObjectMouseHandler;
    import com.sulake.room.utils.*;

    public class RoomSpriteCanvas implements IRoomRenderingCanvas 
    {
        private static const ZERO_POINT:Point = new Point(0, 0);
        private static const _Str_7607:int = 50;
        private static const _Str_18257:int = 50;
        private static const _Str_12906:Number = 60;
        private static const _Str_16799:Number = 50;
        private static const _Str_17101:int = 1000;

        private var _container:IRoomSpriteCanvasContainer;
        private var _geometry:RoomGeometry;
        private var _bgColor:int = 0;
        private var _master:Sprite;
        private var _spriteMask:Sprite;
        private var _display:Sprite;
        private var _mouseActiveObjects:Map;
        private var _mouseLocation:Point;
        private var _bitmapDataCache:BitmapDataCache;
        private var _roomObjectCache:RoomObjectCache;
        private var _sortableSpriteList:Array;
        private var _spritePool:Array;
        private var _mouseListener:IRoomRenderingCanvasMouseListener = null;
        private var _id:int;
        private var _eventCache:Map = null;
        private var _eventId:int = 0;
        private var _wd:int;
        private var _ht:int;
        private var _screenOffsetX:int;
        private var _screenOffsetY:int;
        private var _renderedWd:int;
        private var _renderedHt:int;
        private var _renderTimeStamp:int = -1;
        private var _mouseOldX:Number = -10000000;
        private var _mouseOldY:Number = -10000000;
        private var _mouseCheckCount:int = 0;
        private var _mouseSpriteWasHit:Boolean = false;
        private var _useMask:Boolean = false;
        private var _colorTransform:ColorTransform;
        private var _flipHorizontalMatrix:Matrix;
        private var _averageUpdateInterval:Number = 0;
        private var _updateCounter:int = 0;
        private var _runningSlow:Boolean = false;
        private var _skipObjectUpdate:Boolean = false;
        private var _spriteCount:int = 0;
        private var _usesExclusionRectangles:Boolean = false;
        private var _excludedRectangles:Array;
        private var _activeSpriteCount:int = 0;
        private var _averageRenderMs:Number = 0;
        private var _previousRenderMs:int = 0;
        private var _previousSlowFrameUpdateMs:int = 0;
        private var _scale:Number = 1;
        private var _noSpriteVisibilityChecking:Boolean;

        public function RoomSpriteCanvas(k:IRoomSpriteCanvasContainer, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            this._mouseActiveObjects = new Map();
            this._mouseLocation = new Point();
            this._sortableSpriteList = [];
            this._spritePool = [];
            this._excludedRectangles = [];
            super();
            this._container = k;
            this._id = _arg_2;
            this._master = new Sprite();
            this._master.mouseEnabled = false;
            this._display = new Sprite();
            this._display.name = "canvas";
            this._display.mouseEnabled = false;
            this._master.addChild(this._display);
            this._display.mouseEnabled = true;
            this._display.doubleClickEnabled = true;
            this._display.addEventListener(MouseEvent.CLICK, this._Str_4612);
            this._display.addEventListener(MouseEvent.DOUBLE_CLICK, this._Str_4612);
            this._geometry = new RoomGeometry(_arg_5, new Vector3d(-135, 30, 0), new Vector3d(11, 11, 5), new Vector3d(-135, 0.5, 0));
            this._bitmapDataCache = new BitmapDataCache(16, 32, 1);
            var _local_6:String;
            if (this._container != null)
            {
                _local_6 = this._container.roomObjectVariableAccurateZ;
            }
            this._eventCache = new Map();
            this._roomObjectCache = new RoomObjectCache(_local_6);
            this._colorTransform = new ColorTransform();
            this._flipHorizontalMatrix = new Matrix();
            this.initialize(_arg_3, _arg_4);
        }

        protected function get container():IRoomSpriteCanvasContainer
        {
            return this._container;
        }

        protected function get _Str_21597():int
        {
            return this._activeSpriteCount;
        }

        public function get width():int
        {
            return this._wd * this._scale;
        }

        public function get height():int
        {
            return this._ht * this._scale;
        }

        public function set _Str_3629(k:int):void
        {
            this._mouseLocation.x = (this._mouseLocation.x - (k - this._screenOffsetX));
            this._screenOffsetX = k;
        }

        public function set _Str_3768(k:int):void
        {
            this._mouseLocation.y = (this._mouseLocation.y - (k - this._screenOffsetY));
            this._screenOffsetY = k;
        }

        public function get _Str_3629():int
        {
            return this._screenOffsetX;
        }

        public function get _Str_3768():int
        {
            return this._screenOffsetY;
        }

        public function get displayObject():DisplayObject
        {
            return this._master;
        }

        public function get geometry():IRoomGeometry
        {
            return this._geometry;
        }

        public function set mouseListener(k:IRoomRenderingCanvasMouseListener):void
        {
            this._mouseListener = k;
        }

        public function set useMask(k:Boolean):void
        {
            if (((k) && (!(this._useMask))))
            {
                this._useMask = true;
                if (((!(this._spriteMask == null)) && (!(this._master.contains(this._spriteMask)))))
                {
                    this._master.addChild(this._spriteMask);
                    this._display.mask = this._spriteMask;
                }
            }
            else
            {
                if (((!(k)) && (this._useMask)))
                {
                    this._useMask = false;
                    if (((!(this._spriteMask == null)) && (this._master.contains(this._spriteMask))))
                    {
                        this._master.removeChild(this._spriteMask);
                        this._display.mask = null;
                    }
                }
            }
        }

        public function _Str_15625():Vector.<RoomObjectSpriteData>
        {
            return this._roomObjectCache._Str_15625();
        }

        public function _Str_14588():Array
        {
            return this._roomObjectCache._Str_14588();
        }

        public function _Str_13261(k:Number, _arg_2:Point=null, _arg_3:Point=null, _arg_4:Boolean=false):void
        {
            if ((((!(this._master)) || (!(this._master.stage))) || (!(this._display))))
            {
                return;
            }
            if (_arg_2 == null)
            {
                _arg_2 = new Point((this._master.stage.stageWidth / 2), (this._master.stage.stageHeight / 2));
            }
            if (_arg_3 == null)
            {
                _arg_3 = _arg_2;
            }
            _arg_2 = this._display.globalToLocal(_arg_2);
            this._scale = k;
            if (this._scale < 1)
            {
                this._display.stage.quality = ((this._scale == 0.5) ? StageQuality.BEST : this._display.stage.quality);
                if (!_arg_4)
                {
                    this._display.rotationX = 0;
                }
            }
            else
            {
                this._display.stage.quality = StageQuality.LOW;
                if (!_arg_4)
                {
                    this._display.rotationX = NaN;
                }
            }
            this._Str_3629 = (_arg_3.x - (_arg_2.x * k));
            this._Str_3768 = (_arg_3.y - (_arg_2.y * k));
        }

        public function get scale():Number
        {
            return this._scale;
        }

        public function _Str_21425():BitmapData
        {
            this._noSpriteVisibilityChecking = true;
            var k:Number = this._scale;
            var _local_2:int = this._screenOffsetX;
            var _local_3:int = this._screenOffsetY;
            var _local_4:String = this._display.stage.quality;
            var _local_5:Number = this._display.rotationX;
            this._Str_13261(1);
            this._screenOffsetX = 0;
            this._screenOffsetY = 0;
            this._display.stage.quality = StageQuality.LOW;
            this._display.rotationX = NaN;
            this.render(-1, true);
            var _local_6:BitmapData = new BitmapData(this._display.width, this._display.height, true, 0);
            var _local_7:Rectangle = this._display.getBounds(this._display);
            _local_6.draw(this._display, new Matrix(1, 0, 0, 1, -(_local_7.x), -(_local_7.y)));
            this._noSpriteVisibilityChecking = false;
            this._Str_13261(k);
            this._screenOffsetX = _local_2;
            this._screenOffsetY = _local_3;
            this._display.stage.quality = _local_4;
            this._display.rotationX = _local_5;
            return _local_6;
        }

        public function _Str_20787():void
        {
            this._noSpriteVisibilityChecking = true;
            this.render(-1, true);
        }

        public function _Str_22174():void
        {
            this._noSpriteVisibilityChecking = false;
        }

        public function dispose():void
        {
            this._Str_20677(0, true);
            if (this._geometry != null)
            {
                this._geometry.dispose();
                this._geometry = null;
            }
            if (this._spriteMask != null)
            {
                this._spriteMask = null;
            }
            if (this._bitmapDataCache != null)
            {
                this._bitmapDataCache.dispose();
                this._bitmapDataCache = null;
            }
            if (this._roomObjectCache != null)
            {
                this._roomObjectCache.dispose();
                this._roomObjectCache = null;
            }
            this._container = null;
            if (this._master != null)
            {
                while (this._master.numChildren > 0)
                {
                    this._master.removeChildAt(0);
                }
                this._master = null;
            }
            this._display = null;
            this._spriteMask = null;
            this._sortableSpriteList = [];
            if (this._mouseActiveObjects != null)
            {
                this._mouseActiveObjects.dispose();
                this._mouseActiveObjects = null;
            }
            var k:int;
            if (this._spritePool != null)
            {
                k = 0;
                while (k < this._spritePool.length)
                {
                    this._Str_21974((this._spritePool[k] as ExtendedSprite), true);
                    k++;
                }
                this._spritePool = [];
            }
            if (this._eventCache != null)
            {
                this._eventCache.dispose();
                this._eventCache = null;
            }
            this._mouseListener = null;
            this._colorTransform = null;
            this._flipHorizontalMatrix = null;
        }

        public function initialize(k:int, _arg_2:int):void
        {
            if (k < 1)
            {
                k = 1;
            }
            if (_arg_2 < 1)
            {
                _arg_2 = 1;
            }
            if (this._spriteMask != null)
            {
                this._spriteMask.graphics.clear();
            }
            else
            {
                this._spriteMask = new Sprite();
                this._spriteMask.name = "mask";
                if (this._useMask)
                {
                    this._master.addChild(this._spriteMask);
                    this._display.mask = this._spriteMask;
                }
            }
            this._spriteMask.graphics.beginFill(0);
            this._spriteMask.graphics.drawRect(0, 0, k, _arg_2);
            this._wd = k;
            this._ht = _arg_2;
        }

        public function _Str_17192(k:String):void
        {
            this._roomObjectCache.removeObjectCache(k);
        }

        public function render(k:int, _arg_2:Boolean=false):void
        {
            if (k == -1)
            {
                (k == (this._renderTimeStamp + 1));
            }
            this._skipObjectUpdate = (!(this._skipObjectUpdate));
            var _local_3:int;
            if (((this._container == null) || (this._geometry == null)))
            {
                return;
            }
            if (k == this._renderTimeStamp)
            {
                return;
            }
            this._Str_24182(k);
            this._bitmapDataCache.compress();
            var _local_4:int = this._container.getRoomObjectCount();
            var _local_5:int;
            var _local_6:int;
            var _local_7:String = "";
            var _local_8:IRoomObject;
            if (((!(this._wd == this._renderedWd)) || (!(this._ht == this._renderedHt))))
            {
                _arg_2 = true;
            }
            if ((((!(this._display.x == this._screenOffsetX)) || (!(this._display.y == this._screenOffsetY))) || (!(this._display.scaleX == this._scale))))
            {
                this._display.x = this._screenOffsetX;
                this._display.y = this._screenOffsetY;
                this._display.scaleX = this._scale;
                this._display.scaleY = this._scale;
                _arg_2 = true;
            }
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_8 = this._container.getRoomObjectWithIndex(_local_5);
                if (_local_8 != null)
                {
                    _local_7 = this._container.getRoomObjectIdWithIndex(_local_5);
                    _local_6 = (_local_6 + this._Str_24532(_local_8, _local_7, k, _arg_2, _local_6));
                }
                _local_5++;
            }
            this._sortableSpriteList.sortOn("z", (Array.DESCENDING | Array.NUMERIC));
            if (_local_6 < this._sortableSpriteList.length)
            {
                this._sortableSpriteList.splice(_local_6);
            }
            var _local_9:SortableSprite;
            _local_5 = 0;
            while (_local_5 < _local_6)
            {
                _local_9 = (this._sortableSpriteList[_local_5] as SortableSprite);
                if (_local_9 != null)
                {
                    this.updateSprite(_local_5, _local_9);
                }
                _local_5++;
            }
            this._Str_20677(_local_6);
            this._renderTimeStamp = k;
            this._renderedWd = this._wd;
            this._renderedHt = this._ht;
        }

        private function _Str_24182(k:int):void
        {
            var _local_2:int;
            var _local_3:Number;
            if (this._renderTimeStamp > 0)
            {
                _local_2 = (k - this._renderTimeStamp);
                if (_local_2 > (_Str_12906 * 3))
                {
                    Logger.log((("Really slow frame update " + _local_2) + "ms"));
                    this._previousSlowFrameUpdateMs = _local_2;
                }
                if (_local_2 <= _Str_17101)
                {
                    this._updateCounter++;
                    if (this._updateCounter == (_Str_7607 + 1))
                    {
                        this._averageUpdateInterval = _local_2;
                        this._averageRenderMs = this._previousRenderMs;
                    }
                    else
                    {
                        if (this._updateCounter > (_Str_7607 + 1))
                        {
                            _local_3 = Number((this._updateCounter - _Str_7607));
                            this._averageUpdateInterval = (((this._averageUpdateInterval * (_local_3 - 1)) / _local_3) + (Number(_local_2) / _local_3));
                            this._averageRenderMs = (((this._averageRenderMs * (_local_3 - 1)) / _local_3) + (Number(this._previousRenderMs) / _local_3));
                            if (this._updateCounter > (_Str_7607 + _Str_18257))
                            {
                                this._updateCounter = _Str_7607;
                                if (((!(this._runningSlow)) && (this._averageUpdateInterval > _Str_12906)))
                                {
                                    this._runningSlow = true;
                                    Logger.log("Room canvas updating really slow - now entering frame skipping mode...");
                                }
                                else
                                {
                                    if (((this._runningSlow) && (this._averageUpdateInterval < _Str_16799)))
                                    {
                                        this._runningSlow = false;
                                        Logger.log("Room canvas updating fast again - now entering normal frame mode...");
                                    }
                                }
                                this._previousSlowFrameUpdateMs = 0;
                            }
                        }
                    }
                }
            }
        }

        protected function _Str_23739(k:String):RoomObjectCacheItem
        {
            return this._roomObjectCache.getObjectCache(k);
        }

        private function _Str_24532(k:IRoomObject, _arg_2:String, _arg_3:int, _arg_4:Boolean, _arg_5:int):int
        {
            var _local_22:BitmapData;
            var _local_6:IRoomObjectSpriteVisualization = (k.getVisualization() as IRoomObjectSpriteVisualization);
            if (_local_6 == null)
            {
                this._roomObjectCache.removeObjectCache(_arg_2);
                return 0;
            }
            var _local_7:RoomObjectCacheItem = this._Str_23739(_arg_2);
            _local_7._Str_1577 = k.getId();
            var _local_8:RoomObjectLocationCacheItem = _local_7.location;
            var _local_9:RoomObjectSortableSpriteCacheItem = _local_7.sprites;
            var _local_10:IVector3d = _local_8.getScreenLocation(k, this._geometry);
            if (_local_10 == null)
            {
                this._roomObjectCache.removeObjectCache(_arg_2);
                return 0;
            }
            _local_6.update(this._geometry, _arg_3, ((!(_local_9.isEmpty)) || (_arg_4)), ((this._skipObjectUpdate) && (this._runningSlow)));
            var _local_11:Boolean = _local_8.locationChanged;
            if (_local_11)
            {
                _arg_4 = true;
            }
            if (((!(_local_9._Str_17574(_local_6.getInstanceId(), _local_6.getUpdateID()))) && (!(_arg_4))))
            {
                return _local_9.spriteCount;
            }
            var _local_12:int = _local_6.spriteCount;
            var _local_13:int = _local_10.x;
            var _local_14:int = _local_10.y;
            var _local_15:Number = _local_10.z;
            if (_local_13 > 0)
            {
                _local_15 = (_local_15 + (_local_13 * 1.2E-7));
            }
            else
            {
                _local_15 = (_local_15 + (-(_local_13) * 1.2E-7));
            }
            _local_13 = (_local_13 + int((this._wd / 2)));
            _local_14 = (_local_14 + int((this._ht / 2)));
            var _local_16:int;
            var _local_17:SortableSprite;
            var _local_18:IRoomObjectSprite;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            while (_local_21 < _local_12)
            {
                _local_18 = _local_6.getSprite(_local_21);
                if (((!(_local_18 == null)) && (_local_18.visible)))
                {
                    _local_22 = _local_18.asset;
                    if (_local_22 != null)
                    {
                        _local_19 = ((_local_13 + _local_18.offsetX) + this._screenOffsetX);
                        _local_20 = ((_local_14 + _local_18.offsetY) + this._screenOffsetY);
                        if (this._Str_22622(_local_19, _local_20, _local_22.width, _local_22.height))
                        {
                            _local_17 = _local_9.getSprite(_local_16);
                            if (_local_17 == null)
                            {
                                _local_17 = new SortableSprite();
                                _local_9.addSprite(_local_17);
                                this._sortableSpriteList.push(_local_17);
                                _local_17.name = _arg_2;
                            }
                            _local_17.sprite = _local_18;
                            if (((_local_18._Str_4918 == RoomObjectSpriteType.AVATAR) || (_local_18._Str_4918 == RoomObjectSpriteType.AVATAR_OWN)))
                            {
                                _local_17.sprite._Str_3582 = ("avatar_" + k.getId());
                            }
                            _local_17.x = (_local_19 - this._screenOffsetX);
                            _local_17.y = (_local_20 - this._screenOffsetY);
                            _local_17.z = ((_local_15 + _local_18.relativeDepth) + (3.7E-11 * _arg_5));
                            _local_16++;
                            _arg_5++;
                        }
                    }
                }
                _local_21++;
            }
            _local_9.setSpriteCount(_local_16);
            return _local_16;
        }

        private function _Str_22622(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean
        {
            if (this._noSpriteVisibilityChecking)
            {
                return true;
            }
            k = (((k - this._screenOffsetX) * this._scale) + this._screenOffsetX);
            _arg_2 = (((_arg_2 - this._screenOffsetY) * this._scale) + this._screenOffsetY);
            _arg_3 = (_arg_3 * this._scale);
            _arg_4 = (_arg_4 * this._scale);
            if ((((k < this._wd) && ((k + _arg_3) >= 0)) && ((_arg_2 < this._ht) && ((_arg_2 + _arg_4) >= 0))))
            {
                if (!this._usesExclusionRectangles)
                {
                    return true;
                }
                return this._Str_24475(k, _arg_2, _arg_3, _arg_4);
            }
            return false;
        }

        private function _Str_24475(k:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean
        {
            var _local_5:Rectangle;
            if (k < 0)
            {
                _arg_3 = (_arg_3 + k);
                k = 0;
            }
            if (_arg_2 < 0)
            {
                _arg_4 = (_arg_4 + _arg_2);
                _arg_2 = 0;
            }
            if ((k + _arg_3) >= this._wd)
            {
                _arg_3 = (_arg_3 - ((this._wd + 1) - (k + _arg_3)));
            }
            if ((_arg_2 + _arg_4) >= this._ht)
            {
                _arg_4 = (_arg_4 - ((this._ht + 1) - (_arg_2 + _arg_4)));
            }
            for each (_local_5 in this._excludedRectangles)
            {
                if (((((k >= _local_5.left) && ((k + _arg_3) < _local_5.right)) && (_arg_2 >= _local_5.top)) && ((_arg_2 + _arg_4) < _local_5.bottom)))
                {
                    return false;
                }
            }
            return true;
        }

        protected function getSprite(k:int):ExtendedSprite
        {
            if (((k < 0) || (k >= this._spriteCount)))
            {
                return null;
            }
            var _local_2:ExtendedSprite = (this._display.getChildAt(k) as ExtendedSprite);
            return _local_2;
        }

        private function _Str_20892(k:SortableSprite, _arg_2:int=-1):void
        {
            var _local_3:ExtendedSprite;
            var _local_4:IRoomObjectSprite = k.sprite;
            if (this._spritePool.length > 0)
            {
                _local_3 = (this._spritePool.pop() as ExtendedSprite);
            }
            if (_local_3 == null)
            {
                _local_3 = new ExtendedSprite();
            }
            _local_3.x = k.x;
            _local_3.y = k.y;
            _local_3._Str_14797 = _local_4.offsetX;
            _local_3._Str_13379 = _local_4.offsetY;
            _local_3.identifier = k.name;
            _local_3.alpha = (_local_4.alpha / 0xFF);
            _local_3.tag = _local_4.tag;
            _local_3.blendMode = _local_4.blendMode;
            _local_3.filters = _local_4.filters;
            _local_3._Str_4593 = _local_4._Str_4593;
            _local_3._Str_4530 = _local_4._Str_4530;
            _local_3.smoothing = false;
            _local_3.pixelSnapping = PixelSnapping.ALWAYS;
            _local_3.bitmapData = this.getBitmapData(_local_4.asset, _local_4.assetName, _local_4.flipH, _local_4.flipV, _local_4.color);
            this._Str_21914(_local_3, _local_4);
            _local_3._Str_4023 = _local_4._Str_4023;
            if (((_arg_2 < 0) || (_arg_2 >= this._spriteCount)))
            {
                this._display.addChild(_local_3);
                this._spriteCount++;
            }
            else
            {
                this._display.addChildAt(_local_3, _arg_2);
            }
            this._activeSpriteCount++;
        }

        private function updateSprite(k:int, _arg_2:SortableSprite):Boolean
        {
            var _local_5:Number;
            var _local_6:BitmapData;
            if (k >= this._spriteCount)
            {
                this._Str_20892(_arg_2);
                return true;
            }
            var _local_3:IRoomObjectSprite = _arg_2.sprite;
            var _local_4:ExtendedSprite = this.getSprite(k);
            if (_local_4 != null)
            {
                if (_local_4._Str_4593 != _local_3._Str_4593)
                {
                    if (((_local_4._Str_4593) && (!(_local_3._Str_4593))))
                    {
                        this._display.removeChildAt(k);
                        this._spritePool.push(_local_4);
                        return this.updateSprite(k, _arg_2);
                    }
                    this._Str_20892(_arg_2, k);
                    return true;
                }
                if (((_local_4._Str_17574(_local_3._Str_12289, _local_3.updateId)) || (RoomEnterEffect.isVisualizationOn())))
                {
                    _local_4._Str_4023 = _local_3._Str_4023;
                    _local_5 = (_local_3.alpha / 0xFF);
                    if (_local_4.alpha != _local_5)
                    {
                        _local_4.alpha = _local_5;
                    }
                    _local_4.identifier = _arg_2.name;
                    _local_4.tag = _local_3.tag;
                    _local_4._Str_4593 = _local_3._Str_4593;
                    _local_4.blendMode = _local_3.blendMode;
                    _local_4._Str_4530 = _local_3._Str_4530;
                    _local_4.filters = _local_3.filters;
                    _local_6 = this.getBitmapData(_local_3.asset, _local_3.assetName, _local_3.flipH, _local_3.flipV, _local_3.color);
                    if (_local_4.bitmapData != _local_6)
                    {
                        _local_4.bitmapData = _local_6;
                    }
                    this._Str_21914(_local_4, _local_3);
                }
                if (_local_4.x != _arg_2.x)
                {
                    _local_4.x = _arg_2.x;
                }
                if (_local_4.y != _arg_2.y)
                {
                    _local_4.y = _arg_2.y;
                }
                _local_4._Str_14797 = _local_3.offsetX;
                _local_4._Str_13379 = _local_3.offsetY;
            }
            else
            {
                return false;
            }
            return true;
        }

        private function _Str_21914(k:ExtendedSprite, _arg_2:IRoomObjectSprite):void
        {
            if ((((!(RoomEnterEffect.isVisualizationOn())) || (k.bitmapData == null)) || (_arg_2 == null)))
            {
                return;
            }
            switch (_arg_2._Str_4918)
            {
                case RoomObjectSpriteType.AVATAR_OWN:
                    return;
                case RoomObjectSpriteType.ROOM_PLANE:
                    k.alpha = RoomEnterEffect.getDelta(0.9);
                    return;
                case RoomObjectSpriteType.AVATAR:
                    k.alpha = RoomEnterEffect.getDelta(0.5);
                    return;
                default:
                    k.alpha = RoomEnterEffect.getDelta(0.1);
            }
        }

        private function _Str_20677(k:int, _arg_2:Boolean=false):void
        {
            var _local_4:int;
            if (this._display == null)
            {
                return;
            }
            if (k < 0)
            {
                k = 0;
            }
            var _local_3:ExtendedSprite;
            if (((k < this._activeSpriteCount) || (this._activeSpriteCount == 0)))
            {
                _local_4 = (this._spriteCount - 1);
                while (_local_4 >= k)
                {
                    _local_3 = this.getSprite(_local_4);
                    this._Str_21974(_local_3, _arg_2);
                    _local_4--;
                }
            }
            this._activeSpriteCount = k;
        }

        private function _Str_21974(k:ExtendedSprite, _arg_2:Boolean):void
        {
            if (k != null)
            {
                if (!_arg_2)
                {
                    k.bitmapData = null;
                }
                else
                {
                    k.dispose();
                }
            }
        }

        private function _Str_26414(k:int):SortableSprite
        {
            if (((k < 0) || (k >= this._sortableSpriteList.length)))
            {
                return null;
            }
            var _local_2:SortableSprite = (this._sortableSpriteList[k] as SortableSprite);
            return _local_2;
        }

        private function getBitmapData(k:BitmapData, _arg_2:String, _arg_3:Boolean, _arg_4:Boolean, _arg_5:int):BitmapData
        {
            _arg_5 = (_arg_5 & 0xFFFFFF);
            if ((((!(_arg_3)) && (!(_arg_4))) && (_arg_5 == 0xFFFFFF)))
            {
                return k;
            }
            var _local_6:ExtendedBitmapData;
            var _local_7:String = "";
            if ((((_arg_3) || (_arg_4)) && (!(_arg_5 == 0xFFFFFF))))
            {
                _local_7 = ((((_arg_2 + " ") + _arg_5) + ((_arg_3) ? " FH" : "")) + ((_arg_4) ? " FV" : ""));
                if (_arg_2.length > 0)
                {
                    _local_6 = this._bitmapDataCache.getBitmapData(_local_7);
                }
                if (_local_6 == null)
                {
                    _local_6 = this._Str_13506(k, _arg_2, _arg_5);
                    if (_local_6 != null)
                    {
                        _local_6 = this._Str_14460(_local_6, _arg_2, true, _arg_3, _arg_4);
                        if (_arg_2.length > 0)
                        {
                            this._bitmapDataCache.addBitmapData(_local_7, _local_6);
                        }
                        return _local_6;
                    }
                    _local_6 = this._Str_14460(k, _arg_2, true, _arg_3, _arg_4);
                    if (_local_6 != null)
                    {
                        _local_6 = this._Str_13506(_local_6, "", _arg_5, true);
                        if (_arg_2.length > 0)
                        {
                            this._bitmapDataCache.addBitmapData(_local_7, _local_6);
                        }
                        return _local_6;
                    }
                    _local_6 = this._Str_13506(k, _arg_2, _arg_5, true);
                    _local_6 = this._Str_14460(_local_6, _arg_2, true, _arg_3, _arg_4);
                    if (_arg_2.length > 0)
                    {
                        this._bitmapDataCache.addBitmapData(_local_7, _local_6);
                    }
                }
            }
            else
            {
                if (((_arg_3) || (_arg_4)))
                {
                    _local_6 = this._Str_14460(k, _arg_2, true, _arg_3, _arg_4);
                }
                else
                {
                    if (_arg_5 != 0xFFFFFF)
                    {
                        _local_6 = this._Str_13506(k, _arg_2, _arg_5, true);
                    }
                    else
                    {
                        return k;
                    }
                }
            }
            return _local_6;
        }

        private function _Str_14460(data:BitmapData, name:String, allowCreation:Boolean=false, flipH:Boolean=true, flipV:Boolean=false):ExtendedBitmapData
        {
            var cacheName:String = ((name + ((flipH) ? " FH" : "")) + ((flipV) ? " FV" : ""));
            var finalData:ExtendedBitmapData;
            if (name.length > 0)
            {
                finalData = this._bitmapDataCache.getBitmapData(cacheName);
                if (!allowCreation)
                {
                    return finalData;
                }
            }
            if (finalData == null)
            {
                try
                {
                    finalData = new ExtendedBitmapData(data.width, data.height, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    finalData = new ExtendedBitmapData(1, 1, true, 0xFFFFFF);
                }
                this._flipHorizontalMatrix.identity();
                if (flipH)
                {
                    this._flipHorizontalMatrix.scale(-1, 1);
                    this._flipHorizontalMatrix.translate(data.width, 0);
                }
                if (flipV)
                {
                    this._flipHorizontalMatrix.scale(1, -1);
                    this._flipHorizontalMatrix.translate(0, data.height);
                }
                finalData.draw(data, this._flipHorizontalMatrix);
                if (name.length > 0)
                {
                    this._bitmapDataCache.addBitmapData(cacheName, finalData);
                }
            }
            return finalData;
        }

        private function _Str_13506(data:BitmapData, name:String, color:int, allowCreation:Boolean=false):ExtendedBitmapData
        {
            var r:int;
            var g:int;
            var b:int;
            var tR:Number;
            var tG:Number;
            var tB:Number;
            var cacheName:String = ((name + " ") + color);
            var finalData:ExtendedBitmapData;
            if (name.length > 0)
            {
                finalData = this._bitmapDataCache.getBitmapData(cacheName);
                if (!allowCreation)
                {
                    return finalData;
                }
            }
            if (finalData == null)
            {
                r = ((color >> 16) & 0xFF);
                g = ((color >> 8) & 0xFF);
                b = (color & 0xFF);
                tR = (r / 0xFF);
                tG = (g / 0xFF);
                tB = (b / 0xFF);
                try
                {
                    finalData = new ExtendedBitmapData(data.width, data.height, true, 0xFFFFFF);
                    finalData.copyPixels(data, data.rect, ZERO_POINT);
                }
                catch(e:Error)
                {
                    finalData = new ExtendedBitmapData(1, 1, true, 0xFFFFFF);
                }
                this._colorTransform.redMultiplier = tR;
                this._colorTransform.greenMultiplier = tG;
                this._colorTransform.blueMultiplier = tB;
                finalData.colorTransform(finalData.rect, this._colorTransform);
                if (name.length > 0)
                {
                    this._bitmapDataCache.addBitmapData(cacheName, finalData);
                }
            }
            return finalData;
        }

        protected function _Str_20417(k:ExtendedSprite):String
        {
            var _local_2:String;
            if (k != null)
            {
                _local_2 = k.identifier;
                return _local_2;
            }
            return "";
        }

        public function handleMouseEvent(k:int, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean
        {
            k = (k - this._screenOffsetX);
            _arg_2 = (_arg_2 - this._screenOffsetY);
            this._mouseLocation.x = (k / this._scale);
            this._mouseLocation.y = (_arg_2 / this._scale);
            if (((this._mouseCheckCount > 0) && (_arg_3 == MouseEvent.MOUSE_MOVE)))
            {
                return this._mouseSpriteWasHit;
            }
            this._mouseSpriteWasHit = this._Str_19207((k / this._scale), (_arg_2 / this._scale), _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
            this._mouseCheckCount++;
            return this._mouseSpriteWasHit;
        }

        protected function _Str_11609(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:String, _arg_7:Boolean, _arg_8:Boolean, _arg_9:Boolean, _arg_10:Boolean):RoomSpriteMouseEvent
        {
            var _local_11:Number = (k - (this._wd / 2));
            var _local_12:Number = (_arg_2 - (this._ht / 2));
            var _local_13:String = ("canvas_" + this._id);
            var _local_14:RoomSpriteMouseEvent;
            _local_14 = new RoomSpriteMouseEvent(_arg_5, ((_local_13 + "_") + this._eventId), _local_13, _arg_6, _local_11, _local_12, _arg_3, _arg_4, _arg_8, _arg_7, _arg_9, _arg_10);
            return _local_14;
        }

        private function _Str_25606(k:Number, _arg_2:Number, _arg_3:Boolean, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean
        {
            var _local_15:String;
            var _local_8:Boolean;
            var _local_9:String = "";
            var _local_10:ExtendedSprite;
            var _local_11:RoomSpriteMouseEvent;
            var _local_12:String = MouseEvent.CLICK;
            if (_arg_3)
            {
                _local_12 = MouseEvent.DOUBLE_CLICK;
            }
            var _local_13:Array = [];
            var _local_14:int;
            _local_14 = (this._Str_21597 - 1);
            while (_local_14 >= 0)
            {
                _local_10 = this.getSprite(_local_14);
                if (((!(_local_10 == null)) && (_local_10._Str_4530)))
                {
                    if (_local_10.hitTest((k - _local_10.x), (_arg_2 - _local_10.y)))
                    {
                        _local_9 = this._Str_20417(_local_10);
                        if (_local_13.indexOf(_local_9) < 0)
                        {
                            _local_15 = _local_10.tag;
                            _local_11 = this._Str_11609(k, _arg_2, (k - _local_10.x), (_arg_2 - _local_10.y), _local_12, _local_15, _arg_4, _arg_5, _arg_6, _arg_7);
                            this._Str_14715(_local_11, _local_9);
                            _local_13.push(_local_9);
                        }
                    }
                    _local_8 = true;
                }
                _local_14--;
            }
            this._Str_20604();
            return _local_8;
        }

        private function _Str_19207(k:int, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false):Boolean
        {
            var _local_16:String;
            var _local_17:String;
            var _local_18:int;
            var _local_8:Boolean;
            var _local_9:String = "";
            var _local_10:ExtendedSprite;
            var _local_11:RoomSpriteMouseEvent;
            var _local_12:Array = [];
            var _local_13:ObjectMouseData;
            var _local_14:int;
            _local_14 = (this._Str_21597 - 1);
            while (_local_14 >= 0)
            {
                _local_10 = (this.getSprite(_local_14) as ExtendedSprite);
                if (((!(_local_10 == null)) && (_local_10.hitTestPoint((k - _local_10.x), (_arg_2 - _local_10.y)))))
                {
                    if (((_local_10._Str_4530) && ((_arg_3 == MouseEvent.CLICK) || (_arg_3 == MouseEvent.DOUBLE_CLICK))))
                    {
                    }
                    else
                    {
                        _local_9 = this._Str_20417(_local_10);
                        if (_local_12.indexOf(_local_9) < 0)
                        {
                            _local_16 = _local_10.tag;
                            _local_13 = (this._mouseActiveObjects.getValue(_local_9) as ObjectMouseData);
                            if (_local_13 != null)
                            {
                                if (_local_13.spriteTag != _local_16)
                                {
                                    _local_11 = this._Str_11609(0, 0, 0, 0, MouseEvent.ROLL_OUT, _local_13.spriteTag, _arg_4, _arg_5, _arg_6, _arg_7);
                                    this._Str_14715(_local_11, _local_9);
                                }
                            }
                            if (((_arg_3 == MouseEvent.MOUSE_MOVE) && ((_local_13 == null) || (!(_local_13.spriteTag == _local_16)))))
                            {
                                _local_11 = this._Str_11609(k, _arg_2, (k - _local_10.x), (_arg_2 - _local_10.y), MouseEvent.ROLL_OVER, _local_16, _arg_4, _arg_5, _arg_6, _arg_7);
                            }
                            else
                            {
                                _local_11 = this._Str_11609(k, _arg_2, (k - _local_10.x), (_arg_2 - _local_10.y), _arg_3, _local_16, _arg_4, _arg_5, _arg_6, _arg_7);
                                _local_11.spriteOffsetX = _local_10._Str_14797;
                                _local_11.spriteOffsetY = _local_10._Str_13379;
                            }
                            if (_local_13 == null)
                            {
                                _local_13 = new ObjectMouseData();
                                _local_13._Str_1577 = _local_9;
                                this._mouseActiveObjects.add(_local_9, _local_13);
                            }
                            _local_13.spriteTag = _local_16;
                            if ((((!(_arg_3 == MouseEvent.MOUSE_MOVE)) || (!(k == this._mouseOldX))) || (!(_arg_2 == this._mouseOldY))))
                            {
                                this._Str_14715(_local_11, _local_9);
                            }
                            _local_12.push(_local_9);
                        }
                        _local_8 = true;
                    }
                }
                _local_14--;
            }
            var _local_15:Array = this._mouseActiveObjects.getKeys();
            _local_14 = 0;
            while (_local_14 < _local_15.length)
            {
                _local_17 = (_local_15[_local_14] as String);
                _local_18 = _local_12.indexOf(_local_17);
                if (_local_18 >= 0)
                {
                    _local_15[_local_14] = null;
                }
                _local_14++;
            }
            _local_14 = 0;
            while (_local_14 < _local_15.length)
            {
                _local_9 = (_local_15[_local_14] as String);
                if (_local_9 != null)
                {
                    _local_13 = (this._mouseActiveObjects.remove(_local_9) as ObjectMouseData);
                    if (_local_13 != null)
                    {
                        _local_11 = this._Str_11609(0, 0, 0, 0, MouseEvent.ROLL_OUT, _local_13.spriteTag, _arg_4, _arg_5, _arg_6, _arg_7);
                        this._Str_14715(_local_11, _local_9);
                    }
                }
                _local_14++;
            }
            this._Str_20604();
            this._mouseOldX = k;
            this._mouseOldY = _arg_2;
            return _local_8;
        }

        protected function _Str_14715(k:RoomSpriteMouseEvent, _arg_2:String):void
        {
            if (((!(this._eventCache == null)) && (!(k == null))))
            {
                this._eventCache.remove(_arg_2);
                this._eventCache.add(_arg_2, k);
            }
        }

        protected function _Str_20604():void
        {
            var _local_3:String;
            var _local_4:RoomSpriteMouseEvent;
            var _local_5:IRoomObject;
            var _local_6:IRoomObjectMouseHandler;
            if (((this._container == null) || (this._eventCache == null)))
            {
                return;
            }
            var k:int = this._eventCache.length;
            var _local_2:int;
            while (_local_2 < k)
            {
                if (this._eventCache == null)
                {
                    return;
                }
                _local_3 = this._eventCache.getKey(_local_2);
                _local_4 = this._eventCache.getWithIndex(_local_2);
                if (((!(_local_3 == null)) && (!(_local_4 == null))))
                {
                    _local_5 = this._container.getRoomObject(_local_3);
                    if (_local_5 != null)
                    {
                        if (this._mouseListener != null)
                        {
                            this._mouseListener.processRoomCanvasMouseEvent(_local_4, _local_5, this.geometry);
                        }
                        else
                        {
                            _local_6 = _local_5.getMouseHandler();
                            if (_local_6 != null)
                            {
                                _local_6.mouseEvent(_local_4, this._geometry);
                            }
                        }
                    }
                }
                _local_2++;
            }
            if (this._eventCache)
            {
                this._eventCache.reset();
            }
        }

        public function update():void
        {
            if (this._mouseCheckCount == 0)
            {
                this._Str_19207(this._mouseLocation.x, this._mouseLocation.y, MouseEvent.MOUSE_MOVE);
            }
            this._mouseCheckCount = 0;
            this._eventId++;
        }

        private function _Str_4612(k:MouseEvent):void
        {
            var _local_2:Boolean;
            if (((k.type == MouseEvent.CLICK) || (k.type == MouseEvent.DOUBLE_CLICK)))
            {
                _local_2 = (k.type == MouseEvent.DOUBLE_CLICK);
                this._Str_25606(k.localX, k.localY, _local_2, k.altKey, k.ctrlKey, k.shiftKey, k.buttonDown);
            }
        }

        public function getId():int
        {
            return this._id;
        }
    }
}
