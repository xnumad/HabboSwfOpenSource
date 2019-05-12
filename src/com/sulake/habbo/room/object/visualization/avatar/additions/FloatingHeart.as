package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FloatingHeart extends ExpressionAddition 
    {
        private static const DELAY_BEFORE_ANIMATION:int = 300;
        private static const STATE_DELAY:int = 0;
        private static const STATE_FADE_IN:int = 1;
        private static const STATE_FLOAT:int = 2;
        private static const STATE_COMPLETE:int = 3;

        private var _asset:BitmapDataAsset;
        private var _startTime:int;
        private var _delta:Number = 0;
        private var _offsetY:int;
        private var _scale:Number;
        private var _state:int = -1;

        public function FloatingHeart(k:int, _arg_2:int, _arg_3:AvatarVisualization)
        {
            super(k, _arg_2, _arg_3);
            this._startTime = getTimer();
            this._state = 0;
        }

        override public function animate(k:IRoomObjectSprite):Boolean
        {
            var _local_2:Number;
            var _local_3:int;
            if (!k)
            {
                return false;
            }
            if (this._asset)
            {
                k.asset = (this._asset.content as BitmapData);
            }
            if (this._state == STATE_DELAY)
            {
                if ((getTimer() - this._startTime) < DELAY_BEFORE_ANIMATION)
                {
                    return false;
                }
                this._state = STATE_FADE_IN;
                k.alpha = 0;
                k.visible = true;
                this._delta = 0;
                return true;
            }
            if (this._state == STATE_FADE_IN)
            {
                this._delta = (this._delta + 0.1);
                k.offsetY = this._offsetY;
                k.alpha = (Math.pow(this._delta, 0.9) * 0xFF);
                if (this._delta >= 1)
                {
                    this._delta = 0;
                    k.alpha = 0xFF;
                    this._state = STATE_FLOAT;
                }
                return true;
            }
            if (this._state == STATE_FLOAT)
            {
                _local_2 = Math.pow(this._delta, 0.9);
                this._delta = (this._delta + 0.05);
                _local_3 = ((this._scale < 48) ? -30 : -40);
                k.offsetY = (this._offsetY + (((this._delta < 1) ? _local_2 : 1) * _local_3));
                k.alpha = ((1 - _local_2) * 0xFF);
                if (k.alpha <= 0)
                {
                    k.visible = false;
                    this._state = STATE_COMPLETE;
                }
                return true;
            }
            return false;
        }

        override public function update(k:IRoomObjectSprite, _arg_2:Number):void
        {
            var _local_3:int;
            var _local_5:Number;
            if (!k)
            {
                return;
            }
            this._scale = _arg_2;
            var _local_4:int = 64;
            if (_arg_2 < 48)
            {
                this._asset = (_Str_1070.getAvatarRendererAsset("user_blowkiss_small_png") as BitmapDataAsset);
                if (((_Str_1070.angle == 90) || (_Str_1070.angle == 270)))
                {
                    _local_3 = 0;
                }
                else
                {
                    if ((((_Str_1070.angle == 135) || (_Str_1070.angle == 180)) || (_Str_1070.angle == 225)))
                    {
                        _local_3 = 6;
                    }
                    else
                    {
                        _local_3 = -6;
                    }
                }
                this._offsetY = -38;
                _local_4 = 32;
            }
            else
            {
                this._asset = (_Str_1070.getAvatarRendererAsset("user_blowkiss_png") as BitmapDataAsset);
                if (((_Str_1070.angle == 90) || (_Str_1070.angle == 270)))
                {
                    _local_3 = -3;
                }
                else
                {
                    if ((((_Str_1070.angle == 135) || (_Str_1070.angle == 180)) || (_Str_1070.angle == 225)))
                    {
                        _local_3 = 22;
                    }
                    else
                    {
                        _local_3 = -30;
                    }
                }
                this._offsetY = -70;
            }
            if (_Str_1070.posture == "sit")
            {
                this._offsetY = (this._offsetY + (_local_4 / 2));
            }
            else
            {
                if (_Str_1070.posture == "lay")
                {
                    this._offsetY = (this._offsetY + _local_4);
                }
            }
            if (this._asset != null)
            {
                k.asset = (this._asset.content as BitmapData);
                k.offsetX = _local_3;
                k.offsetY = this._offsetY;
                k.relativeDepth = -0.02;
                k.alpha = 0;
                _local_5 = this._delta;
                this.animate(k);
                this._delta = _local_5;
            }
        }
    }
}
