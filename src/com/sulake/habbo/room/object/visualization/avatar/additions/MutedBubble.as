package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.habbo.avatar.enum.AvatarAction;

    public class MutedBubble implements IAvatarAddition 
    {
        private var _id:int = -1;
        private var _asset:BitmapDataAsset;
        private var _avatar:AvatarVisualization;
        private var _relativeDepth:Number = 0;

        public function MutedBubble(k:int, _arg_2:AvatarVisualization)
        {
            this._id = k;
            this._avatar = _arg_2;
        }

        public function set relativeDepth(k:Number):void
        {
            this._relativeDepth = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get disposed():Boolean
        {
            return this._avatar == null;
        }

        public function dispose():void
        {
            this._avatar = null;
            this._asset = null;
        }

        public function animate(k:IRoomObjectSprite):Boolean
        {
            if (((this._asset) && (k)))
            {
                k.asset = (this._asset.content as BitmapData);
            }
            return false;
        }

        public function update(k:IRoomObjectSprite, _arg_2:Number):void
        {
            var _local_3:int;
            var _local_4:int;
            if (!k)
            {
                return;
            }
            k.visible = true;
            k.relativeDepth = this._relativeDepth;
            k.alpha = 0xFF;
            var _local_5:int = 64;
            if (_arg_2 < 48)
            {
                this._asset = (this._avatar.getAvatarRendererAsset("user_muted_small_png") as BitmapDataAsset);
                _local_3 = -12;
                _local_4 = -66;
                _local_5 = 32;
            }
            else
            {
                this._asset = (this._avatar.getAvatarRendererAsset("user_muted_png") as BitmapDataAsset);
                _local_3 = -15;
                _local_4 = -110;
            }
            if (this._avatar.posture == AvatarAction.POSTURE_SIT)
            {
                _local_4 = (_local_4 + (_local_5 / 2));
            }
            else
            {
                if (this._avatar.posture == AvatarAction.POSTURE_LAY)
                {
                    _local_4 = (_local_4 + _local_5);
                }
            }
            if (this._asset != null)
            {
                k.asset = (this._asset.content as BitmapData);
                k.offsetX = _local_3;
                k.offsetY = _local_4;
                k.relativeDepth = (-0.02 + 0);
            }
        }
    }
}
