package onBoardingHcUi
{
    import flash.geom.Rectangle;
    import flash.events.Event;
    import flash.display.Bitmap;
    import flash.display.DisplayObject;

    public class _Str_650 extends _Str_951 
    {
        private static const _Str_986:Class = _Str_775;

        public function _Str_650(k:int, _arg_2:int, _arg_3:Function, _arg_4:uint=0xFFFFFF)
        {
            super("", new Rectangle(k, _arg_2, 50, 52), false, _arg_3, _arg_4);
        }

        override protected function onAddedToStage(k:Event):void
        {
            super.onAddedToStage(k);
        }

        override protected function get defaultBackground():DisplayObject
        {
            return new _Str_986() as Bitmap;
        }

        override protected function get pressedBackground():DisplayObject
        {
            return new _Str_986() as Bitmap;
        }

        override protected function get inactiveBackground():DisplayObject
        {
            return new _Str_986() as Bitmap;
        }

        override protected function get rolloverBackground():DisplayObject
        {
            return new _Str_986() as Bitmap;
        }
    }
}
