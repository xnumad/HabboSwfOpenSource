package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;

    public class PlaneMaterialCell 
    {
        private var _cachedBitmapData:BitmapData = null;
        private var _texture:PlaneTexture;
        private var _extraItemOffsets:Array;
        private var _extraItemAssets:Array;
        private var _extraItemCount:int = 0;

        public function PlaneMaterialCell(k:PlaneTexture, _arg_2:Array=null, _arg_3:Array=null, _arg_4:int=0)
        {
            var _local_5:int;
            var _local_6:IGraphicAsset;
            var _local_7:Point;
            this._extraItemOffsets = [];
            this._extraItemAssets = [];
            super();
            this._texture = k;
            if ((((!(_arg_2 == null)) && (_arg_2.length > 0)) && (_arg_4 > 0)))
            {
                _local_5 = 0;
                _local_5 = 0;
                while (_local_5 < _arg_2.length)
                {
                    _local_6 = (_arg_2[_local_5] as IGraphicAsset);
                    if (_local_6 != null)
                    {
                        this._extraItemAssets.push(_local_6);
                    }
                    _local_5++;
                }
                if (this._extraItemAssets.length > 0)
                {
                    if (_arg_3 != null)
                    {
                        _local_5 = 0;
                        while (_local_5 < _arg_3.length)
                        {
                            _local_7 = (_arg_3[_local_5] as Point);
                            if (_local_7 != null)
                            {
                                this._extraItemOffsets.push(new Point(_local_7.x, _local_7.y));
                            }
                            _local_5++;
                        }
                    }
                    this._extraItemCount = _arg_4;
                }
            }
        }

        public function get isStatic():Boolean
        {
            return this._extraItemCount == 0;
        }

        public function dispose():void
        {
            if (this._texture != null)
            {
                this._texture.dispose();
                this._texture = null;
            }
            if (this._cachedBitmapData != null)
            {
                this._cachedBitmapData.dispose();
                this._cachedBitmapData = null;
            }
            this._extraItemAssets = null;
            this._extraItemOffsets = null;
        }

        public function _Str_3355():void
        {
            if (this._cachedBitmapData != null)
            {
                this._cachedBitmapData.dispose();
                this._cachedBitmapData = null;
            }
        }

        public function getHeight(k:IVector3d):int
        {
            var _local_2:BitmapData;
            if (this._texture != null)
            {
                _local_2 = this._texture.getBitmap(k);
                if (_local_2 != null)
                {
                    return _local_2.height;
                }
            }
            return 0;
        }

        public function render(normal:IVector3d, textureOffsetX:int, textureOffsetY:int):BitmapData
        {
            var bitmap:BitmapData;
            var sourceBitmap:BitmapData;
            var limitMin:int;
            var limitMax:int;
            var offsetIndexes:Array;
            var i:int;
            var offset:Point;
            var item:IGraphicAsset;
            var bitmapAsset:BitmapDataAsset;
            var bitmapData:BitmapData;
            var offsetFinal:Point;
            var flipMatrix:Matrix;
            var x:Number;
            var y:Number;
            var translateX:Number;
            var translateY:Number;
            var offsetX:int;
            if (this._texture != null)
            {
                bitmap = this._texture.getBitmap(normal);
                try
                {
                    if (((!(bitmap == null)) && ((!(textureOffsetX == 0)) || (!(textureOffsetY == 0)))))
                    {
                        sourceBitmap = new BitmapData((bitmap.width * 2), (bitmap.height * 2), bitmap.transparent);
                        sourceBitmap.copyPixels(bitmap, bitmap.rect, new Point());
                        sourceBitmap.copyPixels(bitmap, bitmap.rect, new Point(bitmap.width, 0));
                        sourceBitmap.copyPixels(bitmap, bitmap.rect, new Point(0, bitmap.height));
                        sourceBitmap.copyPixels(bitmap, bitmap.rect, new Point(bitmap.width, bitmap.height));
                        bitmap = new BitmapData(bitmap.width, bitmap.height, bitmap.transparent);
                        while (textureOffsetX < 0)
                        {
                            textureOffsetX = (textureOffsetX + bitmap.width);
                        }
                        while (textureOffsetY < 0)
                        {
                            textureOffsetY = (textureOffsetY + bitmap.height);
                        }
                        bitmap.copyPixels(sourceBitmap, new Rectangle((textureOffsetX % bitmap.width), (textureOffsetY % bitmap.height), bitmap.width, bitmap.height), new Point());
                    }
                }
                catch(e:Error)
                {
                    return null;
                }
                if (bitmap != null)
                {
                    if (!this.isStatic)
                    {
                        if (this._cachedBitmapData != null)
                        {
                            if (((!(this._cachedBitmapData.width == bitmap.width)) || (!(this._cachedBitmapData.height == bitmap.height))))
                            {
                                this._cachedBitmapData.dispose();
                                this._cachedBitmapData = null;
                            }
                            else
                            {
                                this._cachedBitmapData.copyPixels(bitmap, bitmap.rect, new Point(0, 0));
                            }
                        }
                        if (this._cachedBitmapData == null)
                        {
                            this._cachedBitmapData = bitmap.clone();
                        }
                        limitMin = Math.min(this._extraItemCount, this._extraItemOffsets.length);
                        limitMax = Math.max(this._extraItemCount, this._extraItemOffsets.length);
                        offsetIndexes = Randomizer.getArray(this._extraItemCount, limitMax);
                        i = 0;
                        while (i < limitMin)
                        {
                            offset = (this._extraItemOffsets[offsetIndexes[i]] as Point);
                            item = (this._extraItemAssets[(i % this._extraItemAssets.length)] as IGraphicAsset);
                            if (((!(offset == null)) && (!(item == null))))
                            {
                                bitmapAsset = (item.asset as BitmapDataAsset);
                                if (bitmapAsset != null)
                                {
                                    bitmapData = (bitmapAsset.content as BitmapData);
                                    if (bitmapData != null)
                                    {
                                        offsetFinal = new Point((offset.x + item.offsetX), (offset.y + item.offsetY));
                                        flipMatrix = new Matrix();
                                        x = 1;
                                        y = 1;
                                        translateX = 0;
                                        translateY = 0;
                                        if (item.flipH)
                                        {
                                            x = -1;
                                            translateX = bitmapData.width;
                                        }
                                        if (item.flipV)
                                        {
                                            y = -1;
                                            translateY = bitmapData.height;
                                        }
                                        offsetX = (offsetFinal.x + translateX);
                                        offsetX = ((offsetX >> 1) << 1);
                                        flipMatrix.scale(x, y);
                                        flipMatrix.translate(offsetX, (offsetFinal.y + translateY));
                                        this._cachedBitmapData.draw(bitmapData, flipMatrix);
                                    }
                                }
                            }
                            i = (i + 1);
                        }
                        return this._cachedBitmapData;
                    }
                    return bitmap;
                }
            }
            return null;
        }

        public function getAliasByName(k:IVector3d):String
        {
            return (this._texture == null) ? null : this._texture.getAliasByName(k);
        }
    }
}
