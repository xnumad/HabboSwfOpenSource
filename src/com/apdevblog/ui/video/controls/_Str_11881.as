package com.apdevblog.ui.video.controls
{
    import flash.display.Sprite;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import com.apdevblog.utils._Str_3771;
    import flash.display.Shape;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.apdevblog.ui.video.controls.VideoControlsEvent;

    public class _Str_11881 extends Sprite 
    {
        private var _Str_2835:Loader;
        private var _Str_8321:_Str_9370;
        private var _Str_4901:Number;
        private var _Str_4960:Number;

        public function _Str_11881(k:Number, _arg_2:Number)
        {
            this._Str_1400(k, _arg_2);
        }

        public function load(k:URLRequest):void
        {
            if (k == null)
            {
                return;
            }
            this._Str_2835.load(k);
        }

        private function _Str_4149():void
        {
            this._Str_2835 = new Loader();
            addChild(this._Str_2835);
            this._Str_8321 = new _Str_9370();
            this._Str_8321.x = Math.round((this._Str_4901 * 0.5));
            this._Str_8321.y = Math.round((this._Str_4960 * 0.5));
            addChild(this._Str_8321);
            var k:Shape = _Str_3771.rect(this._Str_4901, this._Str_4960, 0xFF0000, 1);
            addChild(k);
            mask = k;
        }

        private function _Str_1400(k:Number, _arg_2:Number):void
        {
            this._Str_4901 = k;
            this._Str_4960 = _arg_2;
            buttonMode = true;
            this._Str_4149();
            addEventListener(MouseEvent.MOUSE_OVER, this._Str_23190, false, 0, true);
            addEventListener(MouseEvent.MOUSE_OUT, this._Str_24680, false, 0, true);
            addEventListener(MouseEvent.CLICK, this._Str_24204, false, 0, true);
            this._Str_2835.contentLoaderInfo.addEventListener(Event.COMPLETE, this._Str_10931, false, 0, true);
        }

        private function _Str_24204(k:MouseEvent):void
        {
            dispatchEvent(new VideoControlsEvent(VideoControlsEvent.TOGGLEPLAYPAUSE, true, true));
        }

        private function _Str_10931(k:Event):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_6:Number;
            _local_2 = (this._Str_2835.width / this._Str_2835.height);
            _local_3 = this._Str_4901;
            _local_4 = this._Str_4960;
            var _local_5:Number = (_local_3 / _local_4);
            if (_local_2 > _local_5)
            {
                this._Str_2835.width = _local_3;
                this._Str_2835.height = (_local_3 / _local_2);
                if (this._Str_2835.height < _local_4)
                {
                    _local_6 = (_local_4 / this._Str_2835.height);
                    this._Str_2835.width = (this._Str_2835.width * _local_6);
                    this._Str_2835.height = (this._Str_2835.height * _local_6);
                }
            }
            else
            {
                this._Str_2835.width = (_local_4 * _local_2);
                this._Str_2835.height = _local_4;
                if (this._Str_2835.width < _local_3)
                {
                    _local_6 = (_local_3 / this._Str_2835.width);
                    this._Str_2835.width = (this._Str_2835.width * _local_6);
                    this._Str_2835.height = (this._Str_2835.height * _local_6);
                }
            }
            this._Str_2835.x = Math.round(((_local_3 - this._Str_2835.width) * 0.5));
            this._Str_2835.y = Math.round(((_local_4 - this._Str_2835.height) * 0.5));
        }

        private function _Str_24680(k:MouseEvent):void
        {
            this._Str_8321.alpha = 0.3;
        }

        private function _Str_23190(k:MouseEvent):void
        {
            this._Str_8321.alpha = 0.5;
        }
    }
}
