package com.sulake.habbo.inventory.furni
{
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import __AS3__.vec.*;

    public class FurniGridView 
    {
        private static const _Str_20122:int = 0;
        private static const _Str_16787:int = 1;
        private static const _Str_18697:int = 2;

        private var _grid:IItemGridWindow;
        private var _items:Vector.<GroupItem>;
        private var _showFloorItems:Boolean = true;
        private var _showWallItems:Boolean = true;
        private var _placement:int;
        private var _showingRentedItems:Boolean = false;
        private var _passedItems:Vector.<GroupItem>;
        private var _pages:IItemListWindow;
        private var _pageTemplate:IRegionWindow;
        private var _itemsPerPage:int = 200;
        private var _currentPage:int = -1;
        private var _currentPageItems:Vector.<GroupItem>;
        private var _filter:String = "";

        public function FurniGridView(k:IItemGridWindow, _arg_2:IItemListWindow)
        {
            this._grid = k;
            this._grid._Str_6405 = false;
            this._items = new Vector.<GroupItem>(0);
            this._passedItems = new Vector.<GroupItem>(0);
            this._pages = _arg_2;
            if (this._pages)
            {
                this._pageTemplate = (this._pages.removeListItemAt(0) as IRegionWindow);
            }
        }

        public function get _Str_26072():int
        {
            return this._grid.numGridItems;
        }

        public function get _Str_12561():Vector.<GroupItem>
        {
            return this._currentPageItems;
        }

        private function get _Str_8849():int
        {
            return (this._passedItems.length / this._itemsPerPage) + 1;
        }

        public function dispose():void
        {
            this._grid = null;
            this._items = null;
        }

        public function _Str_25425():void
        {
            if (this._grid != null)
            {
                this._grid._Str_3956();
            }
            this._grid.destroyGridItems();
        }

        public function _Str_25694(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:String, _arg_5:int):void
        {
            this._showFloorItems = ((k == 0) || (k == 1));
            this._showWallItems = ((k == 0) || (k == 2));
            this._showingRentedItems = _arg_3;
            this._placement = _arg_5;
            this._filter = _arg_4.toLowerCase();
            this.update();
        }

        public function _Str_9854(k:GroupItem):void
        {
            if (this._Str_19541(k))
            {
                this.update();
            }
        }

        public function _Str_15980():IWindowContainer
        {
            if (this._grid.numGridItems == 0)
            {
                return null;
            }
            return this._grid._Str_2830(0) as IWindowContainer;
        }

        public function _Str_25722(k:Vector.<GroupItem>):void
        {
            this._items = k;
            this.update();
        }

        private function update():void
        {
            var item:GroupItem;
            var changes:Boolean;
            var i:int;
            var currentItems:Vector.<GroupItem> = new Vector.<GroupItem>(0);
            for each (item in this._items)
            {
                if (this._Str_19541(item))
                {
                    currentItems.push(item);
                }
            }
            if (this._showingRentedItems)
            {
                currentItems = currentItems.sort(function (k:GroupItem, _arg_2:GroupItem):Number
                {
                    var _local_3:* = k._Str_3205();
                    var _local_4:* = _arg_2._Str_3205();
                    var _local_5:* = (int(_local_4.hasRentPeriodStarted) - int(_local_3.hasRentPeriodStarted));
                    return (_local_5 != 0) ? _local_5 : (_local_3.secondsToExpiration - _local_4.secondsToExpiration);
                });
            }
            if (currentItems.length == this._passedItems.length)
            {
                changes = false;
                i = 0;
                while (i < currentItems.length)
                {
                    if (currentItems[i] != this._passedItems[i])
                    {
                        changes = true;
                        break;
                    }
                    i = (i + 1);
                }
                if (!changes)
                {
                    return;
                }
            }
            this._passedItems = currentItems;
            this._Str_20040(this._currentPage, true);
            this._Str_20352();
        }

        private function _Str_20040(k:int, _arg_2:Boolean=false):void
        {
            if (k > -1)
            {
                if (((this._currentPage == k) && (!(_arg_2))))
                {
                    return;
                }
            }
            else
            {
                k = 0;
            }
            this._currentPage = k;
            if (this._currentPage >= this._Str_8849)
            {
                this._currentPage = (this._Str_8849 - 1);
            }
            this._currentPage = Math.max(this._currentPage, 0);
            this._currentPageItems = new Vector.<GroupItem>(0);
            this._Str_25425();
            var _local_3:int = (this._currentPage * this._itemsPerPage);
            var _local_4:int = (_local_3 + this._itemsPerPage);
            _local_4 = Math.min(_local_4, this._passedItems.length);
            var _local_5:int = _local_3;
            while (_local_5 < _local_4)
            {
                this._grid._Str_2816(this._passedItems[_local_5].window);
                this._currentPageItems.push(this._passedItems[_local_5]);
                _local_5++;
            }
        }

        private function _Str_25938(k:GroupItem):void
        {
        }

        private function _Str_20352():void
        {
            var _local_2:IRegionWindow;
            var _local_3:int;
            var _local_4:ITextWindow;
            if (!this._pages)
            {
                return;
            }
            var k:int = this._Str_8849;
            this._pages.visible = (k > 1);
            if (this._currentPage >= k)
            {
                this._currentPage = (k - 1);
            }
            this._currentPage = Math.max(this._currentPage, 0);
            if (this._Str_8849 != this._pages.numListItems)
            {
                for each (_local_2 in this._pages)
                {
                    _local_2.removeEventListener(WindowMouseEvent.CLICK, this._Str_12810);
                }
                this._pages.destroyListItems();
                _local_3 = 0;
                while (_local_3 < k)
                {
                    _local_2 = (this._pageTemplate.clone() as IRegionWindow);
                    _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_12810);
                    _local_2.addEventListener(WindowMouseEvent.OVER, this._Str_12810);
                    _local_2.addEventListener(WindowMouseEvent.OUT, this._Str_12810);
                    _local_2.id = _local_3;
                    _local_2.name = ("page_" + _local_3);
                    this._pages.addListItem(_local_2);
                    _local_3++;
                }
            }
            _local_3 = 0;
            while (_local_3 < k)
            {
                _local_2 = (this._pages.getListItemAt(_local_3) as IRegionWindow);
                _local_4 = (_local_2.findChildByTag("PAGE") as ITextWindow);
                _local_4.caption = _local_3.toString();
                if (_local_3 == this._currentPage)
                {
                    _local_4.underline = true;
                    _local_4.textColor = 0xFF0000;
                }
                else
                {
                    _local_4.underline = false;
                    _local_4.textColor = 0;
                }
                _local_3++;
            }
        }

        private function _Str_12810(k:WindowMouseEvent):void
        {
            var _local_2:int = k.window.id;
            var _local_3:ITextWindow = ((k.target as IWindowContainer).findChildByTag("PAGE") as ITextWindow);
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    this._Str_20040(_local_2);
                    this._Str_20352();
                    return;
                case WindowMouseEvent.OVER:
                    _local_3.textColor = 0xFF0000;
                    return;
                case WindowMouseEvent.OUT:
                    if (_local_2 != this._currentPage)
                    {
                        _local_3.textColor = 0;
                    }
                    return;
            }
        }

        private function _Str_19541(k:GroupItem):Boolean
        {
            var _local_2:String;
            var _local_3:String;
            if (((!(this._showFloorItems)) && (!(k._Str_2770))))
            {
                return false;
            }
            if (((!(this._showWallItems)) && (k._Str_2770)))
            {
                return false;
            }
            if (this._showingRentedItems != k._Str_3459)
            {
                return false;
            }
            if (((this._placement == _Str_16787) && (k.flatId == -1)))
            {
                return false;
            }
            if (((this._placement == _Str_18697) && (k.flatId > -1)))
            {
                return false;
            }
            if (this._filter.length > 0)
            {
                _local_2 = k.name.toLowerCase();
                _local_3 = k.description.toLowerCase();
                if (((_local_2.indexOf(this._filter) == -1) && (_local_3.indexOf(this._filter) == -1)))
                {
                    return false;
                }
            }
            return true;
        }
    }
}
