package com.sulake.core.window.components
{
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.iterators.ItemGridIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowStyle;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class ItemGridController extends ItemListController implements IItemGridWindow 
    {
        private var _containerResizeToColumns:Boolean = false;
        private var _explicitVerticalSpacing:Boolean = false;
        private var _verticalSpacing:int;
        private var _shouldRebuildGridOnResize:Boolean = true;
        private var _isGridRebuilding:Boolean = false;

        public function ItemGridController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _horizontal = (!(_arg_2 == WindowType.WINDOW_TYPE_ITEMGRID_HORIZONTAL));
            _scaleToFitItems = true;
            if (!_horizontal)
            {
                throw (new Error("Horizontal item grid not yet implemented!"));
            }
        }

        override public function set spacing(k:int):void
        {
            var _local_2:uint = numListItems;
            if (this._explicitVerticalSpacing == false)
            {
                while (_local_2-- > 0)
                {
                    IItemListWindow(getListItemAt(_local_2)).spacing = k;
                }
            }
            super.spacing = k;
        }

        override public function set background(k:Boolean):void
        {
            super.background = k;
            var _local_2:uint;
            while (_local_2 < numListItems)
            {
                getListItemAt(_local_2).background = k;
                _local_2++;
            }
        }

        override public function set color(k:uint):void
        {
            super.color = k;
            var _local_2:uint;
            while (_local_2 < numListItems)
            {
                getListItemAt(_local_2).color = k;
                _local_2++;
            }
        }

        override public function set autoArrangeItems(k:Boolean):void
        {
            super.autoArrangeItems = k;
            var _local_2:int;
            while (_local_2 < this.numColumns)
            {
                IItemListWindow(getListItemAt(_local_2)).autoArrangeItems = k;
                _local_2++;
            }
        }

        override public function get scrollStepH():Number
        {
            if (_scrollStepH >= 0)
            {
                return _scrollStepH;
            }
            return (_horizontal) ? (0.1 * scrollableRegion.height) : (scrollableRegion.width / this.numColumns);
        }

        override public function get scrollStepV():Number
        {
            if (_scrollStepV >= 0)
            {
                return _scrollStepV;
            }
            return (_horizontal) ? (scrollableRegion.height / this.numRows) : (0.1 * scrollableRegion.width);
        }

        public function get shouldRebuildGridOnResize():Boolean
        {
            return this._shouldRebuildGridOnResize;
        }

        public function set shouldRebuildGridOnResize(k:Boolean):void
        {
            this._shouldRebuildGridOnResize = k;
        }

        public function set verticalSpacing(k:int):void
        {
            this._verticalSpacing = k;
            this._explicitVerticalSpacing = true;
            var _local_2:uint = numListItems;
            while (_local_2-- > 0)
            {
                IItemListWindow(getListItemAt(_local_2)).spacing = k;
            }
        }

        override public function get iterator():IIterator
        {
            return new ItemGridIterator(this);
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:Boolean = super.update(k, _arg_2);
            switch (_arg_2.type)
            {
                case WindowEvent.WINDOW_EVENT_RESIZED:
                    if (this._shouldRebuildGridOnResize)
                    {
                        this.rebuildGridStructure();
                    }
                    break;
                case WindowMouseEvent.WHEEL:
                    if (_horizontal)
                    {
                        scrollV = (scrollV - (WindowMouseEvent(_arg_2).delta * 0.01));
                    }
                    else
                    {
                        scrollH = (scrollH - (WindowMouseEvent(_arg_2).delta * 0.01));
                    }
                    _local_3 = true;
                    break;
            }
            return _local_3;
        }

        public function get numGridItems():uint
        {
            var k:uint = numListItems;
            var _local_2:uint;
            while (k-- > 0)
            {
                _local_2 = (_local_2 + IItemListWindow(getListItemAt(k)).numListItems);
            }
            return _local_2;
        }

        public function get numColumns():uint
        {
            return numListItems;
        }

        public function get numRows():uint
        {
            var k:uint;
            var _local_2:uint = this.numColumns;
            var _local_3:uint;
            while (_local_3 < _local_2)
            {
                k = Math.max(k, IItemListWindow(getListItemAt(_local_3)).numListItems);
                _local_3++;
            }
            return k;
        }

        public function addGridItem(k:IWindow):IWindow
        {
            var _local_2:IItemListWindow = this._Str_16044(k);
            return k;
        }

        public function addGridItemAt(k:IWindow, _arg_2:uint):IWindow
        {
            this._Str_22897(k, Math.min(this.numGridItems, _arg_2));
            return k;
        }

        public function getGridItemAt(k:uint):IWindow
        {
            var _local_2:IItemListWindow = this._Str_6836(k);
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.getListItemAt((k / this.numColumns));
        }

        public function getGridItemByID(k:uint):IWindow
        {
            var _local_3:IItemListWindow;
            var _local_4:IWindow;
            var _local_5:uint;
            var _local_2:uint = this.numColumns;
            _local_5 = 0;
            while (_local_5 < _local_2)
            {
                _local_3 = (getListItemAt(_local_5) as IItemListWindow);
                _local_4 = _local_3.getListItemByID(k);
                if (_local_4)
                {
                    return _local_4;
                }
                _local_5++;
            }
            return null;
        }

        public function getGridItemByName(k:String):IWindow
        {
            var _local_3:IItemListWindow;
            var _local_4:IWindow;
            var _local_5:uint;
            var _local_2:uint = this.numColumns;
            _local_5 = 0;
            while (_local_5 < _local_2)
            {
                _local_3 = (getListItemAt(_local_5) as IItemListWindow);
                _local_4 = _local_3.getListItemByName(k);
                if (_local_4)
                {
                    return _local_4;
                }
                _local_5++;
            }
            return null;
        }

        public function getGridItemByTag(k:String):IWindow
        {
            var _local_3:IItemListWindow;
            var _local_4:IWindow;
            var _local_5:uint;
            var _local_2:uint = this.numColumns;
            _local_5 = 0;
            while (_local_5 < _local_2)
            {
                _local_3 = (getChildAt(_local_5) as IItemListWindow);
                _local_4 = _local_3.getListItemByTag(k);
                if (_local_4)
                {
                    return _local_4;
                }
                _local_5++;
            }
            return null;
        }

        public function getGridItemIndex(k:IWindow):int
        {
            var _local_2:IItemListWindow = this._Str_22998(k);
            if (_local_2 == null)
            {
                return -1;
            }
            return (_local_2.getListItemIndex(k) * this.numColumns) + this._Str_22838(_local_2);
        }

        public function removeGridItem(k:IWindow):IWindow
        {
            var _local_2:int = this.getGridItemIndex(k);
            if (_local_2 == -1)
            {
                return null;
            }
            if (this._Str_24877(_local_2) != k)
            {
                throw (new Error("Item grid is out of order!"));
            }
            var _local_3:IItemListWindow = this._Str_6836(_local_2);
            if (!_horizontal)
            {
                _local_3.width = _local_3.scrollableRegion.width;
            }
            else
            {
                _local_3.height = _local_3.scrollableRegion.height;
            }
            return k;
        }

        public function removeGridItemAt(k:int):IWindow
        {
            return this.removeGridItem(this.getGridItemAt(k));
        }

        public function setGridItemIndex(k:IWindow, _arg_2:int):void
        {
            if (this.removeGridItem(k) == null)
            {
                throw (new Error("Item not found in grid!"));
            }
            addListItemAt(k, _arg_2);
        }

        public function swapGridItems(k:IWindow, _arg_2:IWindow):void
        {
            throw (new Error("ItemGridWindow / Unimplemented method!"));
        }

        public function swapGridItemsAt(k:int, _arg_2:int):void
        {
            this.swapGridItems(this.getGridItemAt(k), this.getGridItemAt(_arg_2));
        }

        public function removeGridItems():void
        {
            var _local_2:IItemListWindow;
            var k:uint = this.numColumns;
            var _local_3:uint;
            while (_local_3 < k)
            {
                _local_2 = IItemListWindow(getListItemAt(_local_3));
                _local_2.removeListItems();
                if (!_horizontal)
                {
                    _local_2.width = 0;
                }
                else
                {
                    _local_2.height = 0;
                }
                _local_3++;
            }
        }

        public function destroyGridItems():void
        {
            var _local_2:IItemListWindow;
            var k:uint = this.numColumns;
            var _local_3:uint;
            while (_local_3 < k)
            {
                _local_2 = IItemListWindow(getListItemAt(_local_3));
                _local_2.destroyListItems();
                if (!_horizontal)
                {
                    _local_2.width = 0;
                }
                else
                {
                    _local_2.height = 0;
                }
                _local_3++;
            }
            destroyListItems();
        }

        protected function _Str_24723(k:WindowEvent, _arg_2:IWindow):void
        {
        }

        protected function _Str_26265(k:WindowEvent):void
        {
            var _local_2:IWindow;
            if (k.type == WindowEvent.WINDOW_EVENT_DESTROYED)
            {
                _local_2 = (k.target as IWindow);
                this.removeGridItem(_local_2);
            }
        }

        protected function _Str_22838(k:IItemListWindow):int
        {
            return getListItemIndex(k);
        }

        protected function _Str_6836(k:uint):IItemListWindow
        {
            return getListItemAt((k % this.numColumns)) as IItemListWindow;
        }

        public function _Str_26410(k:uint):uint
        {
            return k % this.numColumns;
        }

        public function _Str_16931(k:uint):uint
        {
            return k / this.numColumns;
        }

        override public function populate(k:Array):void
        {
            var _local_5:IItemListWindow;
            var _local_7:IWindow;
            var _local_8:IItemListWindow;
            var _local_9:int;
            var _local_10:Boolean;
            var _local_2:Boolean = autoArrangeItems;
            this.autoArrangeItems = false;
            var _local_3:int = this.numGridItems;
            var _local_4:int = this.numColumns;
            var _local_6:Array = [];
            for each (_local_7 in k)
            {
                if (_local_4 == 0)
                {
                    this._Str_14060(_local_7);
                    _local_4++;
                }
                else
                {
                    if (_local_3 > 0)
                    {
                        _local_8 = this._Str_6836(((_local_3 > 0) ? (_local_3 - 1) : 0));
                        _local_9 = getListItemIndex(_local_8);
                        _local_10 = ((_local_9 > -1) ? (_local_9 == (_local_4 - 1)) : true);
                        if (_local_10)
                        {
                            if (_local_8.numListItems == 1)
                            {
                                if ((_local_8.right + _local_7.width) <= _w)
                                {
                                    this._Str_14060(_local_7);
                                    continue;
                                }
                            }
                        }
                        _local_5 = (getListItemAt(((_local_10) ? 0 : (_local_9 + 1))) as IItemListWindow);
                    }
                    else
                    {
                        _local_5 = (getListItemAt(0) as IItemListWindow);
                    }
                    _local_5.addListItem(_local_7);
                    _local_3++;
                    if (_local_7.width > _local_5.width)
                    {
                        _local_5.width = _local_7.width;
                    }
                    if (_local_7.bottom > _local_5.height)
                    {
                        _local_5.height = _local_7.bottom;
                    }
                }
            }
            this.autoArrangeItems = _local_2;
        }

        protected function _Str_22998(k:IWindow):IItemListWindow
        {
            var _local_3:IItemListWindow;
            var _local_2:uint = this.numColumns;
            while (_local_2-- > 0)
            {
                _local_3 = IItemListWindow(getListItemAt(_local_2));
                if (_local_3.getListItemIndex(k) > -1)
                {
                    return _local_3;
                }
            }
            return null;
        }

        protected function _Str_16044(k:IWindow):IItemListWindow
        {
            var _local_3:IItemListWindow;
            var _local_4:IItemListWindow;
            var _local_5:int;
            var _local_6:Boolean;
            if (this.numColumns == 0)
            {
                return this._Str_14060(k);
            }
            var _local_2:uint = this.numGridItems;
            if (_local_2 > 0)
            {
                _local_4 = this._Str_6836(((_local_2 > 0) ? (_local_2 - 1) : 0));
                _local_5 = getListItemIndex(_local_4);
                _local_6 = ((_local_5 > -1) ? (_local_5 == (this.numColumns - 1)) : true);
                if (_local_6)
                {
                    if (_local_4.numListItems == 1)
                    {
                        if ((_local_4.right + k.width) <= _w)
                        {
                            return this._Str_14060(k);
                        }
                    }
                }
                _local_3 = (getListItemAt(((_local_6) ? 0 : (_local_5 + 1))) as IItemListWindow);
            }
            else
            {
                _local_3 = (getListItemAt(0) as IItemListWindow);
            }
            _local_3.addListItem(k);
            if (k.width > _local_3.width)
            {
                _local_3.width = k.width;
            }
            if (k.bottom > _local_3.height)
            {
                _local_3.height = k.bottom;
            }
            return _local_3;
        }

        protected function _Str_14060(k:IWindow):IItemListWindow
        {
            var _local_2:IItemListWindow = (_context.create(((_name + "_COLUMN_") + numListItems), null, WindowType.WINDOW_TYPE_ITEMLIST_VERTICAL, WindowStyle.WINDOW_STYLE_DEFAULT, (WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT | WindowParam.WINDOW_PARAM_NULL), new Rectangle(0, 0, Math.max(k.width, 0), Math.max(k.height, 0)), this._Str_24723, null, numListItems, null, "", [WindowController.TAG_INTERNAL, WindowController.TAG_EXCLUDE]) as IItemListWindow);
            _local_2.isPartOfGridWindow = true;
            _local_2.background = background;
            _local_2.color = color;
            _local_2.spacing = ((this._explicitVerticalSpacing) ? this._verticalSpacing : _spacing);
            addListItem(_local_2);
            _local_2.addListItem(k);
            return _local_2;
        }

        protected function _Str_26203(k:uint):void
        {
            var _local_2:IItemListWindow = (removeChildAt(k) as IItemListWindow);
            if (_local_2)
            {
                _local_2.dispose();
            }
        }

        protected function _Str_22897(k:IWindow, _arg_2:uint):void
        {
            var _local_5:IItemListWindow;
            var _local_7:IWindow;
            var _local_8:uint;
            var _local_3:uint = this.numGridItems;
            var _local_4:int = (_local_3 - 1);
            var _local_6:uint = this.numColumns;
            var _local_9:int;
            while (_local_9 < _local_6)
            {
                IItemListWindow(getListItemAt(_local_9)).autoArrangeItems = false;
                _local_9++;
            }
            if (_local_3 <= _arg_2)
            {
                this._Str_16044(k);
            }
            else
            {
                if (this.numRows == 1)
                {
                    _local_7 = this.getGridItemAt(_local_4);
                    _local_5 = this._Str_16044(_local_7);
                    _local_4--;
                }
                while (_local_4 >= _arg_2)
                {
                    _local_7 = this.getGridItemAt(_local_4);
                    _local_8 = this._Str_16931((_local_4 + 1));
                    _local_5 = this._Str_6836((_local_4 + 1));
                    _local_5.addListItemAt(_local_7, _local_8);
                    _local_4--;
                }
                this._Str_6836(_arg_2).addListItemAt(k, (_arg_2 / this.numColumns));
            }
            var _local_10:uint;
            _local_6 = this.numColumns;
            _local_9 = 0;
            while (_local_9 < _local_6)
            {
                _local_5 = IItemListWindow(getListItemAt(_local_9));
                _local_5.autoArrangeItems = true;
                _local_5.height = _local_5.scrollableRegion.height;
                _local_10 = Math.max(_local_10, _local_5.height);
                _local_9++;
            }
            _container.height = _local_10;
        }

        protected function _Str_24877(k:uint):IWindow
        {
            var _local_7:IWindow;
            var _local_2:uint = this._Str_16931(k);
            var _local_3:IItemListWindow = this._Str_6836(k);
            var _local_4:IWindow = _local_3.removeListItemAt(_local_2);
            var _local_5:uint = this.numGridItems;
            var _local_6:uint = k;
            if (_local_4 == null)
            {
                return null;
            }
            var _local_8:int;
            while (_local_8 < this.numColumns)
            {
                IItemListWindow(getListItemAt(_local_8)).autoArrangeItems = false;
                _local_8++;
            }
            while (_local_6 < _local_5)
            {
                _local_2 = this._Str_16931(_local_6);
                _local_7 = this.getGridItemAt((_local_6 + 1));
                _local_3 = this._Str_6836(_local_6);
                _local_3.addListItemAt(_local_7, _local_2);
                _local_6++;
            }
            var _local_9:uint;
            _local_8 = 0;
            while (_local_8 < this.numColumns)
            {
                _local_3 = IItemListWindow(getListItemAt(_local_8));
                _local_3.autoArrangeItems = true;
                _local_3.height = _local_3.scrollableRegion.height;
                _local_9 = Math.max(_local_9, _local_3.height);
                _local_8++;
            }
            _container.height = _local_9;
            return _local_4;
        }

        public function rebuildGridStructure():void
        {
            var _local_4:IItemListWindow;
            var _local_5:IWindow;
            var _local_7:int;
            var _local_8:uint;
            var k:int = this.numGridItems;
            var _local_2:Array = [];
            var _local_3:int = this.numColumns;
            if (this._isGridRebuilding)
            {
                return;
            }
            this._isGridRebuilding = true;
            var _local_6:Boolean = autoArrangeItems;
            this.autoArrangeItems = false;
            while (k > 0)
            {
                _local_7 = 0;
                while (_local_7 < _local_3)
                {
                    _local_4 = (getListItemAt(_local_7) as IItemListWindow);
                    _local_5 = _local_4.removeListItemAt(0);
                    _local_2.push(_local_5);
                    if (--k < 1)
                    {
                        break;
                    }
                    _local_7++;
                }
            }
            destroyListItems();
            this.autoArrangeItems = _local_6;
            for each (_local_5 in _local_2)
            {
                this.addGridItem(_local_5);
            }
            if (this._containerResizeToColumns)
            {
                _local_8 = 0;
                _local_7 = 0;
                while (_local_7 < this.numColumns)
                {
                    _local_4 = IItemListWindow(getListItemAt(_local_7));
                    _local_4.autoArrangeItems = true;
                    _local_4.height = _local_4.scrollableRegion.height;
                    _local_8 = Math.max(_local_8, _local_4.height);
                    _local_7++;
                }
                _container.height = _local_8;
            }
            this._isGridRebuilding = false;
        }

        public function set containerResizeToColumns(k:Boolean):void
        {
            this._containerResizeToColumns = k;
        }

        public function get containerResizeToColumns():Boolean
        {
            return this._containerResizeToColumns;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.CONTAINER_RESIZE_TO_COLUMNS, this.containerResizeToColumns));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.CONTAINER_RESIZE_TO_COLUMNS:
                        this.containerResizeToColumns = (_local_2.value as Boolean);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
