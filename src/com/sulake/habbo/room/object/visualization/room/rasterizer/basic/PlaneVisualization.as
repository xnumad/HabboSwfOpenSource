package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.PlaneVisualizationAnimationLayer;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import flash.geom.Point;
    import com.sulake.room.utils.IVector3d;

    public class PlaneVisualization 
    {
        private var _layers:Array;
        private var _geometry:IRoomGeometry = null;
        private var _cachedBitmapData:BitmapData;
        private var _cachedBitmapNormal:Vector3d = null;
        private var _isCached:Boolean = false;
        private var _hasAnimationLayers:Boolean = false;

        public function PlaneVisualization(k:Number, _arg_2:int, _arg_3:IRoomGeometry)
        {
            this._layers = [];
            super();
            if (_arg_2 < 0)
            {
                _arg_2 = 0;
            }
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                this._layers.push(null);
                _local_4++;
            }
            this._geometry = _arg_3;
            this._cachedBitmapNormal = new Vector3d();
        }

        public function get geometry():IRoomGeometry
        {
            return this._geometry;
        }

        public function get hasAnimationLayers():Boolean
        {
            return this._hasAnimationLayers;
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:IDisposable;
            if (this._layers != null)
            {
                k = 0;
                while (k < this._layers.length)
                {
                    _local_2 = (this._layers[k] as IDisposable);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._layers = null;
            }
            this._geometry = null;
            if (this._cachedBitmapData != null)
            {
                this._cachedBitmapData.dispose();
            }
            if (this._cachedBitmapNormal != null)
            {
                this._cachedBitmapNormal = null;
            }
        }

        public function _Str_3355():void
        {
            var k:int;
            var _local_2:PlaneVisualizationLayer;
            var _local_3:PlaneVisualizationAnimationLayer;
            if (!this._isCached)
            {
                return;
            }
            if (this._cachedBitmapData != null)
            {
                this._cachedBitmapData.dispose();
                this._cachedBitmapData = null;
            }
            if (this._cachedBitmapNormal != null)
            {
                this._cachedBitmapNormal.assign(new Vector3d());
            }
            if (this._layers != null)
            {
                k = 0;
                while (k < this._layers.length)
                {
                    _local_2 = (this._layers[k] as PlaneVisualizationLayer);
                    _local_3 = (this._layers[k] as PlaneVisualizationAnimationLayer);
                    if (_local_2 != null)
                    {
                        _local_2._Str_3355();
                    }
                    else
                    {
                        if (_local_3 != null)
                        {
                            _local_3._Str_3355();
                        }
                    }
                    k++;
                }
            }
            this._isCached = false;
        }

        public function setLayer(k:int, _arg_2:PlaneMaterial, _arg_3:uint, _arg_4:int, _arg_5:int=0):Boolean
        {
            if (((k < 0) || (k > this._layers.length)))
            {
                return false;
            }
            var _local_6:IDisposable = (this._layers[k] as IDisposable);
            if (_local_6 != null)
            {
                _local_6.dispose();
                _local_6 = null;
            }
            _local_6 = new PlaneVisualizationLayer(_arg_2, _arg_3, _arg_4, _arg_5);
            this._layers[k] = _local_6;
            return true;
        }

        public function setAnimationLayer(k:int, _arg_2:XML, _arg_3:IGraphicAssetCollection):Boolean
        {
            if (((k < 0) || (k > this._layers.length)))
            {
                return false;
            }
            var _local_4:IDisposable = (this._layers[k] as IDisposable);
            if (_local_4 != null)
            {
                _local_4.dispose();
                _local_4 = null;
            }
            _local_4 = new PlaneVisualizationAnimationLayer(_arg_2, _arg_3);
            this._layers[k] = _local_4;
            this._hasAnimationLayers = true;
            return true;
        }

        public function _Str_8988():Array
        {
            return this._layers;
        }

        public function render(canvas:BitmapData, width:int, height:int, normal:IVector3d, useTexture:Boolean, offsetX:int=0, offsetY:int=0, maxX:int=0, maxY:int=0, dimensionX:Number=0, dimensionY:Number=0, timeSinceStartMs:int=0):BitmapData
        {
            var layer:PlaneVisualizationLayer;
            var animationLayer:PlaneVisualizationAnimationLayer;
            if (width < 1)
            {
                width = 1;
            }
            if (height < 1)
            {
                height = 1;
            }
            if ((((canvas == null) || (!(canvas.width == width))) || (!(canvas.height == height))))
            {
                canvas = null;
            }
            if (this._cachedBitmapData != null)
            {
                try
                {
                    if ((((this._cachedBitmapData.width == width) && (this._cachedBitmapData.height == height)) && (Vector3d.isEqual(this._cachedBitmapNormal, normal))))
                    {
                        if (!this.hasAnimationLayers)
                        {
                            if (canvas != null)
                            {
                                canvas.copyPixels(this._cachedBitmapData, this._cachedBitmapData.rect, new Point(0, 0), null, null, false);
                                return canvas;
                            }
                            return this._cachedBitmapData;
                        }
                    }
                    else
                    {
                        this._cachedBitmapData.dispose();
                        this._cachedBitmapData = null;
                    }
                }
                catch(e:Error)
                {
                    _cachedBitmapData.dispose();
                    _cachedBitmapData = null;
                    return null;
                }
            }
            this._isCached = true;
            if (this._cachedBitmapData == null)
            {
                try
                {
                    this._cachedBitmapData = new BitmapData(width, height, true, 0xFFFFFF);
                }
                catch(e:Error)
                {
                    if (_cachedBitmapData)
                    {
                        _cachedBitmapData.dispose();
                    }
                    _cachedBitmapData = null;
                    return null;
                }
            }
            else
            {
                this._cachedBitmapData.fillRect(this._cachedBitmapData.rect, 0xFFFFFF);
            }
            if (canvas == null)
            {
                canvas = this._cachedBitmapData;
            }
            this._cachedBitmapNormal.assign(normal);
            var i:int;
            while (i < this._layers.length)
            {
                layer = (this._layers[i] as PlaneVisualizationLayer);
                animationLayer = (this._layers[i] as PlaneVisualizationAnimationLayer);
                if (layer != null)
                {
                    layer.render(canvas, width, height, normal, useTexture, offsetX, offsetY);
                }
                else
                {
                    if (animationLayer != null)
                    {
                        animationLayer.render(canvas, width, height, normal, offsetX, offsetY, maxX, maxY, dimensionX, dimensionY, timeSinceStartMs);
                    }
                }
                i = (i + 1);
            }
            if (((!(canvas == null)) && (!(canvas == this._cachedBitmapData))))
            {
                this._cachedBitmapData.copyPixels(canvas, canvas.rect, new Point(0, 0), null, null, false);
                return canvas;
            }
            return this._cachedBitmapData;
        }
    }
}
