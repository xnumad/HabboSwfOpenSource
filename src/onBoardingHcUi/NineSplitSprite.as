package onBoardingHcUi
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.habbo.utils._Str_988;
    import onBoardingHcUi.images.*;

    public class NineSplitSprite 
    {
        private static const _Str_2137:Class = NineSplitSprite__Str_2137;
        private static const _Str_1905:Class = NineSplitSprite__Str_1905;
        private static const _Str_1879:Class = NineSplitSprite__Str_1879;
        private static const _Str_1290:Class = NineSplitSprite__Str_1290;
        private static const _Str_1071:Class = NineSplitSprite__Str_1071;
        private static const _Str_1597:Class = NineSplitSprite__Str_1597;
        private static const _Str_1844:Class = NineSplitSprite__Str_1844;
        private static const _Str_1026:Class = NineSplitSprite__Str_1026;
        private static const _Str_2007:Class = NineSplitSprite__Str_2007;
        private static const _Str_1839:Class = NineSplitSprite__Str_1839;
        private static const _Str_1716:Class = NineSplitSprite__Str_1716;
        private static const _Str_1051:Class = NineSplitSprite__Str_1051;
        private static const _Str_1346:Bitmap = new _Str_2137();
        public static const _Str_2262:Bitmap = new _Str_1905();
        private static const _Str_1706:Bitmap = new _Str_1879();
        private static const _Str_1251:Bitmap = new _Str_1290();
        private static const _Str_1341:Bitmap = new _Str_1071();
        private static const _Str_1555:Bitmap = new _Str_1597();
        private static const _Str_1243:Bitmap = new _Str_1844();
        private static const _Str_1223:Bitmap = new _Str_1026();
        private static const _Str_1180:Bitmap = new _Str_2007();
        private static const _Str_1172:Bitmap = new _Str_1839();
        private static const _Str_1948:Bitmap = new _Str_1716();
        private static const _Str_1642:Bitmap = new _Str_1051();
        public static var _Str_1827:NineSplitSprite = new NineSplitSprite(_Str_1948.bitmapData, new <int>[5, 4, 5], new <int>[11, 1, 5]);
        public static var _Str_1836:NineSplitSprite = new NineSplitSprite(_Str_1948.bitmapData, new <int>[5, 4, 5], new <int>[5, 1, 11]);
        public static var _Str_1605:NineSplitSprite = new NineSplitSprite(_Str_1346.bitmapData, new <int>[12, 2, 6], new <int>[14, 2, 4]);
        public static var _Str_1358:NineSplitSprite = new NineSplitSprite(_Str_2262.bitmapData, new <int>[5, 5, 5], new <int>[5, 12, 5]);
        public static var _Str_2208:NineSplitSprite = new NineSplitSprite(_Str_1706.bitmapData, new <int>[2, 2, 2], new <int>[8, 0, 0]);
        public static var _Str_2163:NineSplitSprite = new NineSplitSprite(_Str_1251.bitmapData, new <int>[4, 3, 4], new <int>[5, 1, 7]);
        public static var _Str_1594:NineSplitSprite = new NineSplitSprite(_Str_1341.bitmapData, new <int>[5, 2, 5], new <int>[5, 2, 6]);
        public static var _Str_1995:NineSplitSprite = new NineSplitSprite(_Str_1555.bitmapData, new <int>[5, 2, 5], new <int>[5, 2, 6]);
        public static var _Str_1852:NineSplitSprite = new NineSplitSprite(_Str_1243.bitmapData, new <int>[5, 4, 5], new <int>[7, 2, 5]);
        public static var _Str_1531:NineSplitSprite = new NineSplitSprite(_Str_1172.bitmapData, new <int>[330, 0, 0], new <int>[31, 0, 0]);
        public static var _Str_2104:NineSplitSprite = new NineSplitSprite(_Str_1180.bitmapData, new <int>[330, 0, 0], new <int>[31, 0, 0]);
        public static var _Str_2099:NineSplitSprite = new NineSplitSprite(_Str_1172.bitmapData, new <int>[330, 0, 0], new <int>[31, 0, 0]);
        public static var _Str_2249:NineSplitSprite = new NineSplitSprite(_Str_1642.bitmapData, new <int>[5, 4, 5], new <int>[11, 1, 5]);

        private var _bitmapData:BitmapData;
        private var _widths:Vector.<int>;
        private var _heights:Vector.<int>;

        public function NineSplitSprite(k:BitmapData, _arg_2:Vector.<int>, _arg_3:Vector.<int>)
        {
            this._bitmapData = k;
            this._widths = _arg_2;
            this._heights = _arg_3;
        }

        public function render(k:int, _arg_2:int):Bitmap
        {
            var _local_3:Bitmap = new Bitmap(new BitmapData(k, _arg_2, true, 0xFFFFFF));
            this._Str_2086(_local_3, new Rectangle(0, 0, k, _arg_2));
            return _local_3;
        }

        public function _Str_2086(k:Bitmap, _arg_2:Rectangle):void
        {
            var _local_16:int;
            var _local_17:Rectangle;
            var _local_18:Rectangle;
            var _local_3:int = _arg_2.x;
            var _local_4:int = _arg_2.y;
            var _local_5:int = _arg_2.width;
            var _local_6:int = _arg_2.height;
            var _local_7:Vector.<int> = new <int>[0, this._widths[0], (this._widths[0] + this._widths[1])];
            var _local_8:Vector.<int> = new <int>[0, this._heights[0], (this._heights[0] + this._heights[1])];
            var _local_9:Vector.<int> = this._widths;
            var _local_10:Vector.<int> = this._heights;
            var _local_11:Vector.<int> = new <int>[_local_3, (_local_3 + this._widths[0]), ((_local_3 + _local_5) - this._widths[2])];
            var _local_12:Vector.<int> = new <int>[_local_4, (_local_4 + this._heights[0]), ((_local_4 + _local_6) - this._heights[2])];
            var _local_13:Vector.<int> = new <int>[this._widths[0], ((_local_5 - this._widths[0]) - this._widths[2]), this._widths[2]];
            var _local_14:Vector.<int> = new <int>[this._heights[0], ((_local_6 - this._heights[0]) - this._heights[2]), this._heights[2]];
            var _local_15:int;
            while (_local_15 < 3)
            {
                _local_16 = 0;
                while (_local_16 < 3)
                {
                    if (((((_local_13[_local_15] < 1) || (_local_14[_local_16] < 1)) || (_local_9[_local_15] < 1)) || (_local_10[_local_16] < 1)))
                    {
                    }
                    else
                    {
                        _local_17 = new Rectangle(_local_7[_local_15], _local_8[_local_16], _local_9[_local_15], _local_10[_local_16]);
                        if (((!(_local_15 == 1)) && (!(_local_16 == 1))))
                        {
                            k.bitmapData.copyPixels(this._bitmapData, _local_17, new Point(_local_11[_local_15], _local_12[_local_16]));
                        }
                        else
                        {
                            _local_18 = new Rectangle(_local_11[_local_15], _local_12[_local_16], _local_13[_local_15], _local_14[_local_16]);
                            k.bitmapData.draw(this._bitmapData, _Str_988._Str_2065(_local_17, _local_18), null, null, _local_18, false);
                        }
                    }
                    _local_16++;
                }
                _local_15++;
            }
        }

        public function get bitmapData():BitmapData
        {
            return this._bitmapData;
        }
    }
}
