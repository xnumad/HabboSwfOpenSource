package onBoardingHcUi
{
    import flash.filters.DropShadowFilter;
    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.text.AntiAliasType;
    import flash.text.TextFieldType;
    import flash.text.TextFieldAutoSize;
    import flash.display.DisplayObject;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.display.Sprite;
    import flash.display.Shape;
    import onBoardingHcUi.images.*;
    import fonts.*;

    public class LoaderUI 
    {
        private static const _Str_1249:Class = LoaderUI__Str_1249;
        public static var ubuntu_regular:Class = _Str_771;
        public static var ubuntu_bold:Class = _Str_955;
        public static var ubuntu_italic:Class = _Str_1000;
        public static var ubuntu_bold_italic:Class = _Str_666;
        private static const _Str_1115:Class = LoaderUI__Str_1115;
        private static const _Str_1325:Class = LoaderUI__Str_1325;
        private static const _Str_2054:Class = LoaderUI__Str_2054;
        private static const _Str_1832:Class = LoaderUI__Str_1832;
        public static const _Str_2056:int = 1;
        public static const _Str_1585:int = 2;
        public static const L:String = "l";
        public static const C:String = "c";
        public static const R:String = "r";
        public static const T:String = "t";
        public static const M:String = "m";
        public static const B:String = "b";
        public static const _Str_1232:uint = 8309486;
        public static const _Str_1545:uint = 0xFFFFFF;
        private static const _Str_2023:DropShadowFilter = new DropShadowFilter(1, 90, 0xD1D400, 1, 1, 1);
        private static const _Str_2237:DropShadowFilter = new DropShadowFilter(1, 270, 0, 0.7, 1, 1);


        public static function _Str_1132(k:String, _arg_2:int, _arg_3:uint, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:String="left", _arg_9:Boolean=false, _arg_10:Boolean=false):TextField
        {
            var _local_11:TextFormat = new TextFormat("Ubuntu", _arg_2, _arg_3, _arg_4, _arg_7, _arg_10);
            _local_11.align = _arg_8;
            _local_11.kerning = _arg_9;
            var _local_12:TextField = new TextField();
            _local_12.embedFonts = true;
            _local_12.antiAliasType = AntiAliasType.ADVANCED;
            _local_12.defaultTextFormat = _local_11;
            _local_12.multiline = _arg_5;
            _local_12.wordWrap = _arg_5;
            _local_12.type = ((_arg_6) ? TextFieldType.INPUT : TextFieldType.DYNAMIC);
            _local_12.selectable = _arg_6;
            _local_12.htmlText = k;
            _local_12.autoSize = TextFieldAutoSize.LEFT;
            _local_12.width = _local_12.textWidth;
            _local_12.height = _local_12.textHeight;
            return _local_12;
        }

        public static function _Str_1516(k:DisplayObject, _arg_2:Boolean=false):void
        {
            k.filters = [((_arg_2) ? _Str_2237.clone() : _Str_2023.clone())];
        }

        public static function _Str_2098(k:DisplayObject, ... _args):void
        {
            var _local_5:int;
            var _local_6:DisplayObject;
            var _local_3:int = (_args.length / 2);
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = _args[(_local_4 * 2)];
                _local_6 = _args[((_local_4 * 2) + 1)];
                _local_6.x = ((k.x + k.width) + _local_5);
                k = _local_6;
                _local_4++;
            }
        }

        public static function _Str_2047(k:DisplayObject, ... _args):void
        {
            var _local_5:int;
            var _local_6:DisplayObject;
            var _local_3:int = (_args.length / 2);
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = _args[(_local_4 * 2)];
                _local_6 = _args[((_local_4 * 2) + 1)];
                _local_6.y = ((k.y + k.height) + _local_5);
                k = _local_6;
                _local_4++;
            }
        }

        public static function _Str_1818(k:DisplayObject, _arg_2:String, ... _args):void
        {
            var _local_4:DisplayObject;
            for each (_local_4 in _args)
            {
                if (_arg_2.indexOf(L) >= 0)
                {
                    _local_4.x = k.x;
                }
                if (_arg_2.indexOf(C) >= 0)
                {
                    _local_4.x = (k.x + int(((k.width - _local_4.width) / 2)));
                }
                if (_arg_2.indexOf(R) >= 0)
                {
                    _local_4.x = ((k.x + k.width) - _local_4.width);
                }
                if (_arg_2.indexOf(T) >= 0)
                {
                    _local_4.y = k.y;
                }
                if (_arg_2.indexOf(M) >= 0)
                {
                    _local_4.y = (k.y + int(((k.height - _local_4.height) / 2)));
                }
                if (_arg_2.indexOf(B) >= 0)
                {
                    _local_4.y = ((k.y + k.height) - _local_4.height);
                }
            }
        }

        public static function _Str_2206(k:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:uint=0xFFFFFF, _arg_6:String="up"):Bitmap
        {
            var _local_8:Bitmap;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Bitmap;
            if (_arg_3 < 0)
            {
                _arg_3 = int(((k - 9) / 2));
            }
            var _local_7:NineSplitSprite = NineSplitSprite._Str_2249;
            switch (_arg_6)
            {
                case "up":
                    _local_8 = new _Str_1325();
                    _local_9 = _local_8.height;
                    _local_11 = new Bitmap(new BitmapData(k, (_arg_2 + _local_8.height), true, 860986));
                    _local_7._Str_2086(_local_11, new Rectangle(0, _local_9, k, _arg_2));
                    _local_11.bitmapData.copyPixels(_local_8.bitmapData, _local_8.bitmapData.rect, new Point(_arg_3, 0));
                    break;
                case "down":
                    _local_8 = new _Str_1115();
                    _local_9 = _local_8.height;
                    _local_11 = new Bitmap(new BitmapData(k, (_arg_2 + _local_8.height), true, 860986));
                    _local_7._Str_2086(_local_11, new Rectangle(0, _local_9, k, _arg_2));
                    _local_11.bitmapData.copyPixels(_local_8.bitmapData, _local_8.bitmapData.rect, new Point(_arg_3, (_arg_2 + _local_9)));
                    break;
                case "left":
                    _local_8 = new _Str_2054();
                    _local_10 = _local_8.width;
                    _local_11 = new Bitmap(new BitmapData((k + _local_10), _arg_2, true, 0xFFFFFF));
                    _local_7._Str_2086(_local_11, new Rectangle(_local_10, 0, k, _arg_2));
                    _local_11.bitmapData.copyPixels(_local_8.bitmapData, _local_8.bitmapData.rect, new Point(0, (_arg_3 - _local_10)));
                    break;
                case "right":
                    _local_8 = new _Str_1832();
                    _local_10 = _local_8.width;
                    _local_11 = new Bitmap(new BitmapData((k + _local_10), _arg_2, true, 860986));
                    _local_7._Str_2086(_local_11, new Rectangle(0, 0, k, _arg_2));
                    _local_11.bitmapData.copyPixels(_local_8.bitmapData, _local_8.bitmapData.rect, new Point(k, (_arg_3 - _local_10)));
                    break;
                case "none":
                    _local_11 = new Bitmap(new BitmapData(k, _arg_2, true, 860986));
                    _local_7._Str_2086(_local_11, new Rectangle(0, 0, k, _arg_2));
                    break;
            }
            _local_11.bitmapData.colorTransform(_local_11.bitmapData.rect, new ColorTransform((((_arg_5 >> 16) & 0xFF) / 0xFF), (((_arg_5 >> 8) & 0xFF) / 0xFF), ((_arg_5 & 0xFF) / 0xFF)));
            return _local_11;
        }

        public static function _Str_1487(k:String, _arg_2:String, _arg_3:Rectangle, _arg_4:int=1):Sprite
        {
            var _local_7:TextField;
            var _local_5:Sprite = new Sprite();
            _local_5.x = _arg_3.x;
            _local_5.y = _arg_3.y;
            if (_arg_4 == LoaderUI._Str_2056)
            {
                _local_5.addChild(NineSplitSprite._Str_2163.render(_arg_3.width, _arg_3.height));
            }
            var _local_6:TextField = _Str_1132(k, 40, 0xFFFFFF, false, false, false, false);
            _local_6.y = -48;
            _local_6.autoSize = TextFieldAutoSize.LEFT;
            _local_5.addChild(_local_6);
            if (((!(_arg_2 == null)) && (!(_arg_2 == ""))))
            {
                _local_7 = _Str_1132(_arg_2, 10, 0xAAAAAA, true);
                _local_7.x = 8;
                _local_7.y = -54;
                _local_7.autoSize = TextFieldAutoSize.LEFT;
                _local_5.addChild(_local_7);
            }
            return _local_5;
        }

        public static function _Str_1472(k:Sprite, _arg_2:int, _arg_3:int):void
        {
            k.removeChildAt(0);
            k.addChildAt(NineSplitSprite._Str_2163.render(_arg_2, _arg_3), 0);
        }

        public static function _Str_2038(k:BitmapData, _arg_2:Rectangle):Shape
        {
            var _local_8:Number;
            var _local_9:int;
            var _local_3:Array = [(_arg_2.left - 0.001), (_arg_2.right + 0.001), k.width];
            var _local_4:Array = [(_arg_2.top - 0.001), (_arg_2.bottom + 0.001), k.height];
            var _local_5:Shape = new Shape();
            var _local_6:Number = 0;
            var _local_7:int;
            while (_local_7 < 3)
            {
                _local_8 = 0;
                _local_9 = 0;
                while (_local_9 < 3)
                {
                    _local_5.graphics.beginBitmapFill(k);
                    _local_5.graphics.drawRect(_local_6, _local_8, (_local_3[_local_7] - _local_6), (_local_4[_local_9] - _local_8));
                    _local_5.graphics.endFill();
                    _local_8 = _local_4[_local_9];
                    _local_9++;
                }
                _local_6 = _local_3[_local_7];
                _local_7++;
            }
            _local_5.scale9Grid = _arg_2;
            return _local_5;
        }

        public static function _Str_1398():Shape
        {
            return _Str_2038(Bitmap(new _Str_1249()).bitmapData, new Rectangle(10, 10, 10, 10));
        }
    }
}
