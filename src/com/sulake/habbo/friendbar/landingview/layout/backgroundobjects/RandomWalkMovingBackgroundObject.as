package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window.IWindowContainer;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.utils._Str_988;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;

    public class RandomWalkMovingBackgroundObject extends _Str_3317 
    {
        private var _startX:int;
        private var _startY:int;
        private var _randomX:Number;
        private var _randomY:Number;
        private var _speedX:Number;
        private var _speedY:Number;
        private var _randomTimeSpan:Number;
        private var _timer:uint = 0;
        private var _posX:Number;
        private var _posY:Number;
        private var _nextRandomX:Number = 0;
        private var _nextRandomY:Number = 0;
        private var _currentRandomX:Number = 0;
        private var _currentRandomY:Number = 0;
        private var _lastSample:uint;

        public function RandomWalkMovingBackgroundObject(k:int, _arg_2:IWindowContainer, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
            var _local_6:Array = _arg_5.split(";");
            var _local_7:String = _local_6[0];
            this._startX = int(_local_6[2]);
            this._startY = int(_local_6[3]);
            this._speedX = Number(_local_6[4]);
            this._speedY = Number(_local_6[5]);
            this._randomX = Number(_local_6[6]);
            this._randomY = Number(_local_6[7]);
            this._randomTimeSpan = int(_local_6[8]);
            this._posX = this._startX;
            this._posY = this._startY;
            sprite.assetUri = (("${image.library.url}" + _local_7) + ".png");
        }

        override public function update(k:uint):void
        {
            super.update(k);
            if (!sprite)
            {
                return;
            }
            this._timer = (this._timer + k);
            if ((this._timer - this._lastSample) > this._randomTimeSpan)
            {
                this._currentRandomX = this._nextRandomX;
                this._currentRandomY = this._nextRandomY;
                this._nextRandomX = (((Math.random() * 2) - 1) * this._randomX);
                this._nextRandomY = (((Math.random() * 2) - 1) * this._randomY);
                this._lastSample = this._timer;
            }
            var _local_2:int = window.width;
            var _local_3:int = window.height;
            var _local_4:Number = (Number((this._timer - this._lastSample)) / this._randomTimeSpan);
            this._posX = (this._posX + ((k / 1000) * (this._speedX + _Str_988._Str_1028(_local_4, this._currentRandomX, this._nextRandomX))));
            this._posY = (this._posY + ((k / 1000) * (this._speedY + _Str_988._Str_1028(_local_4, this._currentRandomY, this._nextRandomY))));
            sprite.x = this._posX;
            sprite.y = this._posY;
            if ((((((this._speedX > 0) && (sprite.x > _local_2)) || ((this._speedX < 0) && ((sprite.x + sprite.width) < 0))) || ((this._speedY > 0) && (sprite.y > _local_3))) || ((this._speedY < 0) && ((sprite.y + sprite.height) < 0))))
            {
                this._posX = this._startX;
                this._posY = this._startY;
                events.dispatchEvent(new PathResetEvent(PathResetEvent.LWMOPRE_MOVING_OBJECT_PATH_RESET, id));
            }
        }
    }
}
