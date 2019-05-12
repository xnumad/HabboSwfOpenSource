package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window.IWindowContainer;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;

    public class LinearMovingBackgroundObject extends _Str_3317 
    {
        private var _startX:int;
        private var _startY:int;
        private var _posX:Number;
        private var _posY:Number;
        private var _speedX:Number;
        private var _speedY:Number;

        public function LinearMovingBackgroundObject(k:int, _arg_2:IWindowContainer, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5);
            var _local_6:Array = _arg_5.split(";");
            var _local_7:String = _local_6[0];
            this._startX = int(_local_6[2]);
            this._startY = int(_local_6[3]);
            this._speedX = Number(_local_6[4]);
            this._speedY = Number(_local_6[5]);
            this._posX = this._startX;
            this._posY = this._startY;
            sprite.assetUri = (("${image.library.url}reception/" + _local_7) + ".png");
        }

        override public function update(k:uint):void
        {
            super.update(k);
            if (!sprite)
            {
                return;
            }
            var _local_2:int = window.width;
            var _local_3:int = window.height;
            this._posX = (this._posX + (k * this._speedX));
            this._posY = (this._posY + (k * this._speedY));
            sprite.x = this._posX;
            sprite.y = (this._posY + window.desktop.height);
            if ((((((this._speedX > 0) && (sprite.x > _local_2)) || ((this._speedX < 0) && ((sprite.x + sprite.width) < 0))) || ((this._speedY > 0) && (sprite.y > _local_3))) || ((this._speedY < 0) && ((sprite.y + sprite.height) < 0))))
            {
                this._posX = this._startX;
                this._posY = this._startY;
                events.dispatchEvent(new PathResetEvent(PathResetEvent.LWMOPRE_MOVING_OBJECT_PATH_RESET, id));
            }
        }
    }
}
