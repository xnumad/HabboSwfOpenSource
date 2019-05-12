package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window.IWindowContainer;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;
    import com.sulake.core.window.enum.PivotPoint;

    public class SpiralMovingBackgroundObject extends _Str_3317 
    {
        private var _startRadius:int;
        private var _startAngle:int;
        private var _posRadius:Number;
        private var _posAngle:Number;
        private var _speedRadius:Number;
        private var _speedAngle:Number;
        private var _centerX:Number;
        private var _centerY:Number;

        public function SpiralMovingBackgroundObject(k:int, _arg_2:IWindowContainer, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5);
            var _local_6:Array = _arg_5.split(";");
            var _local_7:String = _local_6[0];
            this._startRadius = int(_local_6[2]);
            this._startAngle = int(_local_6[3]);
            this._speedRadius = Number(_local_6[4]);
            this._speedAngle = Number(_local_6[5]);
            this._centerX = Number(_local_6[6]);
            this._centerY = Number(_local_6[7]);
            this._posRadius = this._startRadius;
            this._posAngle = this._startAngle;
            sprite.assetUri = (("${image.library.url}reception/" + _local_7) + ".png");
        }

        override public function update(k:uint):void
        {
            super.update(k);
            var _local_2:Number = (this._startRadius / this._posRadius);
            var _local_3:Number = (1 + ((this._startRadius / this._posRadius) / 8));
            this._posRadius = (this._posRadius + (k * this._speedRadius));
            this._posAngle = (this._posAngle + ((k * this._speedAngle) * _local_2));
            if (sprite.bitmapData)
            {
                if (this._posRadius <= 0)
                {
                    this._posRadius = this._startRadius;
                    sprite.width = sprite.bitmapData.width;
                    sprite.height = sprite.bitmapData.height;
                    events.dispatchEvent(new PathResetEvent(PathResetEvent.LWMOPRE_MOVING_OBJECT_PATH_RESET, id));
                }
            }
            if (this._posRadius > this._startRadius)
            {
                this._posRadius = 0;
                sprite.width = 0;
                sprite.height = 0;
                events.dispatchEvent(new PathResetEvent(PathResetEvent.LWMOPRE_MOVING_OBJECT_PATH_RESET, id));
            }
            if (this._posAngle < 0)
            {
                this._posAngle = (Math.PI * 2);
            }
            if (this._posAngle > (Math.PI * 2))
            {
                this._posAngle = 0;
            }
            sprite.x = (this._centerX + (Math.sin(this._posAngle) * this._posRadius));
            sprite.y = (this._centerY + (Math.cos(this._posAngle) * this._posRadius));
            if (sprite.bitmapData)
            {
                sprite.pivotPoint = PivotPoint.CENTER;
                sprite.stretchedX = true;
                sprite.stretchedY = true;
                sprite.width = (sprite.bitmapData.width / _local_3);
                sprite.height = (sprite.bitmapData.height / _local_3);
            }
        }
    }
}
