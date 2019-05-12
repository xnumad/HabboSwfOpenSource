package com.sulake.habbo.window.utils
{
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.IAssetLibrary;

    public class LimitedItemOverlayNumberBitmapGenerator 
    {
        private static const UNIQUE_ITEM_NUMBER_GLYPH_:String = "unique_item_number_glyph_";


        public static function _Str_14181(k:IAssetLibrary, _arg_2:int, _arg_3:int, _arg_4:int):BitmapData
        {
            var _local_12:BitmapDataAsset;
            var _local_14:int;
            var _local_5:BitmapData = new BitmapData(_arg_3, _arg_4, true, 0);
            var _local_6:int = (_arg_2 % 10);
            var _local_7:int = ((_arg_2 / 10) % 10);
            var _local_8:int = ((_arg_2 / 100) % 10);
            var _local_9:int = ((_arg_2 / 1000) % 10);
            var _local_10:Array = new Array();
            var _local_11:int;
            if (_local_9 > 0)
            {
                _local_12 = BitmapDataAsset(k.getAssetByName((UNIQUE_ITEM_NUMBER_GLYPH_ + _local_9)));
                _local_10.push(_local_12);
                _local_11 = (_local_11 + _local_12.rectangle.width);
            }
            if (((_local_9 > 0) || (_local_8 > 0)))
            {
                _local_12 = BitmapDataAsset(k.getAssetByName((UNIQUE_ITEM_NUMBER_GLYPH_ + _local_8)));
                _local_10.push(_local_12);
                _local_11 = (_local_11 + _local_12.rectangle.width);
            }
            if ((((_local_9 > 0) || (_local_8 > 0)) || (_local_7 > 0)))
            {
                _local_12 = BitmapDataAsset(k.getAssetByName((UNIQUE_ITEM_NUMBER_GLYPH_ + _local_7)));
                _local_10.push(_local_12);
                _local_11 = (_local_11 + _local_12.rectangle.width);
            }
            _local_12 = BitmapDataAsset(k.getAssetByName((UNIQUE_ITEM_NUMBER_GLYPH_ + _local_6)));
            _local_10.push(_local_12);
            _local_11 = (_local_11 + _local_12.rectangle.width);
            _local_11--;
            var _local_13:Point = new Point(((_arg_3 - _local_11) / 2), 0);
            while (_local_14 < _local_10.length)
            {
                _local_12 = _local_10[_local_14];
                _local_5.copyPixels(BitmapData(_local_12.content), _local_12.rectangle, _local_13);
                _local_13.x = (_local_13.x + _local_12.rectangle.width);
                _local_14++;
            }
            return _local_5;
        }
    }
}
