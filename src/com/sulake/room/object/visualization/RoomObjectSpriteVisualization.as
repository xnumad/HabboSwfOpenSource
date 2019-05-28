package com.sulake.room.object.visualization
{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.display.BlendMode;
    import flash.geom.Point;

    public class RoomObjectSpriteVisualization implements IRoomObjectSpriteVisualization 
    {
        private static var _Str_3822:int = 0;

        private var _layersInUse:Array;
        private var _object:IRoomObject;
        private var _assetCollection:IGraphicAssetCollection;
        protected var _objectUpdateID:int = -1;
        protected var _modelUpdateID:int = -1;
        protected var _currentScale:int = -1;
        private var _instanceId:int = 0;
        private var _updateID:int = 0;

        public function RoomObjectSpriteVisualization()
        {
            this._instanceId = _Str_3822++;
            this._layersInUse = [];
            this._object = null;
            this._assetCollection = null;
        }

        public function dispose():void
        {
            var k:RoomObjectSprite;
            if (this._layersInUse != null)
            {
                while (this._layersInUse.length > 0)
                {
                    k = (this._layersInUse[0] as RoomObjectSprite);
                    if (k != null)
                    {
                        k.dispose();
                    }
                    this._layersInUse.pop();
                }
                this._layersInUse = null;
            }
            this._object = null;
            this.assetCollection = null;
        }

        public function set assetCollection(k:IGraphicAssetCollection):void
        {
            if (this._assetCollection != null)
            {
                this._assetCollection._Str_19942();
            }
            this._assetCollection = k;
            if (this._assetCollection != null)
            {
                this._assetCollection._Str_9215();
            }
        }

        public function setExternalBaseUrls(k:String, _arg_2:String, _arg_3:Boolean):void
        {
        }

        public function get assetCollection():IGraphicAssetCollection
        {
            return this._assetCollection;
        }

        public function getUpdateID():int
        {
            return this._updateID;
        }

        public function getInstanceId():int
        {
            return this._instanceId;
        }

        protected function createSprites(k:int):void
        {
            var _local_2:RoomObjectSprite;
            while (this._layersInUse.length > k)
            {
                _local_2 = (this._layersInUse[(this._layersInUse.length - 1)] as RoomObjectSprite);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                }
                this._layersInUse.pop();
            }
            while (this._layersInUse.length < k)
            {
                _local_2 = new RoomObjectSprite();
                this._layersInUse.push(_local_2);
            }
        }

        public function addSprite():IRoomObjectSprite
        {
            return this.addSpriteAt(this._layersInUse.length);
        }

        public function addSpriteAt(k:int):IRoomObjectSprite
        {
            var _local_2:IRoomObjectSprite = new RoomObjectSprite();
            if (k >= this._layersInUse.length)
            {
                this._layersInUse.push(_local_2);
            }
            else
            {
                this._layersInUse.splice(k, 0, _local_2);
            }
            return _local_2;
        }

        public function removeSprite(k:IRoomObjectSprite):void
        {
            var _local_2:int = this._layersInUse.indexOf(k);
            if (_local_2 == -1)
            {
                throw (new Error("Trying to remove non-existing sprite!"));
            }
            this._layersInUse.splice(_local_2, 1);
            RoomObjectSprite(k).dispose();
        }

        public function get spriteCount():int
        {
            return this._layersInUse.length;
        }

        public function getSprite(k:int):IRoomObjectSprite
        {
            if (((k >= 0) && (k < this._layersInUse.length)))
            {
                return this._layersInUse[k];
            }
            return null;
        }

        public function get object():IRoomObject
        {
            return this._object;
        }

        public function set object(k:IRoomObject):void
        {
            this._object = k;
        }

        public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
        }

        protected function increaseUpdateId():void
        {
            this._updateID++;
        }

        protected function reset():void
        {
            this._objectUpdateID = 0xFFFFFFFF;
            this._modelUpdateID = 0xFFFFFFFF;
            this._currentScale = -1;
        }

        public function getSpriteList():Array
        {
            return null;
        }

        public function initialize(k:IRoomObjectVisualizationData):Boolean
        {
            return false;
        }

        public function get image():BitmapData
        {
            return this.getImage(0, -1);
        }

        public function getImage(bgColor:int, originalID:int):BitmapData
        {
            var tR:Number;
            var tG:Number;
            var tB:Number;
            var color:int;
            var r:int;
            var g:int;
            var b:int;
            var colorTransform:ColorTransform;
            var matrix:Matrix;
            var boundingRect:Rectangle = this.boundingRectangle;
            if ((boundingRect.width * boundingRect.height) == 0)
            {
                return null;
            }
            var count:int = this.spriteCount;
            var objectSprite:IRoomObjectSprite;
            var spriteList:Array = [];
            var index:int;
            var data:BitmapData;
            index = 0;
            while (index < count)
            {
                objectSprite = this.getSprite(index);
                if (((!(objectSprite == null)) && (objectSprite.visible)))
                {
                    data = objectSprite.asset;
                    if (data != null)
                    {
                        spriteList.push(objectSprite);
                    }
                }
                index = (index + 1);
            }
            spriteList.sortOn("relativeDepth", (Array.DESCENDING | Array.NUMERIC));
            var bitmapData:BitmapData;
            try
            {
                bitmapData = new BitmapData(boundingRect.width, boundingRect.height, true, bgColor);
            }
            catch(e:ArgumentError)
            {
                Logger.log(("Unable to create BitmapData object! " + e));
            }
            if (!bitmapData)
            {
                return new BitmapData(1, 1, true);
            }
            index = 0;
            while (index < spriteList.length)
            {
                objectSprite = (spriteList[index] as IRoomObjectSprite);
                data = objectSprite.asset;
                if (data != null)
                {
                    color = objectSprite.color;
                    r = (color >> 16);
                    g = ((color >> 8) & 0xFF);
                    b = (color & 0xFF);
                    colorTransform = null;
                    if ((((r < 0xFF) || (g < 0xFF)) || (b < 0xFF)))
                    {
                        tR = (r / 0xFF);
                        tG = (g / 0xFF);
                        tB = (b / 0xFF);
                        colorTransform = new ColorTransform(tR, tG, tB, (objectSprite.alpha / 0xFF));
                    }
                    else
                    {
                        if (objectSprite.alpha < 0xFF)
                        {
                            colorTransform = new ColorTransform(1, 1, 1, (objectSprite.alpha / 0xFF));
                        }
                    }
                    if (bgColor == 0)
                    {
                        if (objectSprite.blendMode == BlendMode.ADD)
                        {
                            if (colorTransform == null)
                            {
                                colorTransform = new ColorTransform(1, 1, 1, 0);
                            }
                            else
                            {
                                colorTransform.alphaMultiplier = 0;
                            }
                        }
                    }
                    matrix = new Matrix();
                    if (objectSprite.flipH)
                    {
                        matrix.scale(-1, 1);
                        matrix.translate(data.width, 0);
                    }
                    if (objectSprite.flipV)
                    {
                        matrix.scale(1, -1);
                        matrix.translate(0, data.height);
                    }
                    matrix.translate((objectSprite.offsetX - boundingRect.left), (objectSprite.offsetY - boundingRect.top));
                    bitmapData.draw(data, matrix, colorTransform, objectSprite.blendMode, null, false);
                }
                index = (index + 1);
            }
            return bitmapData;
        }

        public function get boundingRectangle():Rectangle
        {
            var _local_6:Point;
            var k:int = this.spriteCount;
            var _local_2:IRoomObjectSprite;
            var _local_3:Rectangle = new Rectangle();
            var _local_4:int;
            var _local_5:BitmapData;
            _local_4 = 0;
            while (_local_4 < k)
            {
                _local_2 = this.getSprite(_local_4);
                if (((!(_local_2 == null)) && (_local_2.visible)))
                {
                    _local_5 = _local_2.asset;
                    if (_local_5 != null)
                    {
                        _local_6 = new Point(_local_2.offsetX, _local_2.offsetY);
                        if (_local_4 == 0)
                        {
                            _local_3.left = _local_6.x;
                            _local_3.top = _local_6.y;
                            _local_3.right = (_local_6.x + _local_2.width);
                            _local_3.bottom = (_local_6.y + _local_2.height);
                        }
                        else
                        {
                            if (_local_6.x < _local_3.left)
                            {
                                _local_3.left = _local_6.x;
                            }
                            if (_local_6.y < _local_3.top)
                            {
                                _local_3.top = _local_6.y;
                            }
                            if ((_local_6.x + _local_2.width) > _local_3.right)
                            {
                                _local_3.right = (_local_6.x + _local_2.width);
                            }
                            if ((_local_6.y + _local_2.height) > _local_3.bottom)
                            {
                                _local_3.bottom = (_local_6.y + _local_2.height);
                            }
                        }
                    }
                }
                _local_4++;
            }
            return _local_3;
        }
    }
}
