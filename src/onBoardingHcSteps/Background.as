package onBoardingHcSteps
{
    import flash.display.Sprite;
    import com.sulake.core.runtime.IDisposable;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.display.Bitmap;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import flash.display.SpreadMethod;
    import onBoardingHcSteps.images.*;

    public class Background extends Sprite implements IDisposable 
    {
        private static const background_tiles_png:Class = Background_background_tiles_png;

        private var _backgroundImage:BitmapData;
        private var _disposed:Boolean;
        private var _lines:Sprite;

        public function Background()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }

        public function dispose():void
        {
            this._disposed = true;
            while (numChildren > 0)
            {
                removeChildAt(0);
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function onRemovedFromStage(k:Event):void
        {
        }

        protected function onAddedToStage(k:Event):void
        {
            this._lines = new Sprite();
            var _local_2:Bitmap = new background_tiles_png();
            this._backgroundImage = _local_2.bitmapData;
            addChild(this._lines);
            this.resize();
        }

        protected function stageChangeResize(k:Event):void
        {
            this.resize();
        }

        public function resize():void
        {
            var k:String;
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:Matrix;
            var _local_6:String;
            if (stage)
            {
                k = GradientType.LINEAR;
                _local_2 = [809599, 801381];
                _local_3 = [1, 1];
                _local_4 = [127, 0xFF];
                _local_5 = new Matrix();
                _local_5.createGradientBox(50, 100, 0, 0, 0);
                _local_5.rotate((Math.PI / 2));
                _local_5.scale((stage.stageWidth / 50), (stage.stageHeight / 100));
                _local_6 = SpreadMethod.PAD;
                graphics.beginGradientFill(k, _local_2, _local_3, _local_4, _local_5, _local_6);
                graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                if (this._lines != null)
                {
                    this._lines.graphics.clear();
                    this._lines.graphics.beginBitmapFill(this._backgroundImage);
                    this._lines.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                    this._lines.graphics.endFill();
                }
            }
        }
    }
}
