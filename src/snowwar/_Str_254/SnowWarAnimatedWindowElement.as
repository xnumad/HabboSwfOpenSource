package snowwar._Str_254
{
	import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.utils.Timer;
    import flash.display.BitmapData;
    import flash.events.TimerEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.geom.Point;

    public class SnowWarAnimatedWindowElement implements IDisposable 
    {
        private var _SafeStr_6169:int;
        private var _SafeStr_22043:String;
        private var _SafeStr_6037:Array;
        private var _SafeStr_22044:int;
        private var _SafeStr_20417:IBitmapWrapperWindow;
        private var _SafeStr_12319:Timer;
        private var _disposed:Boolean = false;

        public function SnowWarAnimatedWindowElement(k:IAssetLibrary, _arg_2:IBitmapWrapperWindow, _arg_3:String, _arg_4:int, _arg_5:int=100, _arg_6:Boolean=false)
        {
            var _local_7:int;
            this._SafeStr_6037 = [];
            super();
            this._SafeStr_20417 = _arg_2;
            this._SafeStr_22043 = _arg_3;
            this._SafeStr_6169 = _arg_4;
            _local_7 = 1;
            while (_local_7 <= this._SafeStr_6169)
            {
                if (k.hasAsset((this._SafeStr_22043 + _local_7)))
                {
                    this._SafeStr_6037.push((k.getAssetByName((this._SafeStr_22043 + _local_7)).content as BitmapData));
                }
                else
                {
                    this._SafeStr_6037.push(new BitmapData(1, 1));
                    Logger.log((("Missing asset for Snow War: " + this._SafeStr_22043) + _local_7));
                }
                _local_7++;
            }
            if (_arg_6)
            {
                this._SafeStr_6169 = (this._SafeStr_6169 + (_arg_4 - 2));
                _local_7 = (_arg_4 - 1);
                while (_local_7 > 1)
                {
                    if (k.hasAsset((this._SafeStr_22043 + _local_7)))
                    {
                        this._SafeStr_6037.push((k.getAssetByName((this._SafeStr_22043 + _local_7)).content as BitmapData));
                    }
                    else
                    {
                        this._SafeStr_6037.push(new BitmapData(1, 1));
                        Logger.log((("Missing loop asset for Snow War: " + this._SafeStr_22043) + _local_7));
                    }
                    _local_7--;
                }
            }
            this.update();
            this._SafeStr_12319 = new Timer(_arg_5);
            this._SafeStr_12319.addEventListener(TimerEvent.TIMER, this.onTimer);
            this._SafeStr_12319.start();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._SafeStr_12319.removeEventListener(TimerEvent.TIMER, this.onTimer);
                this._SafeStr_12319.stop();
                this._SafeStr_12319 = null;
                if (((this._SafeStr_20417) && (this._SafeStr_20417.bitmap)))
                {
                    this._SafeStr_20417.bitmap.fillRect(this._SafeStr_20417.bitmap.rect, 0);
                    this._SafeStr_20417.invalidate();
                }
                this._SafeStr_20417 = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function onTimer(k:TimerEvent):void
        {
            this.update();
        }

        private function update():void
        {
			try
			{
            this._SafeStr_22044 = (++this._SafeStr_22044 % this._SafeStr_6169);
            if (!this._SafeStr_20417.bitmap)
            {
                this._SafeStr_20417.bitmap = new BitmapData(this._SafeStr_20417.width, this._SafeStr_20417.height);
            }
            this._SafeStr_20417.bitmap.fillRect(this._SafeStr_20417.bitmap.rect, 0);
            var k:BitmapData = this._SafeStr_6037[this._SafeStr_22044];
            var _local_2:Point = new Point(((this._SafeStr_20417.width - k.width) / 2), ((this._SafeStr_20417.height - k.height) / 2));
            this._SafeStr_20417.bitmap.copyPixels(k, k.rect, _local_2);
            this._SafeStr_20417.invalidate();
			}
			catch (e:Error)
			{
				trace(_SafeStr_6169 + "/" + this._SafeStr_12319.delay + "| " + this._SafeStr_22043 + " | " + e.getStackTrace());
					
			}
        }
    }
}
