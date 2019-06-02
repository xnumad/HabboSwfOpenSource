package com.sulake.habbo.ui.widget.furniture.dimmer
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITabButtonWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import com.sulake.core.window.enum.WindowParam;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Point;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.assets.XmlAsset;

    public class DimmerView 
    {
        private static const _Str_4126:Number = 100;
        private static const _Str_4162:Number = 100;

        private var _window:IWindowContainer;
        private var _tabContext:ITabContextWindow;
        private var _windowXML:XML;
        private var _widget:DimmerFurniWidget;
        private var _colorGrid:DimmerViewColorGrid;
        private var _alphaSlider:DimmerViewAlphaSlider;
        private var _selectedBrightness:int;
        private var _selectedColorIndex:int;
        private var _selectedType:int;

        public function DimmerView(k:DimmerFurniWidget)
        {
            this._widget = k;
        }

        public function get _Str_7404():int
        {
            return this._selectedBrightness;
        }

        public function get _Str_4246():int
        {
            return this._selectedColorIndex;
        }

        public function get _Str_7660():int
        {
            return this._selectedType;
        }

        public function dispose():void
        {
            this._Str_2718();
            this._widget = null;
        }

        public function _Str_3030():void
        {
            if (this._window == null)
            {
                this.createWindow();
            }
            this._Str_19341(this._widget._Str_13894);
            this.update();
        }

        public function update():void
        {
            var _local_3:String;
            if (((this._window == null) || (this._widget == null)))
            {
                return;
            }
            var k:* = (this._widget._Str_22519 == 1);
            var _local_2:IWindow = this._window.findChildByName("on_off_button");
            if (_local_2 != null)
            {
                _local_3 = ((k) ? "${widget.dimmer.button.off}" : "${widget.dimmer.button.on}");
                _local_2.caption = _local_3;
            }
            _local_2 = this._window.findChildByName("tabbedview");
            if (_local_2 != null)
            {
                _local_2.visible = k;
            }
            _local_2 = this._window.findChildByName("apply_button");
            if (_local_2 != null)
            {
                if (k)
                {
                    _local_2.enable();
                }
                else
                {
                    _local_2.disable();
                }
            }
            _local_2 = this._window.findChildByName("off_border");
            if (_local_2)
            {
                _local_2.visible = (!(k));
            }
        }

        public function _Str_2718():void
        {
            if (this._widget != null)
            {
                this._widget._Str_23566();
            }
            if (this._colorGrid != null)
            {
                this._colorGrid.dispose();
                this._colorGrid = null;
            }
            if (this._alphaSlider != null)
            {
                this._alphaSlider.dispose();
                this._alphaSlider = null;
            }
            this._tabContext = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function createWindow():void
        {
            var k:IWindow;
            var _local_5:IWindow;
            var _local_6:ITabButtonWindow;
            var _local_7:BitmapData;
            if ((((this._widget == null) || (this._widget.windowManager == null)) || (this._Str_21491 == null)))
            {
                return;
            }
            this._window = (this._widget.windowManager.createWindow("dimmerui_container", "", WindowType.WINDOW_TYPE_CONTAINER, _Str_3108.DEFAULT, (WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(_Str_4126, _Str_4162, 2, 2), null, 0) as IWindowContainer);
            this._window.buildFromXML(this._Str_21491);
            k = this._window.findChildByTag("close");
            if (k != null)
            {
                k.procedure = this._Str_3046;
            }
            k = this._window.findChildByName("color_grid_container");
            if (k != null)
            {
                _local_5 = (k as IWindowContainer).findChildByName("color_grid");
                if (_local_5 != null)
                {
                    this._colorGrid = new DimmerViewColorGrid(this, (_local_5 as IItemGridWindow), this._widget.windowManager, this._widget.assets);
                }
            }
            k = this._window.findChildByName("brightness_container");
            if (k != null)
            {
                this._alphaSlider = new DimmerViewAlphaSlider(this, (k as IWindowContainer), this._widget.assets);
            }
            this._tabContext = ITabContextWindow(this._window.findChildByName("tab_context"));
            this._Str_8513(this._widget._Str_13894);
            var _local_2:int;
            while (_local_2 < this._tabContext._Str_4277)
            {
                _local_6 = this._tabContext._Str_3363(_local_2);
                _local_6.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
                _local_6.procedure = this._Str_16089;
                _local_2++;
            }
            k = this._window.findChildByName("type_checkbox");
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            k = this._window.findChildByName("apply_button");
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            k = this._window.findChildByName("on_off_button");
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName("off_image") as IBitmapWrapperWindow);
            var _local_4:BitmapDataAsset = (this._widget.assets.getAssetByName("dimmer_info") as BitmapDataAsset);
            if (((!(_local_3 == null)) && (!(_local_4 == null))))
            {
                _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height);
                _local_7 = (_local_4.content as BitmapData);
                if (_local_7 != null)
                {
                    _local_3.bitmap.copyPixels(_local_7, _local_7.rect, new Point(0, 0));
                }
            }
        }

        private function _Str_3132(k:WindowMouseEvent):void
        {
            var _local_4:ICheckBoxWindow;
            var _local_2:IWindow = (k.target as IWindow);
            var _local_3:String = _local_2.name;
            switch (_local_3)
            {
                case "type_checkbox":
                    _local_4 = (k.target as ICheckBoxWindow);
                    if (_local_4 == null)
                    {
                        return;
                    }
                    if (_local_4._Str_2365)
                    {
                        this._Str_7660 = 2;
                    }
                    else
                    {
                        this._Str_7660 = 1;
                    }
                    this._widget._Str_12547();
                    return;
                case "apply_button":
                    this._widget._Str_19799(true);
                    return;
                case "cancel":
                case "close":
                    this._Str_2718();
                    return;
                case "on_off_button":
                    this._widget._Str_22483();
                    return;
            }
        }

        private function _Str_16089(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowEvent.WINDOW_EVENT_SELECTED)
            {
                return;
            }
            this._widget._Str_19799(false);
            var _local_3:int = _arg_2.id;
            this._Str_19341(_local_3);
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_2718();
        }

        private function _Str_19341(k:int):void
        {
            if (((((this._widget == null) || (this._widget._Str_8447 == null)) || (k < 0)) || (k >= this._widget._Str_8447.length)))
            {
                return;
            }
            this._widget._Str_13894 = k;
            var _local_2:DimmerFurniWidgetPresetItem = this._widget._Str_8447[k];
            if (_local_2 == null)
            {
                return;
            }
            this._Str_8513(k);
            this._selectedBrightness = _local_2._Str_4272;
            if (this._alphaSlider != null)
            {
                this._alphaSlider._Str_2526(this._selectedBrightness);
            }
            this._selectedColorIndex = this.colors.indexOf(_local_2.color);
            if (this._colorGrid != null)
            {
                this._colorGrid._Str_6965(this._selectedColorIndex);
            }
            this._Str_7660 = _local_2.type;
            this._widget._Str_12547();
        }

        private function _Str_8513(k:int):void
        {
            if (this._tabContext == null)
            {
                return;
            }
            var _local_2:IWindow = this._tabContext._Str_3363(k);
            if (_local_2 != null)
            {
                this._tabContext.selector.setSelected((_local_2 as ISelectableWindow));
            }
        }

        private function _Str_26376():int
        {
            if (this._tabContext == null)
            {
                return -1;
            }
            var k:ISelectableWindow = this._tabContext.selector.getSelected();
            return this._tabContext.selector.getSelectableIndex(k);
        }

        private function get _Str_21491():XML
        {
            if (this._windowXML != null)
            {
                return this._windowXML;
            }
            if ((((this._widget == null) || (this._widget.assets == null)) || (this._widget.assets.getAssetByName("dimmer_ui") == null)))
            {
                return null;
            }
            var k:XmlAsset = XmlAsset(this._widget.assets.getAssetByName("dimmer_ui"));
            this._windowXML = XML(k.content);
            return this._windowXML;
        }

        public function get colors():Array
        {
            if (this._widget == null)
            {
                return null;
            }
            return this._widget.colors;
        }

        public function set _Str_7660(k:int):void
        {
            if (((!(k == 1)) && (!(k == 2))))
            {
                return;
            }
            this._selectedType = k;
            var _local_2:ICheckBoxWindow = (this._window.findChildByName("type_checkbox") as ICheckBoxWindow);
            if (_local_2 != null)
            {
                if (k == 2)
                {
                    _local_2.select();
                }
                else
                {
                    _local_2.unselect();
                }
            }
            if (this._alphaSlider != null)
            {
                this._alphaSlider.min = this._widget._Str_23750[(k - 1)];
            }
        }

        public function set _Str_4246(k:int):void
        {
            this._selectedColorIndex = k;
            if (this._colorGrid != null)
            {
                this._colorGrid._Str_6965(k);
            }
            this._widget._Str_12547();
        }

        public function set _Str_7404(k:int):void
        {
            this._selectedBrightness = k;
            if (this._alphaSlider != null)
            {
                this._alphaSlider._Str_2526(k);
            }
            this._widget._Str_12547();
        }
    }
}
