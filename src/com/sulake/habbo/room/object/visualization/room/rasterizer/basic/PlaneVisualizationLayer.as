package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public class PlaneVisualizationLayer implements IDisposable 
    {
        public static const DEFAULT_OFFSET:int = 0;
        public static const ALIGN_TOP:int = 1;
        public static const ALIGN_BOTTOM:int = 2;
        public static const ALIGN_DEFAULT:int = ALIGN_TOP;//1

        private var _material:PlaneMaterial = null;
        private var _color:uint = 0;
        private var _offset:int = 0;
        private var _align:int = 1;
        private var _bitmapData:BitmapData = null;
        private var _isDisposed:Boolean = false;

        public function PlaneVisualizationLayer(k:PlaneMaterial, _arg_2:uint, _arg_3:int, _arg_4:int=0)
        {
            this._material = k;
            this._offset = _arg_4;
            this._align = _arg_3;
            this._color = _arg_2;
        }

        public function get offset():int
        {
            return this._offset;
        }

        public function get align():int
        {
            return this._align;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._material = null;
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
                this._bitmapData = null;
            }
        }

        public function _Str_3355():void
        {
            if (this._bitmapData != null)
            {
                this._bitmapData.dispose();
                this._bitmapData = null;
            }
        }

        public function render(canvas:BitmapData, width:int, height:int, normal:IVector3d, useTexture:Boolean, offsetX:int, offsetY:int):BitmapData
        {
            var tR:Number;
            var tG:Number;
            var tB:Number;
            var ctf:ColorTransform;
            var r:uint = (this._color >> 16);
            var g:uint = ((this._color >> 8) & 0xFF);
            var b:uint = (this._color & 0xFF);
            var hasColor:Boolean;
            if ((((r < 0xFF) || (g < 0xFF)) || (b < 0xFF)))
            {
                hasColor = true;
            }
            if ((((canvas == null) || (!(canvas.width == width))) || (!(canvas.height == height))))
            {
                canvas = null;
            }
            var bitmapData:BitmapData;
            if (this._material != null)
            {
                if (hasColor)
                {
                    bitmapData = this._material.render(null, width, height, normal, useTexture, offsetX, (offsetY + this.offset), (this.align == ALIGN_TOP));
                }
                else
                {
                    bitmapData = this._material.render(canvas, width, height, normal, useTexture, offsetX, (offsetY + this.offset), (this.align == ALIGN_TOP));
                }
                if (((!(bitmapData == null)) && (!(bitmapData == canvas))))
                {
                    if (this._bitmapData != null)
                    {
                        this._bitmapData.dispose();
                    }
                    try
                    {
                        this._bitmapData = bitmapData.clone();
                    }
                    catch(e:Error)
                    {
                        if (_bitmapData)
                        {
                            _bitmapData.dispose();
                        }
                        _bitmapData = null;
                        return null;
                    }
                    bitmapData = this._bitmapData;
                }
            }
            else
            {
                if (canvas == null)
                {
                    if ((((!(this._bitmapData == null)) && (this._bitmapData.width == width)) && (this._bitmapData.height == height)))
                    {
                        return this._bitmapData;
                    }
                    if (this._bitmapData != null)
                    {
                        this._bitmapData.dispose();
                    }
                    this._bitmapData = new BitmapData(width, height, true, 0xFFFFFFFF);
                    bitmapData = this._bitmapData;
                }
                else
                {
                    canvas.fillRect(canvas.rect, 0xFFFFFFFF);
                    bitmapData = canvas;
                }
            }
            if (bitmapData != null)
            {
                if (hasColor)
                {
                    tR = (r / 0xFF);
                    tG = (g / 0xFF);
                    tB = (b / 0xFF);
                    ctf = new ColorTransform(tR, tG, tB);
                    bitmapData.colorTransform(bitmapData.rect, ctf);
                    if (((!(canvas == null)) && (!(bitmapData == canvas))))
                    {
                        canvas.copyPixels(bitmapData, bitmapData.rect, new Point(0, 0), null, null, true);
                        bitmapData = canvas;
                    }
                }
            }
            return bitmapData;
        }

        public function material():PlaneMaterial
        {
            return this._material;
        }

        public function _Str_751():uint
        {
            return this._color;
        }
    }
}
