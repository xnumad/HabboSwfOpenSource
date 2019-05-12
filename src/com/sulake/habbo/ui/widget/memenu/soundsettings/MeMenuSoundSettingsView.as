package com.sulake.habbo.ui.widget.memenu.soundsettings
{
    import com.sulake.habbo.ui.widget.memenu.IMeMenuView;
    import com.sulake.habbo.ui.widget.memenu.MeMenuWidget;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events._Str_3963;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetSettingsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetStoreSettingsMessage;

    public class MeMenuSoundSettingsView implements IMeMenuView 
    {
        private var _widget:MeMenuWidget;
        private var _window:IWindowContainer;
        private var _uiSoundsSettings:MeMenuSoundSettingsItem;
        private var _furniSoundsSettings:MeMenuSoundSettingsItem;
        private var _traxSoundsSettings:MeMenuSoundSettingsItem;
        private var _soundsOffIconColor:BitmapData;
        private var _soundsOffIconWhite:BitmapData;
        private var _soundsOnIconColor:BitmapData;
        private var _soundsOnIconWhite:BitmapData;
        private var _genericVolume:Number = 1;
        private var _furniVolume:Number = 1;
        private var _traxVolume:Number = 1;


        public function init(k:MeMenuWidget, _arg_2:String):void
        {
            this._widget = k;
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            this.saveVolume(this._genericVolume, this._furniVolume, this._traxVolume);
            this._widget = null;
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

        public function _Str_7269(k:_Str_3963):void
        {
            this._genericVolume = k._Str_16610;
            this._furniVolume = k._Str_3488;
            this._traxVolume = k._Str_3410;
            if (this._uiSoundsSettings != null)
            {
                this._uiSoundsSettings._Str_2526(this._genericVolume);
            }
            if (this._furniSoundsSettings != null)
            {
                this._furniSoundsSettings._Str_2526(this._furniVolume);
            }
            if (this._traxSoundsSettings != null)
            {
                this._traxSoundsSettings._Str_2526(this._traxVolume);
            }
        }

        private function createWindow(k:String):void
        {
            var _local_3:IWindow;
            var _local_5:BitmapDataAsset;
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("memenu_settings") as XmlAsset);
            if (_local_2)
            {
                this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            }
            if (this._window == null)
            {
                throw (new Error("Failed to construct sound settings window from XML!"));
            }
            this._window.name = k;
            var _local_4:int;
            while (_local_4 < this._window.numChildren)
            {
                _local_3 = this._window.getChildAt(_local_4);
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_4++;
            }
            _local_5 = (this._widget.assets.getAssetByName("sounds_off_color") as BitmapDataAsset);
            if (((!(_local_5 == null)) && (!(_local_5.content == null))))
            {
                this._soundsOffIconColor = (_local_5.content as BitmapData).clone();
            }
            _local_5 = (this._widget.assets.getAssetByName("sounds_off_white") as BitmapDataAsset);
            if (((!(_local_5 == null)) && (!(_local_5.content == null))))
            {
                this._soundsOffIconWhite = (_local_5.content as BitmapData).clone();
            }
            _local_5 = (this._widget.assets.getAssetByName("sounds_on_color") as BitmapDataAsset);
            if (((!(_local_5 == null)) && (!(_local_5.content == null))))
            {
                this._soundsOnIconColor = (_local_5.content as BitmapData).clone();
            }
            _local_5 = (this._widget.assets.getAssetByName("sounds_on_white") as BitmapDataAsset);
            if (((!(_local_5 == null)) && (!(_local_5.content == null))))
            {
                this._soundsOnIconWhite = (_local_5.content as BitmapData).clone();
            }
            this._uiSoundsSettings = new MeMenuSoundSettingsItem(this, MeMenuSoundSettingsItem._Str_4200, this._Str_10739);
            this._furniSoundsSettings = new MeMenuSoundSettingsItem(this, MeMenuSoundSettingsItem._Str_4322, this._Str_12386);
            this._traxSoundsSettings = new MeMenuSoundSettingsItem(this, MeMenuSoundSettingsItem._Str_4191, this._Str_12408);
            this._widget.messageListener.processWidgetMessage(new RoomWidgetGetSettingsMessage(RoomWidgetGetSettingsMessage.RWGSM_GET_SETTINGS));
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "back_btn":
                    this._widget._Str_4568(MeMenuWidget.ME_MENU_SETTINGS_VIEW);
                    return;
                default:
                    Logger.log(("Me Menu Settings View: unknown button: " + _local_3));
            }
        }

        public function saveVolume(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean=true):void
        {
            var _local_5:RoomWidgetStoreSettingsMessage;
            if (_arg_4)
            {
                _local_5 = new RoomWidgetStoreSettingsMessage(RoomWidgetStoreSettingsMessage.RWSSM_STORE_SOUND);
            }
            else
            {
                _local_5 = new RoomWidgetStoreSettingsMessage(RoomWidgetStoreSettingsMessage.RWSSM_PREVIEW_SOUND);
            }
            _local_5._Str_3960 = ((k != -1) ? k : this._genericVolume);
            _local_5._Str_3488 = ((_arg_2 != -1) ? _arg_2 : this._furniVolume);
            _local_5._Str_3410 = ((_arg_3 != -1) ? _arg_3 : this._traxVolume);
            this._widget.messageListener.processWidgetMessage(_local_5);
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

        public function get widget():MeMenuWidget
        {
            return this._widget;
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
    }
}
