package com.apdevblog.ui.video.controls
{
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.text.TextField;
    import com.apdevblog.model.vo.VideoMetadataVo;
    import com.apdevblog.utils.StringUtils;
    import com.apdevblog.utils._Str_3771;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import flash.events.MouseEvent;

    public class VideoTimeLabel extends Sprite 
    {
        public static const STATECOUNTUP:String = "stateCountUp";
        public static const STATECOUNTDOWN:String = "stateCountDown";

        private var _Str_3888:Shape;
        private var _txt:TextField;
        private var _state:String;
        private var _Str_7402:VideoMetadataVo;
        private var _Str_4492:Number;

        public function VideoTimeLabel()
        {
            this._Str_1400();
        }

        public function update(k:Number):void
        {
            var _local_6:int;
            this._Str_4492 = k;
            if (this._state == VideoTimeLabel.STATECOUNTDOWN)
            {
                _local_6 = ((this._Str_7402 != null) ? this._Str_7402.duration : 0);
                k = (_local_6 - k);
                this._txt.textColor = 5787708;
            }
            else
            {
                this._txt.textColor = 13020778;
            }
            var _local_2:Number = (k % 60);
            var _local_3:Number = ((k - _local_2) / 60);
            var _local_4:String = _local_2.toString().split(".")[0];
            _local_4 = StringUtils._Str_22222(_local_4, 2, "0");
            var _local_5:String = StringUtils._Str_22222(_local_3.toString(), 2, "0");
            this._txt.text = ((_local_5 + ":") + _local_4);
        }

        public function _Str_16501(k:VideoMetadataVo):void
        {
            this._Str_7402 = k;
        }

        private function _Str_4149():void
        {
            this._Str_3888 = _Str_3771.rect(34, 23, 0xFF0000, 0);
            addChild(this._Str_3888);
            this._txt = new TextField();
            this._txt.width = 34;
            this._txt.height = 18;
            this._txt.y = 2;
            this._txt.selectable = false;
            var k:TextFormat = new TextFormat();
            k.font = "Arial";
            k.color = 13020778;
            k.size = 10;
            k.kerning = true;
            k.align = TextFormatAlign.CENTER;
            this._txt.defaultTextFormat = k;
            this._txt.text = "00:00";
            addChild(this._txt);
        }

        private function _Str_1400():void
        {
            mouseChildren = false;
            buttonMode = true;
            this._state = VideoTimeLabel.STATECOUNTUP;
            this._Str_4492 = 0;
            this._Str_4149();
            addEventListener(MouseEvent.CLICK, this.onMouseClick, false, 0, true);
        }

        private function _Str_25190():void
        {
            if (this._state == VideoTimeLabel.STATECOUNTUP)
            {
                this._state = VideoTimeLabel.STATECOUNTDOWN;
            }
            else
            {
                this._state = VideoTimeLabel.STATECOUNTUP;
            }
            this.update(this._Str_4492);
        }

        private function onMouseClick(k:MouseEvent):void
        {
            this._Str_25190();
        }
    }
}
