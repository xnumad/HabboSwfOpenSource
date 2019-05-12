package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.events.TimerEvent;

    public class FriendListIcon extends Icon 
    {
        private static const _Str_14569:int = 200;
        private static const _Str_6576:int = 500;

        private var _assets:IAssetLibrary;

        public function FriendListIcon(k:IAssetLibrary, _arg_2:IBitmapWrapperWindow)
        {
            this._assets = k;
            alignment = (_Str_8982 | _Str_8656);
            image = (k.getAssetByName("icon_friendlist_png") as BitmapDataAsset);
            canvas = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._assets = null;
                super.dispose();
            }
        }

        override public function notify(k:Boolean):void
        {
            super.notify(k);
            this.enable(k);
            _Str_7231(((k) || (_hover)), ((_hover) ? _Str_14569 : _Str_6576));
            if (((!(_Str_5470)) && (!(_hover))))
            {
                image = (this._assets.getAssetByName("icon_friendlist_png") as BitmapDataAsset);
            }
        }

        override public function hover(k:Boolean):void
        {
            super.hover(k);
            _Str_7231(((k) || (_Str_5470)), ((_hover) ? _Str_14569 : _Str_6576));
            if (((!(_Str_5470)) && (!(_hover))))
            {
                image = (this._assets.getAssetByName("icon_friendlist_png") as BitmapDataAsset);
            }
        }

        override public function enable(k:Boolean):void
        {
            canvas.blend = ((disabled) ? 0.5 : 1);
        }

        override protected function onTimerEvent(k:TimerEvent):void
        {
            if (_hover)
            {
                _frame = (++_frame % 4);
                image = (this._assets.getAssetByName((("icon_friendlist_hover_" + _frame) + "_png")) as BitmapDataAsset);
            }
            else
            {
                if (_Str_5470)
                {
                    _frame = (++_frame % 2);
                    image = (this._assets.getAssetByName((("icon_friendlist_notify_" + _frame) + "_png")) as BitmapDataAsset);
                }
            }
        }
    }
}
