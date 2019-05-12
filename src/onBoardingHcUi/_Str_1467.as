package onBoardingHcUi
{
    import flash.display.Sprite;
    import flash.display.BitmapData;
    import flash.events.Event;

    public class _Str_1467 extends Sprite 
    {
        private var _Str_1129:BitmapData;

        public function _Str_1467()
        {
            var k:Number = 0.75;
            var _local_2:Number = 0.06;
            var _local_3:Number = (1 - ((1 - k) * (1 - _local_2)));
            var _local_4:uint = uint(((0xFF * _local_2) / _local_3));
            this._Str_1129 = new BitmapData(2, 2, true, (uint((k * 0xFF)) << 24));
            this._Str_1129.setPixel32(0, 0, ((uint((_local_3 * 0xFF)) << 24) + (_local_4 * 65793)));
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this._Str_583);
        }

        private function _Str_583(k:Event):void
        {
            stage.removeEventListener(Event.RESIZE, this._Str_1001);
        }

        private function onAddedToStage(k:Event):void
        {
            stage.addEventListener(Event.RESIZE, this._Str_1001);
            this._Str_1001(null);
        }

        private function _Str_1001(k:Event):void
        {
            graphics.clear();
            graphics.beginBitmapFill(this._Str_1129);
            graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
            graphics.endFill();
            width = stage.stageWidth;
            height = stage.stageHeight;
            x = -(int((width / 2)));
            y = -(int((height / 2)));
        }
    }
}
