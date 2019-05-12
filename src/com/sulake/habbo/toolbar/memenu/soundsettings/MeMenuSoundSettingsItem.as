package com.sulake.habbo.toolbar.memenu.soundsettings
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class MeMenuSoundSettingsItem implements IDisposable 
    {
        public static const _Str_4200:int = 0;
        public static const _Str_4322:int = 1;
        public static const _Str_4191:int = 2;

        private var _type:int;
        private var _volume:Number;
        private var _window:IWindowContainer;
        private var _slider:MeMenuSoundSettingsSlider;
        private var _meMenuSoundSettingsView:MeMenuSoundSettingsView;

        public function MeMenuSoundSettingsItem(k:MeMenuSoundSettingsView, _arg_2:int, _arg_3:IWindowContainer):void
        {
            var _local_4:IWindow;
            super();
            this._type = _arg_2;
            this._meMenuSoundSettingsView = k;
            this._window = _arg_3;
            this._slider = new MeMenuSoundSettingsSlider(this, (this._window.findChildByName("volume_container") as IWindowContainer), this._meMenuSoundSettingsView.widget.toolbar.assets, 0, 1);
            _local_4 = this._window.findChildByName("sounds_off");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            _local_4 = this._window.findChildByName("sounds_on");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            this._Str_5039();
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._slider)
                {
                    this._slider.dispose();
                    this._slider = null;
                }
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._meMenuSoundSettingsView == null;
        }

        public function saveVolume(k:Number, _arg_2:Boolean):void
        {
            this._volume = k;
            switch (this._type)
            {
                case _Str_4200:
                    this._meMenuSoundSettingsView.saveVolume(k, -1, -1, _arg_2);
                    break;
                case _Str_4322:
                    this._meMenuSoundSettingsView.saveVolume(-1, k, -1, _arg_2);
                    break;
                case _Str_4191:
                    this._meMenuSoundSettingsView.saveVolume(-1, -1, k, _arg_2);
                    break;
            }
            this._Str_5039();
            this._meMenuSoundSettingsView._Str_7269();
        }

        private function _Str_5039():void
        {
            if (this._volume == 0)
            {
                this._Str_3209("sounds_on_icon", "sounds_on_white");
                this._Str_3209("sounds_off_icon", "sounds_off_color");
            }
            else
            {
                this._Str_3209("sounds_on_icon", "sounds_on_color");
                this._Str_3209("sounds_off_icon", "sounds_off_white");
            }
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "sounds_off":
                    this.saveVolume(0, false);
                    return;
                case "sounds_on":
                    this.saveVolume(1, false);
                    return;
                default:
                    Logger.log(("Me Menu Settings, Sound settings item: unknown button: " + _local_3));
            }
        }

        private function _Str_3209(k:String, _arg_2:String):void
        {
            IStaticBitmapWrapperWindow(this._window.findChildByName(k)).assetUri = ("toolbar_memenu_settings_" + _arg_2);
        }

        public function _Str_2526(k:Number):void
        {
            this._slider.setValue(k);
            this._Str_5039();
        }
    }
}
