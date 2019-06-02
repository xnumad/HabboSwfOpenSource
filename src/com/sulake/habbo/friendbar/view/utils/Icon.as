package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.utils.Timer;
    import flash.geom.Point;
    import flash.display.BitmapData;
    import flash.events.TimerEvent;

    public class Icon implements IDisposable 
    {
        protected static const _Str_21407:int = 0;
        protected static const _Str_8982:int = 1;
        protected static const _Str_16475:int = 2;
        protected static const _Str_17719:int = 3;
        protected static const ALIGN_TOP:int = 4;
        protected static const _Str_8656:int = 8;
        protected static const ALIGN_BOTTOM:int = 18;
        protected static const _Str_18320:int = 18;

        private var _disposed:Boolean = false;
        private var _disabled:Boolean = false;
        protected var _Str_671:BitmapDataAsset;
        protected var _Str_1868:IBitmapWrapperWindow;
        private var _Str_4220:uint;
        protected var _Str_2364:Timer;
        protected var _frame:int = 0;
        private var _Str_6692:Point;
        protected var _Str_5470:Boolean = false;
        protected var _hover:Boolean = false;

        public function Icon()
        {
            this._Str_4220 = (_Str_8982 | _Str_8656);
            this._Str_6692 = new Point();
            super();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get disabled():Boolean
        {
            return this._disabled;
        }

        protected function set image(k:BitmapDataAsset):void
        {
            this._Str_671 = k;
            this._Str_6950();
        }

        protected function get image():BitmapDataAsset
        {
            return this._Str_671;
        }

        protected function set canvas(k:IBitmapWrapperWindow):void
        {
            this._Str_1868 = k;
            this._Str_6950();
        }

        protected function get canvas():IBitmapWrapperWindow
        {
            return this._Str_1868;
        }

        protected function set alignment(k:uint):void
        {
            this._Str_4220 = k;
            this._Str_6950();
        }

        protected function get alignment():uint
        {
            return this._Str_4220;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._Str_7231(false, 0);
                this.image = null;
                this.canvas = null;
                this._disposed = true;
            }
        }

        public function notify(k:Boolean):void
        {
            this._Str_5470 = k;
            if (((this._Str_5470) && (this._disabled)))
            {
                this.enable(true);
            }
        }

        public function hover(k:Boolean):void
        {
            this._hover = k;
        }

        public function enable(k:Boolean):void
        {
            this._disabled = (!(k));
        }

        protected function _Str_6950():void
        {
            var k:BitmapData;
            if (((this._Str_1868) && (!(this._Str_1868.disposed))))
            {
                if (!this._Str_1868.bitmap)
                {
                    this._Str_1868.bitmap = new BitmapData(this._Str_1868.width, this._Str_1868.height, true, 0);
                }
                else
                {
                    this._Str_1868.bitmap.fillRect(this._Str_1868.bitmap.rect, 0);
                }
                if (((this._Str_671) && (!(this._Str_671.disposed))))
                {
                    this._Str_6692.x = (this._Str_6692.y = 0);
                    k = (this._Str_671.content as BitmapData);
                    switch ((this._Str_4220 & _Str_17719))
                    {
                        case _Str_8982:
                            this._Str_6692.x = ((this._Str_1868.bitmap.width / 2) - (k.width / 2));
                            break;
                        case _Str_16475:
                            this._Str_6692.x = (this._Str_1868.bitmap.width - k.width);
                            break;
                    }
                    switch ((this._Str_4220 & _Str_18320))
                    {
                        case _Str_8656:
                            this._Str_6692.y = ((this._Str_1868.bitmap.height / 2) - (k.height / 2));
                            break;
                        case ALIGN_BOTTOM:
                            this._Str_6692.y = (this._Str_1868.bitmap.height - k.height);
                            break;
                    }
                    this._Str_1868.bitmap.copyPixels(k, k.rect, this._Str_6692);
                    this._Str_1868.invalidate();
                }
            }
        }

        protected function _Str_7231(k:Boolean, _arg_2:int):void
        {
            if (k)
            {
                if (!this._Str_2364)
                {
                    this._Str_2364 = new Timer(_arg_2, 0);
                    this._Str_2364.addEventListener(TimerEvent.TIMER, this.onTimerEvent);
                    this._Str_2364.start();
                    this.onTimerEvent(null);
                }
                this._Str_2364.delay = _arg_2;
            }
            else
            {
                this._frame = 0;
                if (this._Str_2364)
                {
                    this._Str_2364.reset();
                    this._Str_2364.removeEventListener(TimerEvent.TIMER, this.onTimerEvent);
                    this._Str_2364 = null;
                }
            }
        }

        protected function onTimerEvent(k:TimerEvent):void
        {
        }
    }
}
