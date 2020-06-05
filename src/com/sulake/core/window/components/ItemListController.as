package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.IInputProcessorRoot;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.enum.WindowStyle;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowContext;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.graphics.WindowRedrawFlag;
    import com.sulake.core.window.iterators.ItemListIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.utils.PropertyStruct;

    public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot 
    {
        private var _disableAutoDrag:Boolean = false;
        private var _isPartOfGridWindow:Boolean = false;
        protected var _scrollOffsetH:Number;
        protected var _scrollOffsetV:Number;
        protected var _scrollAreaWidth:Number;
        protected var _scrollAreaHeight:Number;
        protected var _container:IWindowContainer;
        protected var _resizing:Boolean = false;
        protected var _updating:Boolean = false;
        protected var _spacing:int;
        protected var _horizontal:Boolean = false;
        protected var _scrollStepH:Number = -1;
        protected var _scrollStepV:Number = -1;
        protected var _arrangeListItems:Boolean;
        protected var _scaleToFitItems:Boolean;
        protected var _Str_12072:Boolean;
        protected var _Str_19352:Number;
        protected var _Str_5885:Number;
        protected var _Str_19220:Number;
        protected var _Str_20088:Number;
        protected var _Str_11276:Boolean;

        public function ItemListController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._scrollOffsetH = 0;
            this._scrollOffsetV = 0;
            this._scrollAreaWidth = 0;
            this._scrollAreaHeight = 0;
            this._horizontal = (_arg_2 == WindowType.WINDOW_TYPE_ITEMLIST_HORIZONTAL);
            var _local_12:IThemeManager = _arg_5.getWindowFactory().getThemeManager();
            this._spacing = int(_local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.SPACING).value);
            this._arrangeListItems = _local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.AUTO_ARRANGE_ITEMS).value;
            this._scaleToFitItems = _local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.SCALE_TO_FIT_ITEMS).value;
            this._Str_12072 = _local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.RESIZE_ON_ITEM_UPDATE).value;
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _Str_3781 = ((_background) || (!(testParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))));
            this._container = (_context.create("_CONTAINER", "", WindowType.WINDOW_TYPE_CONTAINER, WindowStyle.WINDOW_STYLE_DEFAULT, ((WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT | WindowParam.WINDOW_PARAM_RELATIVE_SCALE_FIXED) | WindowParam.WINDOW_PARAM_NULL), new Rectangle(0, 0, width, height), null, this, 0, null, "", [TAG_INTERNAL, TAG_EXCLUDE]) as IWindowContainer);
            this._container.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_6611);
            this._container.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this._Str_6611);
            this._container.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_6611);
            this._container.addEventListener(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._Str_6611);
            this._container.clipping = clipping;
            this._Str_3583 = this._Str_12072;
        }

        public function get spacing():int
        {
            return this._spacing;
        }

        public function set spacing(k:int):void
        {
            if (k != this._spacing)
            {
                this._spacing = k;
                this._Str_4024();
            }
        }

        public function get scrollH():Number
        {
            return this._scrollOffsetH;
        }

        public function get scrollV():Number
        {
            return this._scrollOffsetV;
        }

        public function get maxScrollH():int
        {
            return Math.max(0, (this._scrollAreaWidth - width));
        }

        public function get maxScrollV():int
        {
            return Math.max(0, (this._scrollAreaHeight - height));
        }

        public function get _Str_8004():Boolean
        {
            return this._isPartOfGridWindow;
        }

        public function set _Str_8004(k:Boolean):void
        {
            this._isPartOfGridWindow = k;
        }

        public function get scrollableWindow():IWindow
        {
            return this;
        }

        public function get _Str_3707():Rectangle
        {
            return new Rectangle((this._scrollOffsetH * this.maxScrollH), (this._scrollOffsetV * this.maxScrollV), width, height);
        }

        public function get visibleRegion():Rectangle
        {
            return this._container.rectangle;
        }

        public function set scrollH(k:Number):void
        {
            var _local_2:WindowEvent;
            if (k < 0)
            {
                k = 0;
            }
            if (k > 1)
            {
                k = 1;
            }
            if (k != this._scrollOffsetH)
            {
                this._scrollOffsetH = k;
                this._container.x = (-(this._scrollOffsetH) * this.maxScrollH);
                _context.invalidate(this._container, this._Str_3707, WindowRedrawFlag.REDRAW);
                if (_Str_759)
                {
                    _local_2 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_SCROLL, this, null);
                    _Str_759.dispatchEvent(_local_2);
                    _local_2.recycle();
                }
            }
        }

        public function set scrollV(k:Number):void
        {
            var _local_2:WindowEvent;
            if (k < 0)
            {
                k = 0;
            }
            if (k > 1)
            {
                k = 1;
            }
            if (k != this._scrollOffsetV)
            {
                this._scrollOffsetV = k;
                this._container.y = (-(this._scrollOffsetV) * this.maxScrollV);
                if (_Str_759)
                {
                    _local_2 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_SCROLL, this, null);
                    _Str_759.dispatchEvent(_local_2);
                    _local_2.recycle();
                }
            }
        }

        public function get scrollStepH():Number
        {
            if (this._scrollStepH >= 0)
            {
                return this._scrollStepH;
            }
            return (this._horizontal) ? (this._container.width / this.numListItems) : (0.1 * this._container.width);
        }

        public function get scrollStepV():Number
        {
            if (this._scrollStepV >= 0)
            {
                return this._scrollStepV;
            }
            return (this._horizontal) ? (0.1 * this._container.height) : (this._container.height / this.numListItems);
        }

        public function set scrollStepH(k:Number):void
        {
            this._scrollStepH = k;
        }

        public function set scrollStepV(k:Number):void
        {
            this._scrollStepV = k;
        }

        public function set _Str_3640(k:Boolean):void
        {
            if (this._scaleToFitItems != k)
            {
                this._scaleToFitItems = k;
                this._Str_4024();
            }
        }

        public function get _Str_3640():Boolean
        {
            return this._scaleToFitItems;
        }

        public function set autoArrangeItems(k:Boolean):void
        {
            this._arrangeListItems = k;
            this._Str_4024();
        }

        public function get autoArrangeItems():Boolean
        {
            return this._arrangeListItems;
        }

        public function set _Str_3583(k:Boolean):void
        {
            this._Str_12072 = k;
            if (this._container)
            {
                if (this._horizontal)
                {
                    this._container.setParamFlag(WindowParam.WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT, k);
                }
                else
                {
                    this._container.setParamFlag(WindowParam.WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT, k);
                }
            }
        }

        public function get _Str_3583():Boolean
        {
            return this._Str_12072;
        }

        public function get iterator():IIterator
        {
            return new ItemListIterator(this);
        }

        public function get _Str_26443():IWindow
        {
            return (this.numListItems > 0) ? this.getListItemAt(0) : null;
        }

        public function get _Str_25983():IWindow
        {
            return (this.numListItems > 0) ? this.getListItemAt((this.numListItems - 1)) : null;
        }

        override public function set clipping(k:Boolean):void
        {
            super.clipping = k;
            if (this._container)
            {
                this._container.clipping = k;
            }
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                this._container.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_6611);
                this._container.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_REMOVED, this._Str_6611);
                this._container.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_RESIZED, this._Str_6611);
                this._container.removeEventListener(WindowEvent.WINDOW_EVENT_CHILD_RELOCATED, this._Str_6611);
                super.dispose();
            }
        }

        override protected function cloneChildWindows(k:WindowController):void
        {
            var _local_2:int;
            while (_local_2 < this.numListItems)
            {
                IItemListWindow(k).addListItem(this.getListItemAt(_local_2).clone());
                _local_2++;
            }
        }

        public function get numListItems():int
        {
            return (this._container != null) ? this._container.numChildren : 0;
        }

        public function addListItem(k:IWindow):IWindow
        {
            this._updating = true;
            if (this._horizontal)
            {
                k.x = (this._scrollAreaWidth + ((this.numListItems > 0) ? this._spacing : 0));
                this._scrollAreaWidth = k.right;
                this._container.width = this._scrollAreaWidth;
            }
            else
            {
                if (this.autoArrangeItems)
                {
                    k.y = (this._scrollAreaHeight + ((this.numListItems > 0) ? this._spacing : 0));
                    this._scrollAreaHeight = k.bottom;
                }
                else
                {
                    this._scrollAreaHeight = Math.max(this._scrollAreaHeight, k.bottom);
                }
                this._container.height = this._scrollAreaHeight;
            }
            k = this._container.addChild(k);
            this._updating = false;
            return k;
        }

        public function addListItemAt(k:IWindow, _arg_2:uint):IWindow
        {
            k = this._container.addChildAt(k, _arg_2);
            this._Str_4024();
            return k;
        }

        public function getListItemAt(k:uint):IWindow
        {
            return this._container.getChildAt(k);
        }

        public function getListItemByID(k:uint):IWindow
        {
            return this._container.getChildByID(k);
        }

        public function getListItemByName(k:String):IWindow
        {
            return this._container.getChildByName(k);
        }

        public function getListItemByTag(k:String):IWindow
        {
            return this._container.getChildByTag(k);
        }

        public function getListItemIndex(k:IWindow):int
        {
            return this._container.getChildIndex(k);
        }

        public function removeListItem(k:IWindow):IWindow
        {
            k = this._container.removeChild(k);
            if (k)
            {
                this._Str_4024();
            }
            return k;
        }

        public function removeListItemAt(k:int):IWindow
        {
            var _local_2:IWindow = this._container.removeChildAt(k);
            return _local_2;
        }

        public function setListItemIndex(k:IWindow, _arg_2:int):void
        {
            this._container.setChildIndex(k, _arg_2);
        }

        public function swapListItems(k:IWindow, _arg_2:IWindow):void
        {
            this._container.swapChildren(k, _arg_2);
            this._Str_4024();
        }

        public function swapListItemsAt(k:int, _arg_2:int):void
        {
            this._container.swapChildrenAt(k, _arg_2);
            this._Str_4024();
        }

        public function groupListItemsWithID(k:uint, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._container.groupChildrenWithID(k, _arg_2, _arg_3);
        }

        public function groupListItemsWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._container.groupChildrenWithTag(k, _arg_2, _arg_3);
        }

        public function removeListItems():void
        {
            this._updating = true;
            while (this.numListItems > 0)
            {
                this._container.removeChildAt(0);
            }
            this._updating = false;
            this._Str_4024();
        }

        public function destroyListItems():void
        {
            this._updating = true;
            while (this.numListItems > 0)
            {
                this._container.removeChildAt(0).destroy();
            }
            this._updating = false;
            this._Str_4024();
        }

        public function arrangeListItems():void
        {
            this._Str_4024();
        }

        override public function populate(k:Array):void
        {
            WindowController(this._container).populate(k);
            this._Str_4024();
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:Boolean = super.update(k, _arg_2);
            switch (_arg_2.type)
            {
                case WindowEvent.WINDOW_EVENT_RESIZE:
                    this._resizing = true;
                    break;
                case WindowEvent.WINDOW_EVENT_RESIZED:
                    if (!this._scaleToFitItems)
                    {
                        if (this._horizontal)
                        {
                            this._container.height = _h;
                        }
                        else
                        {
                            this._container.width = _w;
                        }
                    }
                    this._Str_4024();
                    this._resizing = false;
                    break;
                default:
                    if ((_arg_2 is WindowEvent))
                    {
                        _local_3 = this.process((_arg_2 as WindowEvent));
                    }
            }
            return _local_3;
        }

        public function process(k:WindowEvent):Boolean
        {
            var _local_2:Boolean;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if ((k is WindowMouseEvent))
            {
                _local_3 = WindowMouseEvent(k).localX;
                _local_4 = WindowMouseEvent(k).localY;
                _local_5 = WindowMouseEvent(k).delta;
            }
            switch (k.type)
            {
                case WindowMouseEvent.WHEEL:
                    if (this._horizontal)
                    {
                        this.scrollH = (this.scrollH - ((_local_5 * this.scrollStepH) / this.maxScrollH));
                    }
                    else
                    {
                        this.scrollV = (this.scrollV - ((_local_5 * this.scrollStepV) / this.maxScrollV));
                    }
                    _local_2 = (!(this._isPartOfGridWindow));
                    break;
                case WindowMouseEvent.DOWN:
                    this._Str_19352 = _local_3;
                    this._Str_5885 = _local_4;
                    this._Str_19220 = (this._scrollOffsetH * this.maxScrollH);
                    this._Str_20088 = (this._scrollOffsetV * this.maxScrollV);
                    this._Str_11276 = true;
                    _local_2 = true;
                    break;
                case WindowMouseEvent.MOVE:
                    if (((this._Str_11276) && (!(this._disableAutoDrag))))
                    {
                        if (this._horizontal)
                        {
                            this.scrollH = (((this._Str_19220 + this._Str_19352) - _local_3) / this.maxScrollH);
                        }
                        else
                        {
                            this.scrollV = (((this._Str_20088 + this._Str_5885) - _local_4) / this.maxScrollV);
                        }
                        _local_2 = true;
                    }
                    break;
                case WindowMouseEvent.UP:
                case WindowMouseEvent.UP_OUTSIDE:
                    if (this._Str_11276)
                    {
                        this._Str_11276 = false;
                        _local_2 = true;
                    }
                    break;
            }
            return _local_2;
        }

        private function _Str_26393(k:int, _arg_2:int):void
        {
            if (!disposed)
            {
                this.scrollH = (this.scrollH - (k / this._scrollAreaWidth));
                this.scrollV = (this.scrollV - (_arg_2 / this._scrollAreaHeight));
            }
        }

        private function _Str_6611(k:WindowEvent):void
        {
            var _local_2:WindowEvent;
            switch (k.type)
            {
                case WindowEvent.WINDOW_EVENT_CHILD_REMOVED:
                    this._Str_4024();
                    return;
                case WindowEvent.WINDOW_EVENT_CHILD_RESIZED:
                    if (!this._resizing)
                    {
                        this._Str_4024();
                    }
                    return;
                case WindowEvent.WINDOW_EVENT_CHILD_RELOCATED:
                    this._Str_4024();
                    return;
                case WindowEvent.WINDOW_EVENT_RESIZED:
                    if (_Str_759)
                    {
                        _local_2 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZED, this, null);
                        _Str_759.dispatchEvent(_local_2);
                        _local_2.recycle();
                    }
                    return;
            }
        }

        protected function _Str_4024():void
        {
            var k:uint;
            var _local_2:IWindow;
            var _local_3:int;
            var _local_4:uint;
            if ((((this._arrangeListItems) && (!(this._updating))) && (this._container)))
            {
                this._updating = true;
                k = this._container.numChildren;
                if (this._horizontal)
                {
                    this._scrollAreaWidth = 0;
                    this._scrollAreaHeight = _h;
                    _local_4 = 0;
                    while (_local_4 < k)
                    {
                        _local_2 = this._container.getChildAt(_local_4);
                        if (_local_2.visible)
                        {
                            _local_2.x = this._scrollAreaWidth;
                            this._scrollAreaWidth = (this._scrollAreaWidth + (_local_2.width + this._spacing));
                            if (this._scaleToFitItems)
                            {
                                _local_3 = (_local_2.height + _local_2.y);
                                this._scrollAreaHeight = ((_local_3 > this._scrollAreaHeight) ? _local_3 : this._scrollAreaHeight);
                            }
                        }
                        _local_4++;
                    }
                    if (k > 0)
                    {
                        this._scrollAreaWidth = (this._scrollAreaWidth - this._spacing);
                    }
                }
                else
                {
                    this._scrollAreaWidth = _w;
                    this._scrollAreaHeight = 0;
                    _local_4 = 0;
                    while (_local_4 < k)
                    {
                        _local_2 = this._container.getChildAt(_local_4);
                        if (_local_2.visible)
                        {
                            _local_2.y = this._scrollAreaHeight;
                            this._scrollAreaHeight = (this._scrollAreaHeight + (_local_2.height + this._spacing));
                            if (this._scaleToFitItems)
                            {
                                _local_3 = (_local_2.width + _local_2.x);
                                this._scrollAreaWidth = ((_local_3 > this._scrollAreaWidth) ? _local_3 : this._scrollAreaWidth);
                            }
                        }
                        _local_4++;
                    }
                    if (k > 0)
                    {
                        this._scrollAreaHeight = (this._scrollAreaHeight - this._spacing);
                    }
                }
                if (this._scrollOffsetH > 0)
                {
                    if (this._scrollAreaWidth <= _w)
                    {
                        this.scrollH = 0;
                    }
                    else
                    {
                        this._container.x = -(this._scrollOffsetH * this.maxScrollH);
                    }
                }
                if (this._scrollOffsetV > 0)
                {
                    if (this._scrollAreaHeight <= _h)
                    {
                        this.scrollV = 0;
                    }
                    else
                    {
                        this._container.y = -(this._scrollOffsetV * this.maxScrollV);
                    }
                }
                this._container.height = this._scrollAreaHeight;
                this._container.width = this._scrollAreaWidth;
                this._updating = false;
            }
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.SPACING, this._spacing));
            k.push(createProperty(PropertyKeys.AUTO_ARRANGE_ITEMS, this._arrangeListItems));
            k.push(createProperty(PropertyKeys.SCALE_TO_FIT_ITEMS, this._scaleToFitItems));
            k.push(createProperty(PropertyKeys.RESIZE_ON_ITEM_UPDATE, this._Str_12072));
            k.push(createProperty(PropertyKeys.SCROLL_STEP_HORIZONTAL, this._scrollStepH));
            k.push(createProperty(PropertyKeys.SCROLL_STEP_VERTICAL, this._scrollStepV));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.SPACING:
                        this.spacing = (_local_2.value as int);
                        break;
                    case PropertyKeys.SCALE_TO_FIT_ITEMS:
                        this._Str_3640 = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.RESIZE_ON_ITEM_UPDATE:
                        this._Str_3583 = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.AUTO_ARRANGE_ITEMS:
                        this._arrangeListItems = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.SCROLL_STEP_HORIZONTAL:
                        this._scrollStepH = (_local_2.value as Number);
                        break;
                    case PropertyKeys.SCROLL_STEP_VERTICAL:
                        this._scrollStepV = (_local_2.value as Number);
                        break;
                }
            }
            super.properties = k;
        }

        public function stopDragging():void
        {
            this._Str_11276 = false;
        }

        public function set disableAutodrag(k:Boolean):void
        {
            this._disableAutoDrag = k;
        }
    }
}
