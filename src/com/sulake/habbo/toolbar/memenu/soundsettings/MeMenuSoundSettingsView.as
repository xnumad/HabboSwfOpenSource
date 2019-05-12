package com.sulake.habbo.toolbar.memenu.soundsettings
{
    import com.sulake.habbo.toolbar.memenu.MeMenuSettingsMenuView;
    import com.sulake.core.window.IWindowContainer;
	import com.sulake.habbo.toolbar.memenu.soundsettings.MeMenuSoundSettingsItem;
    import flash.display.BitmapData;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.toolbar.memenu.MeMenuNewController;

    public class MeMenuSoundSettingsView 
    {
        private var _widget:MeMenuSettingsMenuView;
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
        private var _toolbarView:ToolbarView;


        public function init(k:MeMenuSettingsMenuView, _arg_2:ToolbarView):void
        {
            this._toolbarView = _arg_2;
            this._widget = k;
            this.createWindow();
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

        public function _Str_7269():void
        {
            this._genericVolume = this._widget.widget.toolbar._Str_2476._Str_3960;
            this._furniVolume = this._widget.widget.toolbar._Str_2476._Str_3488;
            this._traxVolume = this._widget.widget.toolbar._Str_2476._Str_3410;
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

        private function createWindow():void
        {
            var _local_2:IWindow;
            var k:XmlAsset = (this._widget.widget.toolbar.assets.getAssetByName("me_menu_sound_settings_xml") as XmlAsset);
            this._window = (this._widget.widget.toolbar.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            this._window.x = (this._toolbarView.window.width + 10);
            this._window.y = (this._toolbarView.window.bottom - this._window.height);
            var _local_3:int;
            while (_local_3 < this._window.numChildren)
            {
                _local_2 = this._window.getChildAt(_local_3);
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_3++;
            }
            this._uiSoundsSettings = new MeMenuSoundSettingsItem(this, MeMenuSoundSettingsItem._Str_4200, this._Str_10739);
            this._furniSoundsSettings = new MeMenuSoundSettingsItem(this, MeMenuSoundSettingsItem._Str_4322, this._Str_12386);
            this._traxSoundsSettings = new MeMenuSoundSettingsItem(this, MeMenuSoundSettingsItem._Str_4191, this._Str_12408);
            this._Str_7269();
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            Logger.log(_local_3);
            switch (_local_3)
            {
                case "back_btn":
                    this._widget.window.visible = true;
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
                if (this._widget == null)
                {
                    return;
                }
                this._widget.widget.toolbar._Str_2476._Str_3488 = _local_5;
                this._widget.widget.toolbar._Str_2476._Str_3960 = _local_6;
                this._widget.widget.toolbar._Str_2476._Str_3410 = _local_7;
            }
            else
            {
                this._widget.widget.toolbar._Str_2476._Str_15711(_local_6, _local_5, _local_7);
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

        public function get widget():MeMenuNewController
        {
            return this._widget.widget;
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

