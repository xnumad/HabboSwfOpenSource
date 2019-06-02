package com.sulake.habbo.room.object.visualization.avatar.additions
{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.room.object.enum.AlphaTolerance;

    public class GameClickTarget implements IAvatarAddition 
    {
        private static const WIDTH:int = 46;
        private static const HEIGHT:int = 60;
        private static const OFFSET_X:int = -23;
        private static const OFFSET_Y:int = -48;

        private var _id:int = -1;
        private var _bitmap:BitmapData;
        private var _disposed:Boolean;

        public function GameClickTarget(k:int)
        {
            this._id = k;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._bitmap = null;
                this._disposed = true;
            }
        }

        public function animate(k:IRoomObjectSprite):Boolean
        {
            return false;
        }

        public function update(k:IRoomObjectSprite, _arg_2:Number):void
        {
            if (!k)
            {
                return;
            }
            if (!this._bitmap)
            {
                this._bitmap = new BitmapData(WIDTH, HEIGHT, true, 0);
            }
            k.visible = true;
            k.asset = this._bitmap;
            k.offsetX = OFFSET_X;
            k.offsetY = OFFSET_Y;
            k._Str_4023 = AlphaTolerance.MATCH_ALL_PIXELS;
        }
    }
}
