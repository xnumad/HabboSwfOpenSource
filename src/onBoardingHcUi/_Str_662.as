package onBoardingHcUi
{
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.DisplayObject;
	import onBoardingHcUi.images.*;

    public class _Str_662 extends _Str_951 
    {
        private static const _Str_1141:Class = _Str_662__Str_1141;
        private static const _Str_2209:Class = _Str_662__Str_2209;
        private static const _Str_1957:Class = _Str_662__Str_1957;
        private static const _Str_1124:Class = _Str_662__Str_1124;

        private var _icon:BitmapData;

        public function _Str_662(k:int, _arg_2:int, _arg_3:Function, _arg_4:uint=0xFFFFFF)
        {
            super("", new Rectangle(k, _arg_2, 50, 53), false, _arg_3, _arg_4);
        }

        public function _Str_2233(k:BitmapData):void
        {
            this._icon = k;
            var _local_2:Bitmap = new Bitmap(k);
            _local_2.x = ((width - _local_2.width) / 2);
            _local_2.y = ((height - _local_2.height) / 2);
            addChild(_local_2);
        }

        override protected function onAddedToStage(k:Event):void
        {
            super.onAddedToStage(k);
            if (this._icon)
            {
                this._Str_2233(this._icon);
            }
        }

        override protected function get defaultBackground():DisplayObject
        {
            return new _Str_1141() as Bitmap;
        }

        override protected function get pressedBackground():DisplayObject
        {
            return new _Str_2209() as Bitmap;
        }

        override protected function get inactiveBackground():DisplayObject
        {
            return new _Str_1141() as Bitmap;
        }

        override protected function get rolloverBackground():DisplayObject
        {
            return new _Str_1957() as Bitmap;
        }

        override protected function get currentlyActive():DisplayObject
        {
            return new _Str_1124() as Bitmap;
        }
    }
}
