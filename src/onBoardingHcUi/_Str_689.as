package onBoardingHcUi
{
    import flash.display.DisplayObject;
    import flash.display.Bitmap;
    import flash.geom.Rectangle;
    import onBoardingHcUi.images.*;

    public class _Str_689 extends _Str_951 
    {
        private static const _Str_2147:Class = _Str_689__Str_2147;
        private static const _Str_1718:Class = _Str_689__Str_1718;
        private static const _Str_2246:Class = _Str_689__Str_2246;
        private static const _Str_1543:Class = _Str_689__Str_1543;
        private static const _Str_1339:Class = _Str_689__Str_1339;
        private static const _Str_1841:Class = _Str_689__Str_1841;
        private static const _Str_1174:Class = _Str_689__Str_1174;
        private static const _Str_1463:Class = _Str_689__Str_1463;
        private static const static:Class = _Str_689_static;
        private static const _Str_1275:Class = _Str_689__Str_1275;
        private static const _Str_1191:Class = _Str_689__Str_1191;
        private static const _Str_1851:Class = _Str_689__Str_1851;
        private static const icon_hc:Class = _Str_689_icon_hc;
        public static const RED:String = "red";
        public static const GFREEN:String = "gfreen";
        public static const YELLOW:String = "yellow";

        private var _Str_1365:DisplayObject;
        private var _Str_1064:DisplayObject;
        private var _Str_1212:DisplayObject;
        private var _Str_1465:DisplayObject;
        private var _icon:Bitmap;

        public function _Str_689(k:String, _arg_2:String, _arg_3:Rectangle, _arg_4:Boolean, _arg_5:Function, _arg_6:uint=0xFFFFFF)
        {
            switch (k)
            {
                case RED:
                    this._Str_1365 = LoaderUI._Str_2038(Bitmap(new _Str_1339()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1064 = LoaderUI._Str_2038(Bitmap(new _Str_1841()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1212 = LoaderUI._Str_2038(Bitmap(new _Str_1463()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1465 = LoaderUI._Str_2038(Bitmap(new _Str_1174()).bitmapData, new Rectangle(8, 10, 6, 4));
                    break;
                case GFREEN:
                    this._Str_1365 = LoaderUI._Str_2038(Bitmap(new _Str_2147()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1064 = LoaderUI._Str_2038(Bitmap(new _Str_1718()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1212 = LoaderUI._Str_2038(Bitmap(new _Str_2246()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1465 = LoaderUI._Str_2038(Bitmap(new _Str_1543()).bitmapData, new Rectangle(8, 10, 6, 4));
                    break;
                case YELLOW:
                    this._Str_1365 = LoaderUI._Str_2038(Bitmap(new static()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1064 = LoaderUI._Str_2038(Bitmap(new _Str_1275()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1212 = LoaderUI._Str_2038(Bitmap(new _Str_1851()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._Str_1465 = LoaderUI._Str_2038(Bitmap(new _Str_1191()).bitmapData, new Rectangle(8, 10, 6, 4));
                    this._icon = Bitmap(new icon_hc());
                    break;
            }
            super(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        override protected function get defaultBackground():DisplayObject
        {
            return this._Str_1365;
        }

        override protected function get pressedBackground():DisplayObject
        {
            return this._Str_1064;
        }

        override protected function get inactiveBackground():DisplayObject
        {
            return this._Str_1212;
        }

        override protected function get rolloverBackground():DisplayObject
        {
            return this._Str_1465;
        }

        override protected function get etching():Boolean
        {
            return false;
        }

        override protected function get padding():int
        {
            return 64;
        }

        override protected function get textColour():uint
        {
            return 0xFFFFFF;
        }

        override protected function get icon():Bitmap
        {
            return this._icon;
        }
    }
}
