package com.sulake.habbo.toolbar.extensions._Str_402
{
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class _Str_6491 
    {
        private var _window:IWindowContainer;
        private var _Str_3499:_Str_4019;
        private var _Str_3471:_Str_4019;
        private var _Str_3474:_Str_4019;
        private var _Str_4165:BitmapData;
        private var _Str_4181:BitmapData;
        private var _Str_4163:BitmapData;
        private var _Str_4116:BitmapData;
        private var _Str_3050:Number = 1;
        private var _Str_2909:Number = 1;
        private var _Str_2933:Number = 1;
        private var _habboToolbar:HabboToolbar;

        public function _Str_6491(k:HabboToolbar)
        {
            this._habboToolbar = k;
            this.createWindow();
        }

        public function dispose():void
        {
            this.saveVolume(this._Str_3050, this._Str_2909, this._Str_2933);
            if (this._window != null)
            {
                this._window.dispose();
            }
            this._window = null;
            if (this._Str_3499 != null)
            {
                this._Str_3499.dispose();
            }
            this._Str_3499 = null;
            if (this._Str_3471 != null)
            {
                this._Str_3471.dispose();
            }
            this._Str_3471 = null;
            if (this._Str_3474 != null)
            {
                this._Str_3474.dispose();
            }
            this._Str_3474 = null;
            if (this._Str_4165)
            {
                this._Str_4165.dispose();
                this._Str_4165 = null;
            }
            if (this._Str_4181)
            {
                this._Str_4181.dispose();
                this._Str_4181 = null;
            }
            if (this._Str_4163)
            {
                this._Str_4163.dispose();
                this._Str_4163 = null;
            }
            if (this._Str_4116)
            {
                this._Str_4116.dispose();
                this._Str_4116 = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function _Str_7269():void
        {
            this._Str_3050 = this._habboToolbar._Str_2476._Str_3960;
            this._Str_2909 = this._habboToolbar._Str_2476._Str_3488;
            this._Str_2933 = this._habboToolbar._Str_2476._Str_3410;
            if (this._Str_3499 != null)
            {
                this._Str_3499._Str_2526(this._Str_3050);
            }
            if (this._Str_3471 != null)
            {
                this._Str_3471._Str_2526(this._Str_2909);
            }
            if (this._Str_3474 != null)
            {
                this._Str_3474._Str_2526(this._Str_2933);
            }
        }

        private function createWindow():void
        {
            var _local_2:IWindow;
            var k:XmlAsset = (this._habboToolbar.assets.getAssetByName("me_menu_sound_settings_xml") as XmlAsset);
            this._window = (this._habboToolbar.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            var _local_3:int;
            while (_local_3 < this._window.numChildren)
            {
                _local_2 = this._window.getChildAt(_local_3);
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                _local_3++;
            }
            this._Str_3499 = new _Str_4019(this, _Str_4019._Str_4200, this._Str_10739);
            this._Str_3471 = new _Str_4019(this, _Str_4019._Str_4322, this._Str_12386);
            this._Str_3474 = new _Str_4019(this, _Str_4019._Str_4191, this._Str_12408);
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
                    this.dispose();
                    return;
                default:
                    Logger.log(("Me Menu Settings View: unknown button: " + _local_3));
            }
        }

        public function saveVolume(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Boolean=true):void
        {
            var _local_5:Number = ((_arg_2 != -1) ? _arg_2 : this._Str_2909);
            var _local_6:Number = ((k != -1) ? k : this._Str_3050);
            var _local_7:Number = ((_arg_3 != -1) ? _arg_3 : this._Str_2933);
            if (_arg_4)
            {
                if (this._habboToolbar == null)
                {
                    return;
                }
                this._habboToolbar._Str_2476._Str_3488 = _local_5;
                this._habboToolbar._Str_2476._Str_3960 = _local_6;
                this._habboToolbar._Str_2476._Str_3410 = _local_7;
            }
            else
            {
                this._habboToolbar._Str_2476._Str_15711(_local_6, _local_5, _local_7);
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
            return this._Str_4165;
        }

        public function get _Str_14044():BitmapData
        {
            return this._Str_4181;
        }

        public function get _Str_13595():BitmapData
        {
            return this._Str_4163;
        }

        public function get _Str_15177():BitmapData
        {
            return this._Str_4116;
        }

        public function get toolbar():HabboToolbar
        {
            return this._habboToolbar;
        }
    }
}

