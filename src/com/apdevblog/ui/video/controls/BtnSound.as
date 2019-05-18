package com.apdevblog.ui.video.controls
{
    import flash.display.Sprite;
    import flash.display.Shape;
    import com.apdevblog.utils._Str_3771;
    import flash.events.MouseEvent;
    import com.apdevblog.ui.video.controls.VideoControlsEvent;

    public class BtnSound extends Sprite 
    {
        private var _Str_17479:Array;

        public function BtnSound()
        {
            this._Str_1400();
        }

        public function _Str_3820(k:Number):void
        {
            var _local_4:Shape;
            var _local_2:int = Math.ceil((k * 7));
            var _local_3:Number = 1;
            while (_local_3 < 9)
            {
                _local_4 = (this._Str_17479[(_local_3 - 1)] as Shape);
                if (_local_4 != null)
                {
                    _local_4.alpha = (((_local_3 - 1) > _local_2) ? 0.25 : 1);
                }
                _local_3++;
            }
        }

        private function _Str_4149():void
        {
            var _local_3:Shape;
            var k:Shape = _Str_3771._Str_13333(31, 23, 90, 3748644, 0, 1, 1);
            addChild(k);
            this._Str_17479 = new Array();
            var _local_2:Number = 0;
            while (_local_2 < 8)
            {
                _local_3 = _Str_3771.rect(2, (_local_2 + 1), 13020778, 1);
                _local_3.x = (4 + (_local_2 * 3));
                _local_3.y = (16 - (1 + _local_2));
                addChild(_local_3);
                this._Str_17479.push(_local_3);
                _local_2++;
            }
        }

        private function _Str_1400():void
        {
            mouseEnabled = true;
            buttonMode = true;
            this._Str_4149();
            addEventListener(MouseEvent.MOUSE_DOWN, this._Str_780, false, 0, true);
        }

        private function _Str_19706():void
        {
            var _local_2:Number;
            var k:int = mouseX;
            if (k < 4)
            {
                _local_2 = 0;
            }
            else
            {
                if (k > 27)
                {
                    _local_2 = 1;
                }
                else
                {
                    _local_2 = ((k - 4) / 23);
                }
            }
            dispatchEvent(new VideoControlsEvent(VideoControlsEvent.SETVOLUME, true, true, _local_2));
        }

        private function _Str_4955(k:MouseEvent):void
        {
            this._Str_19706();
        }

        private function _Str_780(k:MouseEvent):void
        {
            addEventListener(MouseEvent.MOUSE_UP, this._Str_712, false, 0, true);
            addEventListener(MouseEvent.MOUSE_MOVE, this._Str_4955, false, 0, true);
        }

        private function _Str_712(k:MouseEvent):void
        {
            removeEventListener(MouseEvent.MOUSE_UP, this._Str_712);
            removeEventListener(MouseEvent.MOUSE_MOVE, this._Str_4955);
            this._Str_19706();
        }
    }
}
