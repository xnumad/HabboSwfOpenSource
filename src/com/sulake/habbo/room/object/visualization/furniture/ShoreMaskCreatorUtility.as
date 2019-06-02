package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.room.utils.Rasterizer;

    public class ShoreMaskCreatorUtility 
    {
        public static const OUTER_CUT:int = 0;
        public static const STRAIGHT_CUT:int = 1;
        public static const INNER_CUT:int = 2;
        private static const CUT_TYPE_COUNT:int = 3;
        private static const MASK_COLOR_TRANSPARENT:uint = 0;
        private static const MASK_COLOR_SOLID:uint = 0xFFFFFFFF;


        public static function createEmptyMask(k:int, _arg_2:int):BitmapData
        {
            var _local_3:BitmapData = new BitmapData(k, _arg_2, true, MASK_COLOR_TRANSPARENT);
            return _local_3;
        }

        public static function getInstanceMaskName(k:int, _arg_2:int):String
        {
            var _local_3:String = ((("instance_mask_" + k) + "_") + _arg_2);
            return _local_3;
        }

        public static function getBorderType(k:int, _arg_2:int):int
        {
            return k + (_arg_2 * CUT_TYPE_COUNT);
        }

        public static function _Str_18302(k:int, _arg_2:int, _arg_3:IGraphicAssetCollection, _arg_4:IGraphicAsset):IGraphicAsset
        {
            var _local_7:BitmapDataAsset;
            var _local_8:BitmapData;
            var _local_5:String = getInstanceMaskName(k, _arg_2);
            var _local_6:IGraphicAsset = _arg_3.getAsset(_local_5);
            if (_local_6 == null)
            {
                if (_arg_4 != null)
                {
                    _local_7 = (_arg_4.asset as BitmapDataAsset);
                    if (_local_7 != null)
                    {
                        _local_8 = (_local_7.content as BitmapData);
                        if (_local_8 != null)
                        {
                            _arg_3.addAsset(_local_5, new BitmapData(_local_8.width, _local_8.height, true, MASK_COLOR_TRANSPARENT), false, _arg_4.offsetX, _arg_4.offsetY);
                            _local_6 = _arg_3.getAsset(_local_5);
                        }
                    }
                }
            }
            return _local_6;
        }

        public static function disposeInstanceMask(k:int, _arg_2:int, _arg_3:IGraphicAssetCollection):void
        {
            var _local_4:String = getInstanceMaskName(k, _arg_2);
            _arg_3.disposeAsset(_local_4);
        }

        public static function createShoreMask2x2(k:BitmapData, _arg_2:int, _arg_3:Array, _arg_4:Array, _arg_5:IGraphicAssetCollection):BitmapData
        {
            var _local_7:String;
            var _local_8:IGraphicAsset;
            var _local_9:BitmapData;
            k.fillRect(k.rect, MASK_COLOR_TRANSPARENT);
            var _local_6:int;
            while (_local_6 < _arg_3.length)
            {
                if (_arg_3[_local_6] == true)
                {
                    _local_7 = ((((("mask_" + _arg_2) + "_") + _local_6) + "_") + _arg_4[_local_6]);
                    _local_8 = _arg_5.getAsset(_local_7);
                    if (((!(_local_8 == null)) && (!(_local_8.asset == null))))
                    {
                        _local_9 = (_local_8.asset.content as BitmapData);
                        if (_local_9 != null)
                        {
                            k.copyPixels(_local_9, _local_9.rect, new Point(0, 0), _local_9, new Point(0, 0), true);
                        }
                    }
                }
                _local_6++;
            }
            return k;
        }

        public static function _Str_18695(k:int, _arg_2:IGraphicAssetCollection, _arg_3:IGraphicAsset):Boolean
        {
            var _local_4:String;
            var _local_5:BitmapDataAsset;
            var _local_6:BitmapData;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:BitmapData;
            var _local_10:int;
            if (_arg_2 != null)
            {
                _local_4 = ("masks_done_" + k);
                if (_arg_2.getAsset(_local_4) == null)
                {
                    if (_arg_3 != null)
                    {
                        _local_5 = (_arg_3.asset as BitmapDataAsset);
                        if (_local_5 != null)
                        {
                            _local_6 = (_local_5.content as BitmapData);
                            _local_7 = [OUTER_CUT, STRAIGHT_CUT, INNER_CUT, OUTER_CUT, STRAIGHT_CUT, INNER_CUT];
                            _local_8 = [STRAIGHT_CUT, STRAIGHT_CUT, STRAIGHT_CUT, INNER_CUT, INNER_CUT, INNER_CUT];
                            _local_9 = null;
                            _local_10 = 0;
                            if (_local_6 != null)
                            {
                                _local_10 = 0;
                                while (((_local_10 < _local_7.length) && (_local_10 < _local_8.length)))
                                {
                                    _local_9 = createMaskLeft(_local_6.width, _local_6.height);
                                    cutLeftMask(_local_9, k, _local_7[_local_10], _local_8[_local_10]);
                                    storeLeftMask(_arg_2, _local_9, k, _local_7[_local_10], _local_8[_local_10]);
                                    _local_9 = createMaskRight(_local_6.width, _local_6.height);
                                    cutRightMask(_local_9, k, _local_8[_local_10], _local_7[_local_10]);
                                    storeRightMask(_arg_2, _local_9, k, _local_8[_local_10], _local_7[_local_10]);
                                    _local_10++;
                                }
                            }
                        }
                        _arg_2.addAsset(_local_4, new BitmapData(1, 1), false);
                        return true;
                    }
                    return false;
                }
                return true;
            }
            return false;
        }

        private static function createMaskLeft(k:int, _arg_2:int):BitmapData
        {
            var _local_3:BitmapData = new BitmapData(k, _arg_2, true, MASK_COLOR_TRANSPARENT);
            fillTopLeftCorner(_local_3, (_local_3.width / 2), ((_local_3.height / 2) - 1), 1, MASK_COLOR_SOLID);
            return _local_3;
        }

        private static function cutLeftMask(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            if (_arg_3 == STRAIGHT_CUT)
            {
                cutLeftMaskOuterCorner(k, _arg_2, false);
            }
            else
            {
                if (_arg_3 == INNER_CUT)
                {
                    cutLeftMaskOuterCorner(k, _arg_2, true);
                }
            }
            if (_arg_4 == INNER_CUT)
            {
                cutLeftMaskInnerCorner(k, _arg_2);
            }
        }

        private static function cutLeftMaskOuterCorner(k:BitmapData, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_4:int = ((k.height / 2) - (_arg_2 / 2));
            var _local_5:int = (k.width / 2);
            if (_arg_3)
            {
                k.fillRect(new Rectangle(_local_5, 0, k.width, _local_4), MASK_COLOR_TRANSPARENT);
            }
            else
            {
                fillTopLeftCorner(k, _local_5, (_local_4 - 1), 1, MASK_COLOR_TRANSPARENT);
            }
        }

        private static function cutLeftMaskInnerCorner(k:BitmapData, _arg_2:int):void
        {
            var _local_3:int = ((k.width / 2) + (_arg_2 / 2));
            k.fillRect(new Rectangle(_local_3, 0, k.width, (k.height / 2)), MASK_COLOR_TRANSPARENT);
        }

        private static function createMaskRight(k:int, _arg_2:int):BitmapData
        {
            var _local_3:BitmapData = new BitmapData(k, _arg_2, true, MASK_COLOR_TRANSPARENT);
            fillBottomRightCorner(_local_3, ((_local_3.width / 2) + 1), ((_local_3.height / 2) - 1), MASK_COLOR_SOLID);
            return _local_3;
        }

        private static function cutRightMask(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            if (_arg_4 == STRAIGHT_CUT)
            {
                cutRightMaskOuterCorner(k, _arg_2, false);
            }
            else
            {
                if (_arg_4 == INNER_CUT)
                {
                    cutRightMaskOuterCorner(k, _arg_2, true);
                }
            }
            if (_arg_3 == INNER_CUT)
            {
                cutRightMaskInnerCorner(k, _arg_2);
            }
        }

        private static function cutRightMaskInnerCorner(k:BitmapData, _arg_2:int):void
        {
            var _local_3:int = ((k.width / 2) + (_arg_2 / 2));
            k.fillRect(new Rectangle(_local_3, 0, k.width, ((k.height / 2) - (_arg_2 / 4))), MASK_COLOR_TRANSPARENT);
        }

        private static function cutRightMaskOuterCorner(k:BitmapData, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_4:int = (k.height / 2);
            var _local_5:int = ((k.width / 2) + _arg_2);
            if (_arg_3)
            {
                k.fillRect(new Rectangle(_local_5, 0, k.width, _local_4), MASK_COLOR_TRANSPARENT);
            }
            else
            {
                fillBottomRightCorner(k, (_local_5 + 1), (_local_4 - 1), MASK_COLOR_TRANSPARENT);
            }
        }

        private static function storeLeftMask(k:IGraphicAssetCollection, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            var _local_6:String;
            if (k != null)
            {
                _local_6 = "";
                _local_6 = ((("mask_" + _arg_3) + "_0_") + getBorderType(_arg_4, _arg_5));
                k.addAsset(_local_6, _arg_2, false);
                _local_6 = ((("mask_" + _arg_3) + "_3_") + getBorderType(_arg_5, _arg_4));
                k.addAsset(_local_6, Rasterizer.getFlipVBitmapData(_arg_2), false);
                _local_6 = ((("mask_" + _arg_3) + "_4_") + getBorderType(_arg_4, _arg_5));
                k.addAsset(_local_6, Rasterizer.getFlipHVBitmapData(_arg_2), false);
                _local_6 = ((("mask_" + _arg_3) + "_7_") + getBorderType(_arg_5, _arg_4));
                k.addAsset(_local_6, Rasterizer.getFlipHBitmapData(_arg_2), false);
            }
        }

        private static function storeRightMask(k:IGraphicAssetCollection, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            var _local_6:String;
            if (k != null)
            {
                _local_6 = "";
                _local_6 = ((("mask_" + _arg_3) + "_1_") + getBorderType(_arg_4, _arg_5));
                k.addAsset(_local_6, _arg_2, false);
                _local_6 = ((("mask_" + _arg_3) + "_2_") + getBorderType(_arg_5, _arg_4));
                k.addAsset(_local_6, Rasterizer.getFlipVBitmapData(_arg_2), false);
                _local_6 = ((("mask_" + _arg_3) + "_5_") + getBorderType(_arg_4, _arg_5));
                k.addAsset(_local_6, Rasterizer.getFlipHVBitmapData(_arg_2), false);
                _local_6 = ((("mask_" + _arg_3) + "_6_") + getBorderType(_arg_5, _arg_4));
                k.addAsset(_local_6, Rasterizer.getFlipHBitmapData(_arg_2), false);
            }
        }

        private static function fillTopLeftCorner(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint):void
        {
            var _local_9:int;
            var _local_6:int = _arg_2;
            var _local_7:int = _arg_3;
            var _local_8:int = _arg_4;
            while (_local_7 >= 0)
            {
                _local_9 = _local_7;
                while (_local_9 >= 0)
                {
                    k.setPixel32(_local_6, _local_9, _arg_5);
                    _local_9--;
                }
                _local_8++;
                if (_local_8 >= 2)
                {
                    _local_7--;
                    _local_8 = 0;
                }
                _local_6++;
            }
        }

        private static function fillBottomRightCorner(k:BitmapData, _arg_2:int, _arg_3:int, _arg_4:uint):void
        {
            var _local_7:int;
            var _local_5:int = _arg_2;
            var _local_6:int = _arg_3;
            while (_local_5 < k.width)
            {
                _local_7 = _local_5;
                while (_local_7 < k.width)
                {
                    k.setPixel32(_local_7, _local_6, _arg_4);
                    _local_7++;
                }
                _local_6--;
                _local_5 = (_local_5 + 2);
            }
        }
    }
}
