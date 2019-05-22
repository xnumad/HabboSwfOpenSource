package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IItemGridWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.geom.Rectangle;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;

    public class ColourGridCatalogWidget extends CatalogWidget
    {
        private var _colours:Array;
        private var _colourGrid:IItemGridWindow;
        private var _colourChooserLayout:XML;
        private var _colourChooserBackground:BitmapData;
        private var _colourChooserColour:BitmapData;
        private var _colourChosen:BitmapData;
        private var _selectedGridItem:IWindowContainer;

        public function ColourGridCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            if (!this._colourGrid.disposed)
            {
                this._colourGrid.destroyGridItems();
                this._colourGrid.dispose();
            }
            this._colourGrid = null;
            this._colourChooserLayout = null;
            this._selectedGridItem = null;
            events.removeEventListener(CatalogWidgetEvent.COLOUR_ARRAY, this._Str_20989);
            events.removeEventListener(CatalogWidgetEvent.MULTI_COLOUR_ARRAY, this._Str_22045);
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.COLOUR_GRID);
            var k:* = (_window.tags.indexOf("FIXED") > -1);
            if (!k)
            {
                _window.getChildAt(0).width = _window.width;
                _window.getChildAt(0).height = _window.height;
            }
            this._colourGrid = (_window.findChildByName("colourGrid") as IItemGridWindow);
            this._colourGrid.width = window.width;
            this._colourGrid.height = window.height;
            var _local_2:XmlAsset = (page.viewer.catalog.assets.getAssetByName("color_chooser_cell") as XmlAsset);
            this._colourChooserLayout = (_local_2.content as XML);
            events.addEventListener(CatalogWidgetEvent.COLOUR_ARRAY, this._Str_20989);
            events.addEventListener(CatalogWidgetEvent.MULTI_COLOUR_ARRAY, this._Str_22045);
            return true;
        }

        private function _Str_20989(k:CatalogWidgetColoursEvent):void
        {
            var _local_2:int;
            var _local_3:BitmapDataAsset;
            var _local_4:BitmapDataAsset;
            var _local_5:BitmapDataAsset;
            this._colours = [];
            for each (_local_2 in k.colours)
            {
                this._colours.push([_local_2]);
            }
            _local_3 = (page.viewer.catalog.assets.getAssetByName(k._Str_17113) as BitmapDataAsset);
            this._colourChooserBackground = (_local_3.content as BitmapData);
            _local_4 = (page.viewer.catalog.assets.getAssetByName(k._Str_17801) as BitmapDataAsset);
            this._colourChooserColour = (_local_4.content as BitmapData);
            _local_5 = (page.viewer.catalog.assets.getAssetByName(k._Str_17175) as BitmapDataAsset);
            this._colourChosen = (_local_5.content as BitmapData);
            this._Str_14728();
            this.select((this._colourGrid._Str_2830(k.index) as IWindowContainer));
        }

        private function _Str_22045(k:CatalogWidgetMultiColoursEvent):void
        {
            var _local_2:Array;
            var _local_3:BitmapDataAsset;
            var _local_4:BitmapDataAsset;
            var _local_5:BitmapDataAsset;
            this._colours = [];
            for each (_local_2 in k.colours)
            {
                this._colours.push(_local_2.slice());
            }
            _local_3 = (page.viewer.catalog.assets.getAssetByName(k._Str_17113) as BitmapDataAsset);
            this._colourChooserBackground = (_local_3.content as BitmapData);
            _local_4 = (page.viewer.catalog.assets.getAssetByName(k._Str_17801) as BitmapDataAsset);
            this._colourChooserColour = (_local_4.content as BitmapData);
            _local_5 = (page.viewer.catalog.assets.getAssetByName(k._Str_17175) as BitmapDataAsset);
            this._colourChosen = (_local_5.content as BitmapData);
            this._Str_14728();
            this.select((this._colourGrid._Str_2830(0) as IWindowContainer));
        }

        private function select(k:IWindowContainer):void
        {
            var _local_2:IWindow;
            Logger.log(("[ColourGridCatalogWidget] Select: " + k));
            if (this._selectedGridItem != null)
            {
                _local_2 = this._selectedGridItem.getChildByName("chosen");
                if (_local_2 != null)
                {
                    _local_2.visible = false;
                }
            }
            this._selectedGridItem = k;
            if (this._selectedGridItem != null)
            {
                _local_2 = this._selectedGridItem.getChildByName("chosen");
            }
            if (_local_2 != null)
            {
                _local_2.visible = true;
            }
        }

        private function _Str_14728():void
        {
            var k:Array;
            var _local_2:IWindowContainer;
            var _local_3:IBitmapWrapperWindow;
            var _local_4:IBitmapWrapperWindow;
            var _local_5:IBitmapWrapperWindow;
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:uint;
            var _local_9:BitmapData;
            var _local_10:BitmapData;
            var _local_11:int;
            var _local_12:int;
            var _local_13:int;
            Logger.log(("[ColourGridCatalogWidget] Display colors: " + [this._colours.length, this._colourGrid.numGridItems]));
            this._colourGrid.destroyGridItems();
            this._selectedGridItem = null;
            for each (k in this._colours)
            {
                if (k.length > 0)
                {
                    _local_2 = (page.viewer.catalog.windowManager.buildFromXML(this._colourChooserLayout) as IWindowContainer);
                    _local_2.addEventListener(WindowMouseEvent.CLICK, this.onClick);
                    _local_2.background = true;
                    _local_2.color = 0xFFFFFFFF;
                    _local_2.width = this._colourChooserBackground.width;
                    _local_2.height = this._colourChooserBackground.height;
                    this._colourGrid._Str_2816(_local_2);
                    _local_3 = (_local_2.findChildByTag("BG_BORDER") as IBitmapWrapperWindow);
                    if (_local_3 != null)
                    {
                        _local_3.bitmap = new BitmapData(this._colourChooserBackground.width, this._colourChooserBackground.height, true, 0);
                        _local_3.bitmap.copyPixels(this._colourChooserBackground, this._colourChooserBackground.rect, new Point(0, 0));
                    }
                    _local_4 = (_local_2.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow);
                    if (_local_4 != null)
                    {
                        _local_4.bitmap = new BitmapData(this._colourChooserColour.width, this._colourChooserColour.height, true, 0);
                        _local_6 = 0xFF;
                        _local_7 = 0xFF;
                        _local_8 = 0xFF;
                        _local_9 = null;
                        _local_10 = null;
                        _local_11 = k[0];
                        if (_local_11 >= 0)
                        {
                            _local_6 = ((_local_11 >> 16) & 0xFF);
                            _local_7 = ((_local_11 >> 8) & 0xFF);
                            _local_8 = ((_local_11 >> 0) & 0xFF);
                        }
                        _local_9 = this._colourChooserColour.clone();
                        _local_9.colorTransform(_local_9.rect, new ColorTransform((_local_6 / 0xFF), (_local_7 / 0xFF), (_local_8 / 0xFF)));
                        if (k.length > 1)
                        {
                            _local_12 = k[1];
                            if (_local_12 >= 0)
                            {
                                _local_6 = ((_local_12 >> 16) & 0xFF);
                                _local_7 = ((_local_12 >> 8) & 0xFF);
                                _local_8 = ((_local_12 >> 0) & 0xFF);
                            }
                            _local_10 = this._colourChooserColour.clone();
                            _local_10.colorTransform(_local_10.rect, new ColorTransform((_local_6 / 0xFF), (_local_7 / 0xFF), (_local_8 / 0xFF)));
                        }
                        _local_4.bitmap.copyPixels(_local_9, _local_9.rect, new Point(0, 0));
                        _local_9.dispose();
                        if (_local_10 != null)
                        {
                            _local_13 = (_local_10.width / 2);
                            _local_4.bitmap.copyPixels(_local_10, new Rectangle(_local_13, 0, (_local_10.width - _local_13), _local_10.height), new Point((_local_10.width / 2), 0));
                            _local_10.dispose();
                        }
                    }
                    _local_5 = (_local_2.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow);
                    if (_local_5 != null)
                    {
                        _local_5.bitmap = new BitmapData(this._colourChosen.width, this._colourChosen.height, true, 0xFFFFFF);
                        _local_5.bitmap.copyPixels(this._colourChosen, this._colourChosen.rect, new Point(0, 0), null, null, true);
                        _local_5.visible = false;
                    }
                }
            }
        }

        private function onClick(k:WindowMouseEvent):void
        {
            this.select((k.target as IWindowContainer));
            var _local_2:int = this._colourGrid._Str_3373((k.target as IWindow));
            events.dispatchEvent(new CatalogWidgetColourIndexEvent(_local_2));
        }
    }
}
