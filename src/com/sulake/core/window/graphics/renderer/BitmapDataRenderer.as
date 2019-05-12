package com.sulake.core.window.graphics.renderer
{
    import flash.geom.Matrix;
    import flash.geom.ColorTransform;
    import flash.filters.ColorMatrixFilter;
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import flash.display.BitmapData;
    import com.sulake.core.window.enum.PivotPoint;
    import flash.geom.Point;
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;

    public class BitmapDataRenderer extends SkinRenderer 
    {
        protected static const _MATRIX:Matrix = new Matrix();
        protected static const _COLOR_TRANSFORM:ColorTransform = new ColorTransform();
        protected static const _ETCHING_COLOR_TRANSFORM:ColorTransform = new ColorTransform(0, 0, 0, 1, 1, 1, 1, 0);
        protected static const _GREYSCALE_FILTER:ColorMatrixFilter = new ColorMatrixFilter();
        protected static const R:Number = 0.212671;
        protected static const G:Number = 0.71516;
        protected static const B:Number = 0.072169;

        public function BitmapDataRenderer(k:String)
        {
            super(k);
        }

        override public function draw(k:IWindow, _arg_2:BitmapData, _arg_3:Rectangle, _arg_4:uint, _arg_5:Boolean):void
        {
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:int;
            var _local_18:int;
            var _local_6:IBitmapDataContainer = (k as IBitmapDataContainer);
            var _local_7:BitmapData = _local_6.bitmapData;
            if (((!(_arg_2 == null)) && (!(_local_7 == null))))
            {
                _local_8 = (((_local_6.stretchedX) ? k.width : _local_7.width) * _local_6.zoomX);
                _local_9 = (((_local_6.stretchedY) ? k.height : _local_7.height) * _local_6.zoomY);
                _local_10 = ((_local_6.wrapX) ? ((k.width / _local_8) + 2) : 1);
                _local_11 = ((_local_6.wrapY) ? ((k.height / _local_9) + 2) : 1);
                _MATRIX.a = (_local_8 / _local_7.width);
                _MATRIX.d = (_local_9 / _local_7.height);
                switch (_local_6.pivotPoint)
                {
                    case PivotPoint.TOP_LEFT:
                    case PivotPoint.CENTER_LEFT:
                    case PivotPoint.BOTTOM_LEFT:
                        _MATRIX.tx = ((_local_6.zoomX < 0) ? -(_local_8) : 0);
                        break;
                    case PivotPoint.TOP_CENTER:
                    case PivotPoint.CENTER:
                    case PivotPoint.BOTTOM_CENTER:
                        _MATRIX.tx = int(((k.width - _local_8) / 2));
                        break;
                    case PivotPoint.TOP_RIGHT:
                    case PivotPoint.CENTER_RIGHT:
                    case PivotPoint.BOTTOM_RIGHT:
                        _MATRIX.tx = ((_local_6.zoomX < 0) ? k.width : (k.width - _local_8));
                        break;
                }
                _local_12 = _MATRIX.tx;
                while (((_local_6.wrapX) && (_local_12 > 0)))
                {
                    _local_12 = (_local_12 - _local_8);
                }
                switch (_local_6.pivotPoint)
                {
                    case PivotPoint.TOP_LEFT:
                    case PivotPoint.TOP_CENTER:
                    case PivotPoint.TOP_RIGHT:
                        _MATRIX.ty = ((_local_6.zoomY < 0) ? -(_local_9) : 0);
                        break;
                    case PivotPoint.CENTER_LEFT:
                    case PivotPoint.CENTER:
                    case PivotPoint.CENTER_RIGHT:
                        _MATRIX.ty = int(((k.height - _local_9) / 2));
                        break;
                    case PivotPoint.BOTTOM_LEFT:
                    case PivotPoint.BOTTOM_CENTER:
                    case PivotPoint.BOTTOM_RIGHT:
                        _MATRIX.ty = ((_local_6.zoomY < 0) ? k.height : (k.height - _local_9));
                        break;
                }
                _local_13 = _MATRIX.ty;
                while (((_local_6.wrapY) && (_local_13 > 0)))
                {
                    _local_13 = (_local_13 - _local_9);
                }
                _local_14 = (((k.color & 0xFF0000) >> 16) / 0xFF);
                _local_15 = (((k.color & 0xFF00) >> 8) / 0xFF);
                _local_16 = ((k.color & 0xFF) / 0xFF);
                _ETCHING_COLOR_TRANSFORM.alphaMultiplier = (((_local_6.etchingColor >> 24) & 0xFF) / 0xFF);
                _ETCHING_COLOR_TRANSFORM.redOffset = ((_local_6.etchingColor >> 16) & 0xFF);
                _ETCHING_COLOR_TRANSFORM.greenOffset = ((_local_6.etchingColor >> 8) & 0xFF);
                _ETCHING_COLOR_TRANSFORM.blueOffset = (_local_6.etchingColor & 0xFF);
                _arg_2.lock();
                _MATRIX.ty = _local_13;
                _local_17 = 0;
                while (_local_17 < _local_11)
                {
                    _MATRIX.tx = _local_12;
                    _local_18 = 0;
                    while (_local_18 < _local_10)
                    {
                        if (_local_6.greyscale)
                        {
                            _GREYSCALE_FILTER.matrix = [(_local_14 * R), (_local_14 * G), (_local_14 * B), 0, 0, (_local_15 * R), (_local_15 * G), (_local_15 * B), 0, 0, (_local_16 * R), (_local_16 * G), (_local_16 * B), 0, 0, 0, 0, 0, 1, 0];
                            if (_ETCHING_COLOR_TRANSFORM.alphaMultiplier >= 0.001)
                            {
                                _MATRIX.tx = (_MATRIX.tx + _local_6.etchingPoint.x);
                                _MATRIX.ty = (_MATRIX.ty + _local_6.etchingPoint.y);
                                _arg_2.draw(_local_7, _MATRIX, _ETCHING_COLOR_TRANSFORM, null, null, false);
                                _MATRIX.tx = (_MATRIX.tx - _local_6.etchingPoint.x);
                                _MATRIX.ty = (_MATRIX.ty - _local_6.etchingPoint.y);
                            }
                            _arg_2.draw(_local_7, _MATRIX, null, null, null, false);
                            _arg_2.applyFilter(_arg_2, _arg_2.rect, new Point(), _GREYSCALE_FILTER);
                        }
                        else
                        {
                            _COLOR_TRANSFORM.redMultiplier = _local_14;
                            _COLOR_TRANSFORM.greenMultiplier = _local_15;
                            _COLOR_TRANSFORM.blueMultiplier = _local_16;
                            _COLOR_TRANSFORM.alphaMultiplier = 1;
                            _COLOR_TRANSFORM.redOffset = 0;
                            _COLOR_TRANSFORM.greenOffset = 0;
                            _COLOR_TRANSFORM.blueOffset = 0;
                            _COLOR_TRANSFORM.alphaOffset = 0;
                            if (k._Str_6120)
                            {
                                _COLOR_TRANSFORM.concat(k._Str_6120);
                            }
                            if (_ETCHING_COLOR_TRANSFORM.alphaMultiplier >= 0.001)
                            {
                                _MATRIX.tx = (_MATRIX.tx + _local_6.etchingPoint.x);
                                _MATRIX.ty = (_MATRIX.ty + _local_6.etchingPoint.y);
                                _arg_2.draw(_local_7, _MATRIX, _ETCHING_COLOR_TRANSFORM, null, null, false);
                                _MATRIX.tx = (_MATRIX.tx - _local_6.etchingPoint.x);
                                _MATRIX.ty = (_MATRIX.ty - _local_6.etchingPoint.y);
                            }
                            _arg_2.draw(_local_7, _MATRIX, _COLOR_TRANSFORM, null, null, false);
                        }
                        _MATRIX.tx = (_MATRIX.tx + _local_8);
                        _local_18++;
                    }
                    _MATRIX.ty = (_MATRIX.ty + _local_9);
                    _local_17++;
                }
                _arg_2.unlock();
            }
        }

        override public function isStateDrawable(k:uint):Boolean
        {
            return k == 0;
        }
    }
}
