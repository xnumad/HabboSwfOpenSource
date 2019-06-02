package com.sulake.habbo.ui.widget.uihelpbubbles
{
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Point;
    import com.sulake.core.window.components.IBubbleWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.ITextFieldWindow;

    public class _Str_4171 
    {
        private var _window:IWindowContainer;
        private var _Str_2268:UiHelpBubblesWidget;
        private var _id:String;
        private var _Str_6304:Point;
        private var _Str_19278:String;
        private var _Str_13653:Boolean;
        private var _Str_3495:IBubbleWindow;
        private var _Str_12172:IButtonWindow;
        private var _Str_2757:IWindowContainer;
        private var _Str_20666:Boolean;
        private var _Str_12235:IBitmapWrapperWindow;
        private var _Str_15322:IWindow;
        private var _Str_21983:IWindow;
        private var _Str_4383:Function;

        public function _Str_4171(k:UiHelpBubblesWidget, _arg_2:_Str_5419, _arg_3:Boolean)
        {
            this._Str_2268 = k;
            this._id = _arg_2.name;
            this._Str_19278 = _arg_2.text;
            this._Str_13653 = _arg_3;
            this._Str_20666 = _arg_2._Str_16803;
            this.createWindow();
        }

        public function dispose():void
        {
            this._Str_2268 = null;
            if (((!(this._Str_15322 == null)) && (!(this._Str_4383 == null))))
            {
                this._Str_15322.removeEventListener(WindowMouseEvent.CLICK, this._Str_4383);
            }
            if (this._Str_2757)
            {
                this._Str_2757.dispose();
                this._Str_2757 = null;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_2786(k:IWindow, _arg_2:Function):void
        {
            if (k != null)
            {
                k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        private function createWindow():void
        {
            var _local_3:XmlAsset;
            var _local_4:int;
            if ((((!(this._Str_2268)) || (!(this._Str_2268.assets))) || (!(this._Str_2268.windowManager))))
            {
                return;
            }
            if (this._Str_20666)
            {
                _local_3 = (this._Str_2268.assets.getAssetByName("ui_help_modal") as XmlAsset);
                this._Str_2757 = (this._Str_2268.windowManager.buildFromXML((_local_3.content as XML), 3) as IWindowContainer);
            }
            if (this._Str_2757)
            {
                this._Str_2757.width = this._Str_2757.desktop.width;
                this._Str_2757.height = this._Str_2757.desktop.height;
                this._Str_12235 = (this._Str_2757.findChildByName("bitmap") as IBitmapWrapperWindow);
                this._Str_2786(this._Str_12235, this._Str_25803);
            }
            var k:XmlAsset = (this._Str_2268.assets.getAssetByName("ui_help_bubble") as XmlAsset);
            if (!k)
            {
                return;
            }
            this._window = (this._Str_2268.windowManager.buildFromXML((k.content as XML), 3) as IWindowContainer);
            if (!this._window)
            {
                return;
            }
            this._Str_12172 = (this._window.findChildByName("help_bubble_btn_ok") as IButtonWindow);
            this._Str_3495 = (this._window.findChildByName("bubble") as IBubbleWindow);
            var _local_2:ITextWindow = (this._window.findChildByName("help_bubble_text") as ITextWindow);
            if (_local_2)
            {
                _local_2.text = this._Str_19278;
                _local_4 = _local_2.textHeight;
                this._window.height = (_local_4 + 90);
                this._Str_12172.y = (_local_4 + 30);
            }
            if (!this._Str_13653)
            {
                this._Str_12172.caption = this._Str_2268.localizations.getLocalization("alert.close.button", "alert.close.button");
                this._Str_2786(this._Str_12172, this._Str_16126);
            }
            else
            {
                this._Str_2786(this._Str_12172, this._Str_17704);
            }
            this._window.visible = true;
        }

        public function show():void
        {
            if (this._window != null)
            {
                this._window.visible = true;
                this._window.activate();
            }
        }

        private function _Str_25803(k:WindowMouseEvent):void
        {
            this._Str_2757.deactivate();
            this._window.activate();
        }

        private function _Str_17704(k:WindowMouseEvent):void
        {
            if (!this._Str_2268)
            {
                return;
            }
            if (this._Str_2757)
            {
                this._Str_2757.visible = false;
            }
            this._Str_2268._Str_14683(this._id);
        }

        private function _Str_16126(k:WindowMouseEvent):void
        {
            if (!this._Str_2268)
            {
                return;
            }
            this._Str_2268._Str_25030();
            if (this._Str_2757)
            {
                this._Str_2757.visible = false;
            }
            this._Str_2268._Str_14683(this._id);
        }

        public function _Str_21122(k:Rectangle):void
        {
            if (!this._Str_12235)
            {
                return;
            }
            var _local_2:BitmapData = new BitmapData(this._Str_2757.width, this._Str_2757.height, true, 0xFFE00000);
            var _local_3:BitmapData = new BitmapData(k.width, k.height, true, 0xFFFFFF);
            _local_2.copyPixels(_local_3, _local_3.rect, new Point(k.x, k.y));
            this._Str_12235.bitmap = _local_2;
            this._Str_12235.invalidate();
        }

        public function _Str_19842(k:Point):void
        {
            this._Str_6304 = k;
            this._window.y = this._Str_6304.y;
            this._window.x = (this._Str_6304.x - (this._window.width / 2));
        }

        public function _Str_11739(k:String, _arg_2:int):void
        {
            this._Str_3495.direction = k;
            this._Str_3495._Str_8006 = (_arg_2 - 8);
        }

        public function _Str_16079(k:IWindow):void
        {
            if (this._Str_4383 != null)
            {
                return;
            }
            this._Str_15322 = k;
            if (!this._Str_13653)
            {
                this._Str_4383 = this._Str_16126;
            }
            else
            {
                this._Str_4383 = this._Str_17704;
            }
            this._Str_15322.addEventListener(WindowMouseEvent.CLICK, this._Str_4383);
        }

        public function _Str_22662(k:ITextFieldWindow):void
        {
            if (this._Str_4383 != null)
            {
                return;
            }
            this._Str_21983 = k;
            if (!this._Str_13653)
            {
                this._Str_4383 = this._Str_16126;
            }
            else
            {
                this._Str_4383 = this._Str_17704;
            }
            this._Str_21983.addEventListener(WindowMouseEvent.CLICK, this._Str_4383);
        }

        public function _Str_5493():IWindowContainer
        {
            return this._window;
        }

        public function getName():String
        {
            return this._id;
        }
    }
}
