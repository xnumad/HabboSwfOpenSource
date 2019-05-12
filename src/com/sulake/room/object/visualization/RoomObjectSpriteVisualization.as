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

        private var _Str_1786:Array;
        private var _object:IRoomObject;
        private var _Str_4089:IGraphicAssetCollection;
        protected var _Str_7475:int = -1;
        protected var _Str_3603:int = -1;
        protected var _Str_3289:int = -1;
        private var _Str_4848:int = 0;
        private var _Str_2542:int = 0;

        public function RoomObjectSpriteVisualization()
        {
            this._Str_4848 = _Str_3822++;
            this._Str_1786 = [];
            this._object = null;
            this._Str_4089 = null;
        }

        public function dispose():void
        {
            var k:RoomObjectSprite;
            if (this._Str_1786 != null)
            {
                while (this._Str_1786.length > 0)
                {
                    k = (this._Str_1786[0] as RoomObjectSprite);
                    if (k != null)
                    {
                        k.dispose();
                    }
                    this._Str_1786.pop();
                }
                this._Str_1786 = null;
            }
            this._object = null;
            this._Str_2697 = null;
        }

        public function set _Str_2697(k:IGraphicAssetCollection):void
        {
            if (this._Str_4089 != null)
            {
                this._Str_4089._Str_19942();
            }
            this._Str_4089 = k;
            if (this._Str_4089 != null)
            {
                this._Str_4089._Str_9215();
            }
        }

        public function setExternalBaseUrls(k:String, _arg_2:String, _arg_3:Boolean):void
        {
        }

        public function get _Str_2697():IGraphicAssetCollection
        {
            return this._Str_4089;
        }

        public function _Str_3273():int
        {
            return this._Str_2542;
        }

        public function getInstanceId():int
        {
            return this._Str_4848;
        }

        protected function _Str_3773(k:int):void
        {
            var _local_2:RoomObjectSprite;
            while (this._Str_1786.length > k)
            {
                _local_2 = (this._Str_1786[(this._Str_1786.length - 1)] as RoomObjectSprite);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                }
                this._Str_1786.pop();
            }
            while (this._Str_1786.length < k)
            {
                _local_2 = new RoomObjectSprite();
                this._Str_1786.push(_local_2);
            }
        }

        public function _Str_12937():IRoomObjectSprite
        {
            return this._Str_23271(this._Str_1786.length);
        }

        public function _Str_23271(k:int):IRoomObjectSprite
        {
            var _local_2:IRoomObjectSprite = new RoomObjectSprite();
            if (k >= this._Str_1786.length)
            {
                this._Str_1786.push(_local_2);
            }
            else
            {
                this._Str_1786.splice(k, 0, _local_2);
            }
            return _local_2;
        }

        public function _Str_26355(k:IRoomObjectSprite):void
        {
            var _local_2:int = this._Str_1786.indexOf(k);
            if (_local_2 == -1)
            {
                throw (new Error("Trying to remove non-existing sprite!"));
            }
            this._Str_1786.splice(_local_2, 1);
            RoomObjectSprite(k).dispose();
        }

        public function get _Str_3008():int
        {
            return this._Str_1786.length;
        }

        public function _Str_2505(k:int):IRoomObjectSprite
        {
            if (((k >= 0) && (k < this._Str_1786.length)))
            {
                return this._Str_1786[k];
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

        protected function _Str_6936():void
        {
            this._Str_2542++;
        }

        protected function reset():void
        {
            this._Str_7475 = 0xFFFFFFFF;
            this._Str_3603 = 0xFFFFFFFF;
            this._Str_3289 = -1;
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
            var count:int = this._Str_3008;
            var objectSprite:IRoomObjectSprite;
            var spriteList:Array = [];
            var index:int;
            var data:BitmapData;
            index = 0;
            while (index < count)
            {
                objectSprite = this._Str_2505(index);
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
            var k:int = this._Str_3008;
            var _local_2:IRoomObjectSprite;
            var _local_3:Rectangle = new Rectangle();
            var _local_4:int;
            var _local_5:BitmapData;
            _local_4 = 0;
            while (_local_4 < k)
            {
                _local_2 = this._Str_2505(_local_4);
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
