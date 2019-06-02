package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
	import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
	import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoCatalogWidget;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoPromoItem;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBundlesInfoItem;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoDiscountValueItem;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusBadgeItem;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusAchievementItem;
    import com.sulake.core.window.IWindow;

    public class ExtraInfoViewManager implements IDisposable, IUpdateReceiver 
    {
        private static const _Str_9363:Number = 0.5;
        private static const _Str_13502:int = 28;

        private var _widget:BundlePurchaseExtraInfoCatalogWidget;
        private var _catalog:HabboCatalog;
        private var _items:Map;
        private var _idGenerator:int = 0;
        private var _disposed:Boolean = false;
        private var _secondsElapsed:Number = 0;

        public function ExtraInfoViewManager(k:BundlePurchaseExtraInfoCatalogWidget, _arg_2:HabboCatalog)
        {
            this._widget = k;
            this._catalog = _arg_2;
            this._items = new Map();
            this._catalog.registerUpdateReceiver(this, 10);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set disposed(k:Boolean):void
        {
            this._disposed = k;
        }

        public function dispose():void
        {
            var k:ExtraInfoListItem;
            if (!this.disposed)
            {
                this._catalog.removeUpdateReceiver(this);
                this._widget = null;
                this._catalog = null;
                for each (k in this._items)
                {
                    k.dispose();
                }
                this._items = null;
                this.disposed = true;
            }
        }

        public function clear():void
        {
            var k:ExtraInfoListItem;
            while (this._widget.window.numChildren > 0)
            {
                this._widget.window.removeChildAt(0);
            }
            for each (k in this._items)
            {
                k.dispose();
            }
            this._items = new Map();
            this.render();
        }

        public function _Str_2822(k:ExtraInfoItemData):int
        {
            var _local_2:ExtraInfoListItem;
            var _local_3:int = this._idGenerator++;
            switch (k.type)
            {
                case ExtraInfoItemData._Str_13400:
                    _local_2 = new ExtraInfoPromoItem(this._widget, _local_3, k, this._catalog);
                    break;
                case ExtraInfoItemData._Str_14719:
                    _local_2 = new ExtraInfoBundlesInfoItem(this._widget, _local_3, k, this._catalog);
                    break;
                case ExtraInfoItemData._Str_14097:
                    _local_2 = new ExtraInfoDiscountValueItem(_local_3, k, this._catalog);
                    break;
                case ExtraInfoItemData._Str_16957:
                    _local_2 = new ExtraInfoBonusBadgeItem(_local_3, k, this._catalog);
                    break;
                case ExtraInfoItemData._Str_18371:
                    _local_2 = new ExtraInfoBonusAchievementItem(_local_3, k);
                    break;
            }
            _local_2._Str_13645 = this._secondsElapsed;
            this._items.add(_local_3, _local_2);
            var _local_4:IWindow = _local_2.getRenderedWindow();
            _local_4.width = this._widget.window.width;
            this._widget.window.addChild(_local_4);
            this._Str_22743();
            this.render();
            return _local_2.id;
        }

        public function removeItem(k:int):void
        {
            var _local_2:ExtraInfoListItem = this._Str_2990(k);
            if (_local_2)
            {
                _local_2._Str_14104 = this._secondsElapsed;
                if (_local_2.alignment == ExtraInfoListItem.ALIGN_OVERLAY)
                {
                    this._Str_20572(_local_2.id);
                }
                this.render();
            }
        }

        public function _Str_2990(k:int):ExtraInfoListItem
        {
            return ExtraInfoListItem(this._items.getValue(k));
        }

        private function _Str_20572(k:int):void
        {
            var _local_2:ExtraInfoListItem = this._Str_2990(k);
            this._widget.window.removeChild(_local_2.getRenderedWindow());
            this._items.remove(k);
        }

        private function _Str_19328(k:Number, _arg_2:Boolean=false):Number
        {
            if (_arg_2)
            {
                return 1 - Math.abs(Math.cos((((this._secondsElapsed - k) / _Str_9363) * (Math.PI / 2))));
            }
            return 1 - Math.abs(Math.sin((((this._secondsElapsed - k) / _Str_9363) * (Math.PI / 2))));
        }

        private function render():void
        {
            var _local_4:ExtraInfoListItem;
            var _local_5:IWindow;
            var _local_6:Number;
            var k:int;
            var _local_2:int = this._widget.window.height;
            var _local_3:Array = this._items.getValues();
            for each (_local_4 in _local_3)
            {
                _local_5 = _local_4.getRenderedWindow();
                _local_6 = 0;
                if ((this._secondsElapsed - _Str_9363) <= _local_4._Str_13645)
                {
                    _local_6 = this._Str_19328(_local_4._Str_13645);
                }
                if (_local_4._Str_24857)
                {
                    _local_6 = this._Str_19328(_local_4._Str_14104, true);
                    if (this._secondsElapsed > (_local_4._Str_14104 + _Str_9363))
                    {
                        this._Str_20572(_local_4.id);
                        break;
                    }
                }
                if (_local_4.alignment == ExtraInfoListItem.ALIGN_TOP)
                {
                    _local_5.y = k;
                    _local_5.y = (_local_5.y - (_local_6 * Math.min(_local_5.height, _Str_13502)));
                    k = (k + _local_5.height);
                }
                else
                {
                    if (_local_4.alignment == ExtraInfoListItem.ALIGN_BOTTOM)
                    {
                        _local_5.y = (_local_2 - _local_5.height);
                        _local_5.y = (_local_5.y + (_local_6 * Math.min(_local_5.height, _Str_13502)));
                        _local_2 = (_local_2 - _local_5.height);
                    }
                    else
                    {
                        if (_local_4.alignment == ExtraInfoListItem.ALIGN_OVERLAY)
                        {
                            _local_5.y = 0;
                        }
                    }
                }
            }
        }

        private function _Str_22743():void
        {
            var _local_2:ExtraInfoListItem;
            var k:int = (this._widget.window.numChildren - 1);
            for each (_local_2 in this._items)
            {
                if (_local_2._Str_22324)
                {
                    this._widget.window.setChildIndex(_local_2.getRenderedWindow(), k);
                }
            }
        }

        private function get _Str_25119():Boolean
        {
            return true;
        }

        public function update(k:uint):void
        {
            this._secondsElapsed = (this._secondsElapsed + (Number(k) / 1000));
            if (this._Str_25119)
            {
                this.render();
            }
        }
    }
}
