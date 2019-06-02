package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.viewer._Str_4311;
    import com.sulake.habbo.catalog.recycler.PrizeViewer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.viewer.IGridItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.XmlAsset;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.recycler._Str_3903;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.recycler.PrizeLevelContainer;
    import com.sulake.habbo.catalog.recycler.DealPrizeContainer;
    import com.sulake.habbo.catalog.recycler.IRecycler;

    public class RecyclerPrizesCatalogWidget extends CatalogWidget implements _Str_4311 
    {
        private var _Str_3154:Array;
        private var _Str_4944:PrizeViewer;
        private var _Str_2338:IItemListWindow;
        private var _Str_3370:XML;
        private var _Str_16116:XML;
        private var _Str_2537:IGridItem;

        public function RecyclerPrizesCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._Str_4944 != null)
            {
                this._Str_4944.dispose();
                this._Str_4944 = null;
            }
            this._Str_3154 = null;
            this._Str_2338 = null;
            this._Str_3370 = null;
            this._Str_16116 = null;
            this._Str_2537 = null;
        }

        override public function init():Boolean
        {
            var k:XmlAsset;
            if (!super.init())
            {
                return false;
            }
            this._Str_4944 = new PrizeViewer();
            this._Str_3154 = this.recycler.getPrizeTable();
            if (this._Str_3154 == null)
            {
                return false;
            }
            this._Str_2338 = (_window.findChildByName("itemList") as IItemListWindow);
            k = (page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset);
            this._Str_3370 = (k.content as XML);
            k = (page.viewer.catalog.assets.getAssetByName("recyclerPrizesWidgetLevelItem") as XmlAsset);
            this._Str_16116 = (k.content as XML);
            this._Str_6159();
            if (((this._Str_3154.length > 0) && (this._Str_3154[0].prizes.length > 0)))
            {
                this.select((this._Str_3154[0].prizes[0] as IGridItem), false);
            }
            return true;
        }

        private function _Str_6159(k:TimerEvent=null):void
        {
            var _local_2:int;
            while (_local_2 < this._Str_3154.length)
            {
                this._Str_24166(this._Str_3154[_local_2]);
                _local_2++;
            }
        }

        private function _Str_24166(k:PrizeLevelContainer):void
        {
            var _local_6:_Str_3903;
            var _local_2:IWindowContainer = (page.viewer.catalog.windowManager.buildFromXML(this._Str_16116) as IWindowContainer);
            this._Str_2338.addListItem(_local_2);
            var _local_3:IWindow = _local_2.findChildByName("headerText");
            if (_local_3 != null)
            {
                _local_3.caption = page.viewer.catalog.localization.getLocalization(("recycler.prizes.category." + k._Str_16418));
            }
            var _local_4:IItemGridWindow = (_local_2.findChildByName("itemGrid") as IItemGridWindow);
            var _local_5:int;
            while (_local_5 < k.prizes.length)
            {
                _local_6 = k.prizes[_local_5];
                this._Str_26473(_local_6, _local_4);
                _local_5++;
            }
        }

        private function _Str_26473(k:_Str_3903, _arg_2:IItemGridWindow):void
        {
            if ((((k == null) || (_arg_2 == null)) || (_arg_2.disposed)))
            {
                return;
            }
            var _local_3:IWindowContainer = (page.viewer.catalog.windowManager.buildFromXML(this._Str_3370) as IWindowContainer);
            _local_3.findChildByName("clubLevelIcon").visible = false;
            k.view = _local_3;
            k.grid = this;
            k.setIcon(page.viewer.roomEngine);
            _arg_2._Str_2816(_local_3);
            _arg_2.height = _arg_2.visibleRegion.height;
            if ((k is DealPrizeContainer))
            {
                _arg_2.width = _arg_2.visibleRegion.width;
            }
        }

        public function select(k:IGridItem, _arg_2:Boolean):void
        {
            if (k == null)
            {
                return;
            }
            if (this._Str_2537 != null)
            {
                this._Str_2537.deactivate();
            }
            this._Str_2537 = k;
            k.activate();
            var _local_3:IWindowContainer = (window.findChildByName("productView") as IWindowContainer);
            var _local_4:_Str_3903 = (k as _Str_3903);
            var _local_5:DealPrizeContainer = (k as DealPrizeContainer);
            var _local_6:String = "";
            if (_local_5 != null)
            {
                _local_6 = page.viewer.catalog.localization.getLocalization(("recycler.prizes.odds." + _local_4._Str_21913));
                this._Str_4944._Str_22540(page.viewer.roomEngine, page, this._Str_3370, _local_3, _local_5, _local_4.title, _local_6);
            }
            else
            {
                if (_local_4 != null)
                {
                    _local_6 = page.viewer.catalog.localization.getLocalization(("recycler.prizes.odds." + _local_4._Str_21913));
                    this._Str_4944._Str_25618(page.viewer.roomEngine, _local_3, _local_4._Str_7585, _local_4._Str_6270, _local_4.title, _local_6);
                }
            }
        }

        public function _Str_9974(k:IGridItem):Boolean
        {
            return false;
        }

        private function get recycler():IRecycler
        {
            return page.viewer.catalog.getRecycler();
        }
    }
}
