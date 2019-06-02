package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;

    public class Animation implements IDisposable 
    {
        private var _canvas:IBitmapWrapperWindow;
        private var _timeElapsedSinceStart:int;
        private var _playing:Boolean;
        private var _sprites:Array;

        public function Animation(k:IBitmapWrapperWindow)
        {
            this._sprites = new Array();
            super();
            this._canvas = k;
            this._canvas.visible = false;
            if (k.bitmap == null)
            {
                k.bitmap = new BitmapData(k.width, k.height, true, 0);
            }
        }

        public function dispose():void
        {
            var k:AnimationObject;
            this._canvas = null;
            if (this._sprites)
            {
                for each (k in this._sprites)
                {
                    k.dispose();
                }
                this._sprites = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._canvas == null;
        }

        public function addObject(k:AnimationObject):void
        {
            this._sprites.push(k);
        }

        public function stop():void
        {
            this._playing = false;
            this._canvas.visible = false;
        }

        public function _Str_24676():void
        {
            var k:AnimationObject;
            this._timeElapsedSinceStart = 0;
            this._playing = true;
            for each (k in this._sprites)
            {
                k._Str_21940();
            }
            this.draw();
            this._canvas.visible = true;
        }

        public function update(k:uint):void
        {
            if (this._playing)
            {
                this._timeElapsedSinceStart = (this._timeElapsedSinceStart + k);
                this.draw();
            }
        }

        private function draw():void
        {
            var k:Boolean;
            var _local_2:AnimationObject;
            var _local_3:BitmapData;
            this._canvas.bitmap.fillRect(this._canvas.bitmap.rect, 0);
            if (this._playing)
            {
                k = false;
                for each (_local_2 in this._sprites)
                {
                    if (!_local_2._Str_22065(this._timeElapsedSinceStart))
                    {
                        k = true;
                        _local_3 = _local_2.getBitmap(this._timeElapsedSinceStart);
                        if (_local_3 != null)
                        {
                            this._canvas.bitmap.copyPixels(_local_3, _local_3.rect, _local_2.getPosition(this._timeElapsedSinceStart));
                        }
                    }
                }
            }
            this._canvas.invalidate();
            this._playing = k;
        }
    }
}
