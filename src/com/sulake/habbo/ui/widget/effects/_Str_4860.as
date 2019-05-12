package com.sulake.habbo.ui.widget.effects
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;

    public class _Str_4860 
    {
        private const _Str_25685:int = 1000;

        private var _Str_2268:EffectsWidget;
        private var _window:IWindowContainer;
        private var _effect:IWidgetAvatarEffect;
        private var _Str_3425:IWindow;
        private var _Str_3701:Number;
        private var _Str_4996:ITextWindow;
        private var _Str_2364:Timer;
        private var _Str_6963:IWindow;

        public function _Str_4860(k:EffectsWidget, _arg_2:IWidgetAvatarEffect)
        {
            this._effect = _arg_2;
            this._Str_2268 = k;
            this._Str_2364 = new Timer(this._Str_25685);
            this._Str_2364.addEventListener(TimerEvent.TIMER, this._Str_5183);
            this.update();
        }

        public function get effect():IWidgetAvatarEffect
        {
            return this._effect;
        }

        public function dispose():void
        {
            if (this._Str_2364 != null)
            {
                this._Str_2364.stop();
                this._Str_2364.removeEventListener(TimerEvent.TIMER, this._Str_5183);
                this._Str_2364 = null;
            }
            this._Str_2268 = null;
            this._effect = null;
            this._Str_3425 = null;
            this._Str_4996 = null;
            this._Str_6963 = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        private function _Str_5183(k:Event=null):void
        {
            var _local_2:Number;
            if (this._Str_3425 == null)
            {
                this._Str_2364.stop();
                return;
            }
            if (this._effect.isActive)
            {
                _local_2 = (this._effect._Str_3709 / Number(this._effect.duration));
                this._Str_3425.width = (_local_2 * this._Str_3701);
            }
            else
            {
                this._Str_3425.width = 0;
                this._Str_2364.stop();
            }
            this.setTimeLeft();
        }

        private function setTimeLeft():void
        {
            var k:String;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            if (this._Str_4996 == null)
            {
                this._Str_4996 = (this._window.findChildByName("time_left") as ITextWindow);
                if (this._Str_4996 == null)
                {
                    return;
                }
            }
            if (!this._effect.isActive)
            {
                this._Str_4996.caption = "${widgets.memenu.effects.activate}";
                return;
            }
            if (this._effect._Str_3709 > ((60 * 60) * 24))
            {
                this._Str_4996.caption = "${widgets.memenu.effects.active.daysleft}";
                k = this._Str_4996.text;
                _local_2 = Math.floor((this._effect._Str_3709 / ((60 * 60) * 24)));
                k = k.replace("%days_left%", _local_2);
            }
            else
            {
                this._Str_4996.caption = "${widgets.memenu.effects.active.timeleft}";
                k = this._Str_4996.text;
                _local_3 = this._effect._Str_3709;
                _local_4 = Math.floor((_local_3 / (60 * 60)));
                _local_5 = (Math.floor((_local_3 / 60)) % 60);
                _local_6 = (_local_3 % 60);
                _local_7 = ((_local_4 < 10) ? "0" : "");
                _local_8 = ((_local_5 < 10) ? "0" : "");
                _local_9 = ((_local_6 < 10) ? "0" : "");
                if (_local_4 > 0)
                {
                    k = k.replace("%time_left%", (((((((_local_7 + _local_4) + ":") + _local_8) + _local_5) + ":") + _local_9) + _local_6));
                }
                else
                {
                    k = k.replace("%time_left%", ((((_local_8 + _local_5) + ":") + _local_9) + _local_6));
                }
            }
            this._Str_4996.text = k;
        }

        public function update():void
        {
            var k:XmlAsset;
            var _local_7:IWindow;
            var _local_8:IButtonWindow;
            if (!this._window)
            {
                this._window = (this._Str_2268.windowManager.createWindow("", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) as IWindowContainer);
            }
            while (this._window.numChildren > 0)
            {
                _local_7 = this._window.removeChildAt(0);
                _local_7.dispose();
            }
            this._Str_3425 = null;
            this._Str_6963 = null;
            this._Str_4996 = null;
            var _local_2:String = "";
            if (this._effect._Str_3222)
            {
                _local_2 = "memenu_effect_selected";
            }
            else
            {
                if (this._effect.isActive)
                {
                    _local_2 = "memenu_effect_unselected";
                }
                else
                {
                    _local_2 = "memenu_effect_inactive";
                }
            }
            k = (this._Str_2268.assets.getAssetByName(_local_2) as XmlAsset);
            var _local_3:IWindowContainer = (this._Str_2268.windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
            this._window.addChild(_local_3);
            var _local_4:ITextWindow = (this._window.findChildByName("effect_name") as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.caption = ((("$" + "{fx_") + this._effect.type) + "}");
            }
            var _local_5:ITextWindow = (this._window.findChildByName("effect_amount") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.caption = (this._effect._Str_4225 + "");
            }
            var _local_6:IWindowContainer = (this._window.findChildByName("effect_amount_bg1") as IWindowContainer);
            if (this._effect._Str_4225 < 2)
            {
                if (_local_6 != null)
                {
                    _local_6.visible = false;
                }
            }
            if (_local_2 == "memenu_effect_inactive")
            {
                _local_8 = (this._window.findChildByName("activate_effect") as IButtonWindow);
                if (_local_8 != null)
                {
                    _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
                }
            }
            else
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
                if (this._effect.isActive)
                {
                    _local_3.addEventListener(WindowMouseEvent.OVER, this._Str_3132);
                    _local_3.addEventListener(WindowMouseEvent.OUT, this._Str_3132);
                }
                if (this._effect._Str_3222)
                {
                    this._Str_2972("effect_hilite", "memenu_fx_pause");
                }
                else
                {
                    this._Str_2972("effect_hilite", "memenu_fx_play");
                }
                this._Str_6963 = this._window.findChildByName("effect_hilite");
                this._Str_6963.visible = false;
            }
            this.setTimeLeft();
            this._Str_3425 = this._window.findChildByName("loader_bar");
            if (this._Str_3425 != null)
            {
                this._Str_3701 = this._Str_3425.width;
                this._Str_2364.start();
                this._Str_5183();
            }
            if (this._effect.icon)
            {
                this._Str_14653("effect_icon", this._effect.icon);
            }
            this._window.rectangle = _local_3.rectangle;
        }

        private function _Str_14653(k:String, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(k) as IBitmapWrapperWindow);
            if (_local_3 != null)
            {
                if (_local_3.bitmap)
                {
                    _local_3.bitmap.dispose();
                }
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0);
                _local_3.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(0, 0));
            }
            else
            {
                Logger.log(("Could not find element: " + k));
            }
        }

        private function _Str_3132(k:WindowMouseEvent):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.OVER:
                    if (this._Str_6963 != null)
                    {
                        this._Str_6963.visible = true;
                    }
                    return;
                case WindowMouseEvent.OUT:
                    if (this._Str_6963 != null)
                    {
                        this._Str_6963.visible = false;
                    }
                    return;
                case WindowMouseEvent.CLICK:
                    this._Str_2268._Str_25077(this._effect.type, this._effect._Str_3222);
                    return;
            }
        }

        private function _Str_2972(k:String, _arg_2:String):void
        {
            var _local_3:BitmapDataAsset = (this._Str_2268.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            this._Str_14653(k, _local_4);
        }
    }
}
