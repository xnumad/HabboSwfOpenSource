package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;
    import com.sulake.core.window.IWindowContainer;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class StaticAnimatedBackgroundObject extends _Str_3317 
    {
        private var _currentMs:uint = 0;
        private var _imageBaseUri:String;
        private var _frameCount:int;
        private var _fps:int;
        private var _posX:int;
        private var _posY:int;
        private var _triggeringObjectIds:Array;
        private var _triggerMs:uint = 0;

        public function StaticAnimatedBackgroundObject(k:int, _arg_2:IWindowContainer, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5);
            var _local_6:Array = _arg_5.split(";");
            this._imageBaseUri = ("${image.library.url}reception/" + _local_6[0]);
            this._frameCount = int(_local_6[2]);
            this._fps = int(_local_6[3]);
            this._posX = int(_local_6[4]);
            this._posY = int(_local_6[5]);
            this._triggeringObjectIds = String(_local_6[6]).split(",");
            _arg_3.addEventListener(PathResetEvent.LWMOPRE_MOVING_OBJECT_PATH_RESET, this._Str_20385);
            sprite.x = this._posX;
            sprite.y = this._posY;
        }

        override public function dispose():void
        {
            events.removeEventListener(PathResetEvent.LWMOPRE_MOVING_OBJECT_PATH_RESET, this._Str_20385);
            super.dispose();
        }

        override public function update(k:uint):void
        {
            super.update(k);
            var _local_2:int = (1000 / this._fps);
            var _local_3:uint = (this._currentMs - this._triggerMs);
            var _local_4:int = (this._frameCount - 1);
            if (this._triggeringObjectIds.length > 0)
            {
                if (_local_3 < (this._frameCount * _local_2))
                {
                    _local_4 = (_local_3 / _local_2);
                }
            }
            else
            {
                _local_4 = (this._currentMs % _local_2);
            }
            sprite.assetUri = ((this._imageBaseUri + (_local_4 + 1)) + ".png");
            this._currentMs = (this._currentMs + k);
        }

        private function _Str_20385(k:PathResetEvent):void
        {
            if (this._triggeringObjectIds.indexOf(k._Str_1577.toString()) != -1)
            {
                this._triggerMs = this._currentMs;
            }
        }
    }
}
