package com.sulake.habbo.toolbar.extensions.settings
{
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class SoundSettingsView 
    {
        private var _window:IWindowContainer;
        private var _uiSoundsSettings:SoundSettingsItem;
        private var _furniSoundsSettings:SoundSettingsItem;
        private var _traxSoundsSettings:SoundSettingsItem;
        private var _soundsOffIconColor:BitmapData;
        private var _soundsOffIconWhite:BitmapData;
        private var _soundsOnIconColor:BitmapData;
        private var _soundsOnIconWhite:BitmapData;
        private var _genericVolume:Number = 1;
        private var _furniVolume:Number = 1;
        private var _traxVolume:Number = 1;
        private var _toolbar:HabboToolbar;

        public function SoundSettingsView(k:HabboToolbar)
        {
            this._toolbar = k;
            this.createWindow();
        }

        public function dispose():void
        {
            this.saveVolume(this._genericVolume, this._furniVolume, this._traxVolume);
            if (this._window != null)
            {
                this._window.dispose();
            }
            this._window = null;
            if (this._uiSoundsSettings != null)
            {
                this._uiSoundsSettings.dispose();
            }
            this._uiSoundsSettings = null;
            if (this._furniSoundsSettings != null)
            {
                this._furniSoundsSettings.dispose();
            }
            this._furniSoundsSettings = null;
            if (this._traxSoundsSettings != null)
            {
                this._traxSoundsSettings.dispose();
            }
            this._traxSoundsSettings = null;
            if (this._soundsOffIconColor)
            {
                this._soundsOffIconColor.dispose();
                this._soundsOffIconColor = null;
            }
            if (this._soundsOffIconWhite)
            {
                this._soundsOffIconWhite.dispose();
                this._soundsOffIconWhite = null;
            }
            if (this._soundsOnIconColor)
            {
                this._soundsOnIconColor.dispose();
                this._soundsOnIconColor = null;
            }
            if (this._soundsOnIconWhite)
            {
                this._soundsOnIconWhite.dispose();
                this._soundsOnIconWhite = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function _Str_7269():void
        {
            this._genericVolume = this._toolbar._Str_2476._Str_3960;
            this._furniVolume = this._toolbar._Str_2476.furniVolume;
            this._traxVolume = this._toolbar._Str_2476.traxVolume;
            if (this._uiSoundsSettings != null)
            {
                this._uiSoundsSettings.setValue(this._genericVolume);
            }
            if (this._furniSoundsSettings != null)
            {
                this._furniSoundsSettings.setValue(this._furniVolume);
            }
            if (this._traxSoundsSettings != null)
            {
                this._traxSoundsSettings.setValue(this._traxVolume);
            }
        }

        private function createWindow():void
        {
            var _local_2:IWindow;
            var k:XmlAsset = (this._toolbar.assets.getAssetByName("me_menu_sound_settings_xml") as XmlAsset);
            this._window = (this._toolbar.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            var _local_3:int;
            while (_local_3 < this._window.numChildren)
            {
                _local_2 = this._window.getChildAt(_local_3);
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onButtonClicked);
                _local_3++;
            }
            this._uiSoundsSettings = new SoundSettingsItem(this, SoundSettingsItem._Str_4200, this._Str_10739);
            this._furniSoundsSettings = new SoundSettingsItem(this, SoundSettingsItem._Str_4322, this._Str_12386);
            this._traxSoundsSettings = new SoundSettingsItem(this, SoundSettingsItem._Str_4191, this._Str_12408);
            this._Str_7269();
        }

        private function onButtonClicked(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            Logger.log(_local_3);
            switch (_local_3)
            {
                case "back_btn":
                    this.dispose();
                    return;
                default:
                    Logger.log(("Me Menu Settings View: unknown button: " + _local_3));
            }
        }

        public function saveVolume(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean=true):void
        {
            var _local_5:Number = ((_arg_2 != -1) ? _arg_2 : this._furniVolume);
            var _local_6:Number = ((k != -1) ? k : this._genericVolume);
            var _local_7:Number = ((_arg_3 != -1) ? _arg_3 : this._traxVolume);
            if (_arg_4)
            {
                if (this._toolbar == null)
                {
                    return;
                }
                this._toolbar._Str_2476.furniVolume = _local_5;
                this._toolbar._Str_2476._Str_3960 = _local_6;
                this._toolbar._Str_2476.traxVolume = _local_7;
            }
            else
            {
                this._toolbar._Str_2476._Str_15711(_local_6, _local_5, _local_7);
            }
        }

        public function _Str_6111(k:String, _arg_2:int):void
        {
        }

        public function get _Str_10739():IWindowContainer
        {
            return this._window.findChildByName("ui_volume_container") as IWindowContainer;
        }

        public function get _Str_12386():IWindowContainer
        {
            return this._window.findChildByName("furni_volume_container") as IWindowContainer;
        }

        public function get _Str_12408():IWindowContainer
        {
            return this._window.findChildByName("trax_volume_container") as IWindowContainer;
        }

        public function get _Str_14098():BitmapData
        {
            return this._soundsOffIconColor;
        }

        public function get _Str_14044():BitmapData
        {
            return this._soundsOffIconWhite;
        }

        public function get _Str_13595():BitmapData
        {
            return this._soundsOnIconColor;
        }

        public function get _Str_15177():BitmapData
        {
            return this._soundsOnIconWhite;
        }

        public function get toolbar():HabboToolbar
        {
            return this._toolbar;
        }
    }
}

