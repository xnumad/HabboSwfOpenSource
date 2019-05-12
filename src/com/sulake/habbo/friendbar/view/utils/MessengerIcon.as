package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.events.TimerEvent;

    public class MessengerIcon extends Icon 
    {
        private static const _Str_6576:int = 500;

        private var _assets:IAssetLibrary;

        public function MessengerIcon(k:IAssetLibrary, _arg_2:IBitmapWrapperWindow)
        {
            this._assets = k;
            alignment = (_Str_8982 | _Str_8656);
            image = (k.getAssetByName("icon_messenger_png") as BitmapDataAsset);
            canvas = _arg_2;
        }

        override public function notify(k:Boolean):void
        {
            super.notify(k);
            image = (this._assets.getAssetByName(((k) ? "icon_messenger_notify_1_png" : "icon_messenger_png")) as BitmapDataAsset);
            _Str_7231(k, _Str_6576);
        }

        override public function hover(k:Boolean):void
        {
            super.hover(k);
        }

        override public function enable(k:Boolean):void
        {
            super.enable(k);
            canvas.visible = k;
        }

        override protected function onTimerEvent(k:TimerEvent):void
        {
            if (_Str_5470)
            {
                _frame = ((_frame == 1) ? 0 : 1);
                image = (this._assets.getAssetByName((("icon_messenger_notify_" + _frame) + "_png")) as BitmapDataAsset);
            }
        }
    }
}
