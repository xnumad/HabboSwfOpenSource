package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;

    public class FloatingIdleZ implements IAvatarAddition 
    {
        private static const DELAY_BEFORE_ANIMATION:int = 2000;
        private static const DELAY_PER_FRAME:int = 2000;
        private static const STATE_DELAY:int = 0;
        private static const STATE_FRAME_A:int = 1;
        private static const STATE_FRAME_B:int = 2;

        protected var _id:int;
        protected var _Str_1070:AvatarVisualization;
        private var _asset:BitmapDataAsset;
        private var _startTime:int;
        private var _offsetY:int;
        private var _scale:Number;
        private var _state:int = -1;

        public function FloatingIdleZ(k:int, _arg_2:AvatarVisualization)
        {
            this._id = k;
            this._Str_1070 = _arg_2;
            this._startTime = getTimer();
            this._state = 0;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get disposed():Boolean
        {
            return this._Str_1070 == null;
        }

        public function dispose():void
        {
            this._Str_1070 = null;
            this._asset = null;
        }

        protected function getAssetNameForFrame(k:int):String
        {
            var _local_2:String = "left";
            if (((((this._Str_1070.angle == 135) || (this._Str_1070.angle == 180)) || (this._Str_1070.angle == 225)) || (this._Str_1070.angle == 270)))
            {
                _local_2 = "right";
            }
            return (((("user_idle_" + _local_2) + "_") + k) + ((this._scale < 48) ? "_small" : "")) + "_png";
        }

        public function animate(k:IRoomObjectSprite):Boolean
        {
            if (!k)
            {
                return false;
            }
            if (this._state == STATE_DELAY)
            {
                if ((getTimer() - this._startTime) >= DELAY_BEFORE_ANIMATION)
                {
                    this._state = STATE_FRAME_A;
                    this._startTime = getTimer();
                    this._asset = (this._Str_1070.getAvatarRendererAsset(this.getAssetNameForFrame(1)) as BitmapDataAsset);
                }
            }
            if (this._state == STATE_FRAME_A)
            {
                if ((getTimer() - this._startTime) >= DELAY_PER_FRAME)
                {
                    this._state = STATE_FRAME_B;
                    this._startTime = getTimer();
                    this._asset = (this._Str_1070.getAvatarRendererAsset(this.getAssetNameForFrame(2)) as BitmapDataAsset);
                }
            }
            if (this._state == STATE_FRAME_B)
            {
                if ((getTimer() - this._startTime) >= DELAY_PER_FRAME)
                {
                    this._state = STATE_FRAME_A;
                    this._startTime = getTimer();
                    this._asset = (this._Str_1070.getAvatarRendererAsset(this.getAssetNameForFrame(1)) as BitmapDataAsset);
                }
            }
            if (this._asset)
            {
                k.asset = (this._asset.content as BitmapData);
                k.alpha = 0xFF;
                k.visible = true;
            }
            else
            {
                k.visible = false;
            }
            return false;
        }

        public function update(k:IRoomObjectSprite, _arg_2:Number):void
        {
            var _local_3:int;
            if (!k)
            {
                return;
            }
            this._scale = _arg_2;
            this._asset = (this._Str_1070.getAvatarRendererAsset(this.getAssetNameForFrame(((this._state == STATE_FRAME_A) ? 1 : 2))) as BitmapDataAsset);
            var _local_4:int = 64;
            if (_arg_2 < 48)
            {
                if (((((this._Str_1070.angle == 135) || (this._Str_1070.angle == 180)) || (this._Str_1070.angle == 225)) || (this._Str_1070.angle == 270)))
                {
                    _local_3 = 10;
                }
                else
                {
                    _local_3 = -16;
                }
                this._offsetY = -38;
                _local_4 = 32;
            }
            else
            {
                if (((((this._Str_1070.angle == 135) || (this._Str_1070.angle == 180)) || (this._Str_1070.angle == 225)) || (this._Str_1070.angle == 270)))
                {
                    _local_3 = 22;
                }
                else
                {
                    _local_3 = -30;
                }
                this._offsetY = -70;
            }
            if (this._Str_1070.posture == "sit")
            {
                this._offsetY = (this._offsetY + (_local_4 / 2));
            }
            else
            {
                if (this._Str_1070.posture == "lay")
                {
                    this._offsetY = (this._offsetY + (_local_4 - (0.3 * _local_4)));
                }
            }
            if (this._asset != null)
            {
                k.asset = (this._asset.content as BitmapData);
                k.offsetX = _local_3;
                k.offsetY = this._offsetY;
                k.relativeDepth = -0.02;
                k.alpha = 0;
            }
        }
    }
}
