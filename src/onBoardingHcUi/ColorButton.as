package onBoardingHcUi
{
    import flash.display.Sprite;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.ColorTransform;
    import flash.events.Event;
    import flash.display.Bitmap;
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import onBoardingHcUi.images.*;

    public class ColorButton extends _Str_951 
    {
        private static const _Str_1682:Class = ColorButton__Str_1682;
        private static const _Str_1631:Class = ColorButton__Str_1631;
        private static const _Str_1164:Class = ColorButton__Str_1164;
        private static const _Str_1254:Class = ColorButton__Str_1254;

        private var _index:int = 0;
        private var _club:Boolean = false;
        private var _color:Number = -1;
        private var _mainSprite:Sprite;
        private var _colorBmd:BitmapData;

        public function ColorButton(k:int, _arg_2:int, _arg_3:Function, _arg_4:uint=0xFFFFFF, _arg_5:Number=0xFFFFFF)
        {
            this._color = _arg_5;
            super("", new Rectangle(k, _arg_2, 44, 46), false, _arg_3, _arg_4);
        }

        public function setColor(k:Number):void
        {
            this._color = k;
            this._mainSprite = new Sprite();
            var _local_2:BitmapData = new _Str_1254().bitmapData;
            var _local_3:ColorTransform = new ColorTransform();
            _local_3.color = k;
            _local_2.colorTransform(new Rectangle(0, 0, _local_2.width, _local_2.height), _local_3);
            this._colorBmd = _local_2;
        }

        override protected function onAddedToStage(k:Event):void
        {
            super.onAddedToStage(k);
            if (this._color > 0)
            {
                this.setColor(this._color);
            }
        }

        public function set index(k:int):void
        {
            this._index = k;
        }

        public function get index():int
        {
            return this._index;
        }

        public function set club(k:Boolean):void
        {
            this._club = k;
        }

        public function get club():Boolean
        {
            return this._club;
        }

        override protected function get defaultBackground():DisplayObject
        {
            var k:BitmapData = Bitmap(new _Str_1682()).bitmapData;
            var _local_2:BitmapData = new BitmapData(k.width, k.height, true, this._color);
            _local_2.copyPixels(this._colorBmd, this._colorBmd.rect, new Point(0, 0));
            _local_2.copyPixels(k, k.rect, new Point(0, 0), null, null, true);
            return new Bitmap(_local_2);
        }

        override protected function get pressedBackground():DisplayObject
        {
            var k:BitmapData = Bitmap(new _Str_1164()).bitmapData;
            var _local_2:BitmapData = new BitmapData(k.width, k.height, true, this._color);
            _local_2.copyPixels(this._colorBmd, this._colorBmd.rect, new Point(0, 0));
            _local_2.copyPixels(k, k.rect, new Point(0, 0), null, null, true);
            return new Bitmap(_local_2);
        }

        override protected function get inactiveBackground():DisplayObject
        {
            var k:BitmapData = Bitmap(new _Str_1682()).bitmapData;
            var _local_2:BitmapData = new BitmapData(k.width, k.height, true, this._color);
            _local_2.copyPixels(this._colorBmd, this._colorBmd.rect, new Point(0, 0));
            _local_2.copyPixels(k, k.rect, new Point(0, 0), null, null, true);
            return new Bitmap(_local_2);
        }

        override protected function get rolloverBackground():DisplayObject
        {
            var k:BitmapData = Bitmap(new _Str_1631()).bitmapData;
            var _local_2:BitmapData = new BitmapData(k.width, k.height, true, this._color);
            _local_2.copyPixels(this._colorBmd, this._colorBmd.rect, new Point(0, 0));
            _local_2.copyPixels(k, k.rect, new Point(0, 0), null, null, true);
            return new Bitmap(_local_2);
        }
    }
}
