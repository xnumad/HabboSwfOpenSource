package com.apdevblog.ui.video.controls
{
    import flash.display.Sprite;
    import flash.display.Shape;
    import com.apdevblog.model.vo.VideoMetadataVo;
    import flash.events.MouseEvent;
    import com.apdevblog.utils._Str_3771;
    import com.apdevblog.ui.video.controls.VideoControlsEvent;

    public class _Str_8015 extends Sprite 
    {
        private var _Str_6998:Shape;
        private var _Str_4597:Sprite;
        private var _Str_5463:Sprite;
        private var _Str_2467:Number = 0;
        private var _Str_9553:Sprite;
        private var _Str_6953:Shape;
        private var _Str_20846:int;
        private var _Str_20838:Boolean = false;

        public function _Str_8015(k:int)
        {
            this._Str_1400(k);
        }

        public function _Str_17296(k:Number):void
        {
            this._Str_6953.scaleX = ((k <= 1) ? k : 1);
        }

        public function _Str_16501(k:VideoMetadataVo):void
        {
            this._Str_2467 = k.duration;
        }

        public function _Str_12997(k:Number):void
        {
            this._Str_5463.scaleX = ((k <= 1) ? k : 1);
            this._Str_9553.x = Math.round(this._Str_5463.width);
        }

        private function _Str_20378():void
        {
            if (this._Str_4597 != null)
            {
                this._Str_4597.removeEventListener(MouseEvent.CLICK, this._Str_20897);
                removeChild(this._Str_4597);
                this._Str_4597 = null;
            }
            if (this._Str_6953 != null)
            {
                removeChild(this._Str_6953);
                this._Str_6953 = null;
            }
            if (this._Str_5463 != null)
            {
                removeChild(this._Str_5463);
                this._Str_5463 = null;
            }
            this._Str_4597 = new Sprite();
            this._Str_4597.buttonMode = true;
            this._Str_4597.addChild(_Str_3771.rect(this._Str_6998.width, 5, 5787708, 1));
            this._Str_4597.addEventListener(MouseEvent.MOUSE_DOWN, this._Str_20897, false, 0, true);
            addChild(this._Str_4597);
            this._Str_6953 = _Str_3771.rect(this._Str_6998.width, 5, 0xFF0000, 1);
            addChild(this._Str_6953);
            this._Str_4597.mask = this._Str_6953;
            this._Str_5463 = new Sprite();
            this._Str_5463.mouseEnabled = false;
            this._Str_5463.addChild(_Str_3771.rect(this._Str_6998.width, 5, 13020778, 1));
            addChild(this._Str_5463);
            this._Str_6953.scaleX = 0;
            this._Str_5463.scaleX = 0;
        }

        private function _Str_4149():void
        {
            this._Str_6998 = _Str_3771.rect(this._Str_20846, 5, 5787708, 0.5);
            addChild(this._Str_6998);
            this._Str_20378();
            this._Str_9553 = new Sprite();
            this._Str_9553.mouseEnabled = false;
            this._Str_9553.addChild(_Str_3771.rect(5, 11, 0, 0.2, -2, -3));
            this._Str_9553.addChild(_Str_3771.rect(3, 9, 0xFFFFFF, 1, -1, -2));
            addChild(this._Str_9553);
        }

        private function _Str_1400(k:int):void
        {
            this._Str_20846 = k;
            this._Str_4149();
        }

        private function _Str_16616(k:Boolean):void
        {
            var _local_3:VideoControlsEvent;
            if (!this._Str_18989)
            {
                return;
            }
            var _local_2:Number = ((this._Str_4597.mouseX * this._Str_4597.scaleX) / this._Str_4597.width);
            if (k)
            {
                _local_3 = new VideoControlsEvent(VideoControlsEvent.SCRUB, true, true, _local_2);
            }
            else
            {
                _local_3 = new VideoControlsEvent(VideoControlsEvent.SEEK, true, true, _local_2);
            }
            dispatchEvent(_local_3);
        }

        private function _Str_20897(k:MouseEvent):void
        {
            dispatchEvent(new VideoControlsEvent(VideoControlsEvent.TOGGLEPLAYPAUSE, true, true, false));
            this._Str_16616(false);
            stage.addEventListener(MouseEvent.MOUSE_UP, this._Str_712, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this._Str_4955, false, 0, true);
        }

        private function _Str_4955(k:MouseEvent):void
        {
            this._Str_16616(true);
        }

        private function _Str_712(k:MouseEvent):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_4955);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            this._Str_16616(false);
            dispatchEvent(new VideoControlsEvent(VideoControlsEvent.TOGGLEPLAYPAUSE, true, true, true));
        }

        override public function set width(k:Number):void
        {
            this._Str_6998.width = k;
            this._Str_20378();
        }

        override public function get width():Number
        {
            return this._Str_6998.width;
        }

        public function get _Str_18989():Boolean
        {
            return this._Str_20838;
        }

        public function set _Str_18989(k:Boolean):void
        {
            this._Str_20838 = k;
        }
    }
}
