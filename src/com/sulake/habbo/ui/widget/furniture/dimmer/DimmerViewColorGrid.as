package com.sulake.habbo.ui.widget.furniture.dimmer
{
    import com.sulake.core.window.components.IItemGridWindow;
	import com.sulake.habbo.ui.widget.furniture.dimmer.DimmerView;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;

    public class DimmerViewColorGrid 
    {
        private var _gridWindow:IItemGridWindow;
        private var _view:DimmerView;
        private var _colorCellXML:XML;
        private var _colorCellFrame:BitmapData;
        private var _colorCellButton:BitmapData;
        private var _colorCellSelected:BitmapData;
        private var _selectedGridItem:IWindowContainer;

        public function DimmerViewColorGrid(k:DimmerView, _arg_2:IItemGridWindow, _arg_3:IHabboWindowManager, _arg_4:IAssetLibrary)
        {
            this._view = k;
            this._gridWindow = _arg_2;
            this._Str_6048(_arg_4);
            this.populate(_arg_3);
        }

        public function dispose():void
        {
            this._view = null;
            this._gridWindow = null;
            this._colorCellXML = null;
            this._colorCellFrame = null;
            this._colorCellButton = null;
            this._colorCellSelected = null;
        }

        public function _Str_6965(k:int):void
        {
            if (this._gridWindow == null)
            {
                return;
            }
            if (((k < 0) || (k >= this._gridWindow.numGridItems)))
            {
                return;
            }
            this.select((this._gridWindow._Str_2830(k) as IWindowContainer));
        }

        private function populate(k:IHabboWindowManager):void
        {
            if (((this._view == null) || (this._gridWindow == null)))
            {
                return;
            }
            this._Str_14728(k);
        }

        private function select(k:IWindowContainer):void
        {
            var _local_2:IWindow;
            if (this._selectedGridItem != null)
            {
                _local_2 = this._selectedGridItem.getChildByName("chosen");
                if (_local_2 != null)
                {
                    _local_2.visible = false;
                }
            }
            this._selectedGridItem = k;
            _local_2 = this._selectedGridItem.getChildByName("chosen");
            if (_local_2 != null)
            {
                _local_2.visible = true;
            }
        }

        private function _Str_14728(k:IHabboWindowManager):void
        {
            var _local_2:uint;
            var _local_3:IWindowContainer;
            var _local_4:IBitmapWrapperWindow;
            var _local_5:IBitmapWrapperWindow;
            var _local_6:IBitmapWrapperWindow;
            var _local_7:uint;
            var _local_8:uint;
            var _local_9:uint;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:ColorTransform;
            var _local_14:BitmapData;
            this._gridWindow.destroyGridItems();
            this._selectedGridItem = null;
            for each (_local_2 in this.colors)
            {
                _local_3 = (k.buildFromXML(this._colorCellXML) as IWindowContainer);
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onClick);
                _local_3.background = true;
                _local_3.color = 0xFFFFFFFF;
                _local_3.width = this._colorCellFrame.width;
                _local_3.height = this._colorCellFrame.height;
                this._gridWindow._Str_2816(_local_3);
                _local_4 = (_local_3.findChildByTag("BG_BORDER") as IBitmapWrapperWindow);
                if (_local_4 != null)
                {
                    _local_4.bitmap = new BitmapData(this._colorCellFrame.width, this._colorCellFrame.height, true, 0);
                    _local_4.bitmap.copyPixels(this._colorCellFrame, this._colorCellFrame.rect, new Point(0, 0));
                }
                _local_5 = (_local_3.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow);
                if (_local_5 != null)
                {
                    _local_5.bitmap = new BitmapData(this._colorCellButton.width, this._colorCellButton.height, true, 0);
                    _local_7 = ((_local_2 >> 16) & 0xFF);
                    _local_8 = ((_local_2 >> 8) & 0xFF);
                    _local_9 = ((_local_2 >> 0) & 0xFF);
                    _local_10 = ((_local_7 / 0xFF) * 1);
                    _local_11 = ((_local_8 / 0xFF) * 1);
                    _local_12 = ((_local_9 / 0xFF) * 1);
                    _local_13 = new ColorTransform(_local_10, _local_11, _local_12);
                    _local_14 = this._colorCellButton.clone();
                    _local_14.colorTransform(_local_14.rect, _local_13);
                    _local_5.bitmap.copyPixels(_local_14, _local_14.rect, new Point(0, 0));
                }
                _local_6 = (_local_3.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow);
                if (_local_6 != null)
                {
                    _local_6.bitmap = new BitmapData(this._colorCellSelected.width, this._colorCellSelected.height, true, 0xFFFFFF);
                    _local_6.bitmap.copyPixels(this._colorCellSelected, this._colorCellSelected.rect, new Point(0, 0), null, null, true);
                    _local_6.visible = false;
                }
            }
        }

        private function onClick(k:WindowMouseEvent):void
        {
            var _local_2:int = this._gridWindow._Str_3373((k.target as IWindow));
            this._Str_6965(_local_2);
            this._view._Str_4246 = _local_2;
        }

        private function _Str_6048(k:IAssetLibrary):void
        {
            var _local_2:XmlAsset;
            var _local_3:BitmapDataAsset;
            if (k == null)
            {
                return;
            }
            _local_2 = XmlAsset(k.getAssetByName("dimmer_color_chooser_cell"));
            this._colorCellXML = XML(_local_2.content);
            _local_3 = BitmapDataAsset(k.getAssetByName("dimmer_color_frame"));
            this._colorCellFrame = BitmapData(_local_3.content);
            _local_3 = BitmapDataAsset(k.getAssetByName("dimmer_color_button"));
            this._colorCellButton = BitmapData(_local_3.content);
            _local_3 = BitmapDataAsset(k.getAssetByName("dimmer_color_selected"));
            this._colorCellSelected = BitmapData(_local_3.content);
        }

        private function get colors():Array
        {
            if (this._view == null)
            {
                return [];
            }
            return this._view.colors;
        }
    }
}
