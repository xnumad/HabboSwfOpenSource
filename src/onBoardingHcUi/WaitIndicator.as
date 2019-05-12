package onBoardingHcUi
{
    import flash.display.Sprite;
    import com.sulake.core.runtime.IDisposable;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import flash.utils.getTimer;
    import flash.geom.ColorTransform;

    public class WaitIndicator extends Sprite implements IDisposable 
    {
        private static const _Str_1067:int = 8;

        private var _disposed:Boolean;
        private var _style:int;

        public function WaitIndicator(k:int)
        {
            var _local_5:Bitmap;
            var _local_6:Number;
            super();
            this._style = k;
            var _local_2:uint = 0xFFFFFFFF;
            var _local_3:BitmapData = new BitmapData(4, 4, true, 0);
            _local_3.setVector(new Rectangle(0, 0, 4, 4), new <uint>[0, _local_2, _local_2, 0, _local_2, _local_2, _local_2, _local_2, _local_2, _local_2, _local_2, _local_2, 0, _local_2, _local_2, 0]);
            var _local_4:int;
            while (_local_4 < _Str_1067)
            {
                _local_5 = new Bitmap(_local_3);
                addChild(_local_5);
                _local_6 = ((k == LoaderUI._Str_2056) ? 12 : 8);
                _local_5.x = (int((_local_6 * Math.sin((((_local_4 * Math.PI) * 2) / _Str_1067)))) - 3);
                _local_5.y = (int((_local_6 * Math.cos((((_local_4 * Math.PI) * 2) / _Str_1067)))) - 3);
                _local_4++;
            }
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        private function _Str_1271(k:int):ColorTransform
        {
            var _local_2:Number = ((k / _Str_1067) - (getTimer() * 0.001));
            _local_2 = (_local_2 - Math.floor(_local_2));
            _local_2 = ((this._style == LoaderUI._Str_2056) ? (48 + ((192 * _local_2) / 0xFF)) : _local_2);
            return (this._style == LoaderUI._Str_2056) ? new ColorTransform(_local_2, _local_2, _local_2) : new ColorTransform(1, 1, 1, _local_2);
        }

        private function onAddedToStage(k:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            stage.addEventListener(Event.ENTER_FRAME, this._Str_749);
        }

        private function _Str_749(k:Event):void
        {
            graphics.clear();
            var _local_2:int;
            while (_local_2 < _Str_1067)
            {
                getChildAt(_local_2).transform.colorTransform = this._Str_1271(_local_2);
                _local_2++;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (stage != null)
            {
                stage.removeEventListener(Event.ENTER_FRAME, this._Str_749);
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
