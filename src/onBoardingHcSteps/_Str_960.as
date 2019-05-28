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

    public class _Str_960 extends Sprite implements IDisposable 
    {
        private static const _Str_1382:Class = _Str_960__Str_1382;

        private var _Str_1416:BitmapData;
        private var _disposed:Boolean;
        private var _Str_2111:Sprite;

        public function _Str_960()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this._Str_583);
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

        private function _Str_583(k:Event):void
        {
        }

        protected function onAddedToStage(k:Event):void
        {
            this._Str_2111 = new Sprite();
            var _local_2:Bitmap = new _Str_1382();
            this._Str_1416 = _local_2.bitmapData;
            addChild(this._Str_2111);
            this.resize();
        }

        protected function _Str_1546(k:Event):void
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
                if (this._Str_2111 != null)
                {
                    this._Str_2111.graphics.clear();
                    this._Str_2111.graphics.beginBitmapFill(this._Str_1416);
                    this._Str_2111.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                    this._Str_2111.graphics.endFill();
                }
            }
        }
    }
}
