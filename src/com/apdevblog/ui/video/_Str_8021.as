package com.apdevblog.ui.video
{
    import flash.display.Sprite;
    import flash.display.Shape;
    import com.apdevblog.ui.video.controls._Str_9571;
    import com.apdevblog.ui.video.controls._Str_8015;
    import com.apdevblog.ui.video.controls.BtnSound;
    import com.apdevblog.ui.video.controls._Str_9222;
    import com.apdevblog.ui.video.controls.VideoTimeLabel;
    import com.apdevblog.model.vo.VideoMetadataVo;
    import com.apdevblog.utils._Str_3771;
    import flash.events.MouseEvent;
    import com.apdevblog.ui.video.controls.VideoControlsEvent;

    public class _Str_8021 extends Sprite 
    {
        private var _Str_16463:int;
        private var _Str_3888:Shape;
        private var _play:_Str_9571;
        private var _bar:_Str_8015;
        private var _mute:BtnSound;
        private var _fullscreen:_Str_9222;
        private var _time:VideoTimeLabel;
        private var _Str_7402:VideoMetadataVo;

        public function _Str_8021(k:int)
        {
            this._Str_1400(k);
        }

        public function _Str_25228(k:String):void
        {
            this._fullscreen._Str_3820(k);
        }

        public function _Str_17296(k:Number):void
        {
            this._bar._Str_17296(k);
        }

        public function _Str_12997(k:Number):void
        {
            this._bar._Str_12997(k);
            if (this._Str_7402 != null)
            {
                this._time.update((this._Str_7402.duration * k));
            }
        }

        private function _Str_4149():void
        {
            this._Str_3888 = _Str_3771.rect(this.width, 29, 0, 0);
            addChild(this._Str_3888);
            this._play = new _Str_9571();
            this._play.x = 0;
            this._play.y = 3;
            addChild(this._play);
            this._mute = new BtnSound();
            this._time = new VideoTimeLabel();
            this._fullscreen = new _Str_9222();
            this._bar = new _Str_8015((this.width - ((((this._play.width + this._mute.width) + this._fullscreen.width) + this._time.width) + (4 * 3))));
            this._time.x = (((((this.width - this._fullscreen.width) - this._mute.width) - 3) - this._time.width) - 3);
            this._time.y = 3;
            this._mute.x = (((this.width - this._fullscreen.width) - this._mute.width) - 3);
            this._mute.y = 3;
            this._fullscreen.x = (this.width - this._fullscreen.width);
            this._fullscreen.y = 3;
            this._bar.x = ((this._play.x + this._play.width) + 3);
            this._bar.y = 11;
            addChild(this._bar);
            addChild(this._time);
            addChild(this._mute);
            addChild(this._fullscreen);
        }

        private function _Str_1400(k:int):void
        {
            this._Str_16463 = k;
            this._Str_4149();
            addEventListener(MouseEvent.CLICK, this.onClick, false, 0, true);
        }

        private function onClick(k:MouseEvent):void
        {
            switch (k.target)
            {
                case this._play:
                    dispatchEvent(new VideoControlsEvent(VideoControlsEvent.TOGGLEPLAYPAUSE, true, true));
                    return;
                case this._fullscreen:
                    dispatchEvent(new VideoControlsEvent(VideoControlsEvent.ENTERFULLSCREEN, true, true));
                    return;
            }
        }

        override public function get width():Number
        {
            return this._Str_16463;
        }

        override public function set width(k:Number):void
        {
            this._Str_16463 = k;
            if (this._Str_3888 != null)
            {
                this._Str_3888.width = k;
                this._bar.width = k;
                this._mute.x = ((this._bar.x + this._bar.width) + 4);
            }
        }

        public function set state(k:String):void
        {
            this._play._Str_3820(k);
        }

        public function set _Str_3206(k:Number):void
        {
            this._mute._Str_3820(k);
        }

        public function set meta(k:VideoMetadataVo):void
        {
            this._Str_7402 = k;
            this._bar._Str_16501(k);
            this._time._Str_16501(k);
        }

        public function get play():_Str_9571
        {
            return this._play;
        }

        public function get bar():_Str_8015
        {
            return this._bar;
        }

        public function get mute():BtnSound
        {
            return this._mute;
        }

        public function get fullscreen():_Str_9222
        {
            return this._fullscreen;
        }

        public function get time():VideoTimeLabel
        {
            return this._time;
        }
    }
}
