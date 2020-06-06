package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowEvent;

    public class ScrollableItemGridWindow extends WindowController implements IScrollableGridWindow 
    {
        private var _cachedGridList:IItemGridWindow;
        private var _cachedScrollBar:IScrollbarWindow;
        private var _autoHideScrollBar:Boolean = true;

        public function ScrollableItemGridWindow(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            this._scrollBar.scrollable = this._itemGrid;
            if (this._scrollBar.testStateFlag(WindowState.DISABLED))
            {
                this.hideScrollBar();
            }
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.SPACING, this.spacing));
            k.push(createProperty(PropertyKeys.AUTO_ARRANGE_ITEMS, this.autoArrangeItems));
            k.push(createProperty(PropertyKeys.SCALE_TO_FIT_ITEMS, this.scaleToFitItems));
            k.push(createProperty(PropertyKeys.RESIZE_ON_ITEM_UPDATE, this.resizeOnItemUpdate));
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
                        this.scaleToFitItems = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.RESIZE_ON_ITEM_UPDATE:
                        this.resizeOnItemUpdate = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.AUTO_ARRANGE_ITEMS:
                        this.autoArrangeItems = (_local_2.value as Boolean);
                        break;
                }
            }
            super.properties = k;
        }

        public function get autoHideScrollBar():Boolean
        {
            return this._autoHideScrollBar;
        }

        public function set autoHideScrollBar(k:Boolean):void
        {
            this._autoHideScrollBar = k;
            this.updateScrollBarVisibility();
        }

        public function get iterator():IIterator
        {
            return (this.isConstructionReady()) ? this._itemGrid.iterator : null;
        }

        public function get scrollH():Number
        {
            return this._itemGrid.scrollH;
        }

        public function set scrollH(k:Number):void
        {
            this._itemGrid.scrollH = k;
        }

        public function get scrollV():Number
        {
            return this._itemGrid.scrollV;
        }

        public function set scrollV(k:Number):void
        {
            this._itemGrid.scrollV = k;
        }

        public function get maxScrollH():int
        {
            return this._itemGrid.maxScrollH;
        }

        public function get maxScrollV():int
        {
            return this._itemGrid.maxScrollV;
        }

        public function get visibleRegion():Rectangle
        {
            return this._itemGrid.visibleRegion;
        }

        public function get scrollableRegion():Rectangle
        {
            return this._itemGrid.scrollableRegion;
        }

        public function get scrollStepH():Number
        {
            return this._itemGrid.scrollStepH;
        }

        public function set scrollStepH(k:Number):void
        {
            this._itemGrid.scrollStepH = k;
        }

        public function get scrollStepV():Number
        {
            return this._itemGrid.scrollStepV;
        }

        public function set scrollStepV(k:Number):void
        {
            this._itemGrid.scrollStepV = k;
        }

        public function get autoArrangeItems():Boolean
        {
            return this._itemGrid.autoArrangeItems;
        }

        public function set autoArrangeItems(k:Boolean):void
        {
            this._itemGrid.autoArrangeItems = k;
        }

        public function get numColumns():uint
        {
            return this._itemGrid.numColumns;
        }

        public function get numRows():uint
        {
            return this._itemGrid.numRows;
        }

        public function get numGridItems():uint
        {
            return this._itemGrid.numGridItems;
        }

        public function get shouldRebuildGridOnResize():Boolean
        {
            return this._itemGrid.shouldRebuildGridOnResize;
        }

        public function set shouldRebuildGridOnResize(k:Boolean):void
        {
            this._itemGrid.shouldRebuildGridOnResize = k;
        }

        public function get spacing():int
        {
            return this._itemGrid.spacing;
        }

        public function set spacing(k:int):void
        {
            this._itemGrid.spacing = k;
        }

        public function set verticalSpacing(k:int):void
        {
            this._itemGrid.verticalSpacing = k;
        }

        public function get scaleToFitItems():Boolean
        {
            return this._itemGrid.scaleToFitItems;
        }

        public function set scaleToFitItems(k:Boolean):void
        {
            this._itemGrid.scaleToFitItems = k;
        }

        public function get resizeOnItemUpdate():Boolean
        {
            return this._itemGrid.resizeOnItemUpdate;
        }

        public function set resizeOnItemUpdate(k:Boolean):void
        {
            this._itemGrid.resizeOnItemUpdate = k;
        }

        public function set containerResizeToColumns(k:Boolean):void
        {
        }

        public function get containerResizeToColumns():Boolean
        {
            return false;
        }

        protected function get _itemGrid():IItemGridWindow
        {
            if (!this._cachedGridList)
            {
                this._cachedGridList = (findChildByTag("_ITEMGRID") as IItemGridWindow);
            }
            return this._cachedGridList;
        }

        protected function get _scrollBar():IScrollbarWindow
        {
            if (!this._cachedScrollBar)
            {
                this._cachedScrollBar = (findChildByTag("_SCROLLBAR") as IScrollbarWindow);
                if (this._cachedScrollBar)
                {
                    this._cachedScrollBar.addEventListener(WindowEvent.WINDOW_EVENT_ENABLED, this.scrollBarEventProc);
                    this._cachedScrollBar.addEventListener(WindowEvent.WINDOW_EVENT_DISABLED, this.scrollBarEventProc);
                }
            }
            return this._cachedScrollBar;
        }

        override public function dispose():void
        {
            if (this._cachedScrollBar)
            {
                this._cachedScrollBar.removeEventListener(WindowEvent.WINDOW_EVENT_ENABLED, this.scrollBarEventProc);
                this._cachedScrollBar.removeEventListener(WindowEvent.WINDOW_EVENT_DISABLED, this.scrollBarEventProc);
                this._cachedScrollBar = null;
            }
            if (this._cachedGridList)
            {
                this._cachedGridList = null;
            }
            super.dispose();
        }

        public function addGridItem(k:IWindow):IWindow
        {
            return this._itemGrid.addGridItem(k);
        }

        public function addGridItemAt(k:IWindow, _arg_2:uint):IWindow
        {
            return this._itemGrid.addGridItemAt(k, _arg_2);
        }

        public function getGridItemAt(k:uint):IWindow
        {
            return this._itemGrid.getGridItemAt(k);
        }

        public function getGridItemByID(k:uint):IWindow
        {
            return this._itemGrid.getGridItemByID(k);
        }

        public function getGridItemByName(k:String):IWindow
        {
            return this._itemGrid.getGridItemByName(k);
        }

        public function getGridItemByTag(k:String):IWindow
        {
            return this._itemGrid.getGridItemByTag(k);
        }

        public function getGridItemIndex(k:IWindow):int
        {
            return this._itemGrid.getGridItemIndex(k);
        }

        public function removeGridItem(k:IWindow):IWindow
        {
            return this._itemGrid.removeGridItem(k);
        }

        public function removeGridItemAt(k:int):IWindow
        {
            return this._itemGrid.removeGridItemAt(k);
        }

        public function setGridItemIndex(k:IWindow, _arg_2:int):void
        {
            this._itemGrid.setGridItemIndex(k, _arg_2);
        }

        public function swapGridItems(k:IWindow, _arg_2:IWindow):void
        {
            this._itemGrid.swapGridItems(k, _arg_2);
        }

        public function swapGridItemsAt(k:int, _arg_2:int):void
        {
            this._itemGrid.swapGridItemsAt(k, _arg_2);
        }

        public function removeGridItems():void
        {
            this._itemGrid.removeGridItems();
        }

        public function destroyGridItems():void
        {
            this._itemGrid.destroyGridItems();
        }

        public function rebuildGridStructure():void
        {
            this._itemGrid.rebuildGridStructure();
        }

        protected function isConstructionReady():Boolean
        {
            return (this._itemGrid) && (this._scrollBar);
        }

        private function scrollBarEventProc(k:WindowEvent):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_ENABLED)
            {
                this.showScrollBar();
            }
            else
            {
                if (k.type == WindowEvent.WINDOW_EVENT_DISABLED)
                {
                    this.hideScrollBar();
                }
            }
        }

        private function hideScrollBar():void
        {
            if (this._scrollBar.visible)
            {
                this._scrollBar.visible = false;
            }
        }

        private function showScrollBar():void
        {
            if (!this._scrollBar.visible)
            {
                this._scrollBar.visible = true;
            }
        }

        private function updateScrollBarVisibility():void
        {
            if (this._autoHideScrollBar)
            {
                if (this._scrollBar.testStateFlag(WindowState.DISABLED))
                {
                    if (this._scrollBar.visible)
                    {
                        this.hideScrollBar();
                    }
                }
            }
            else
            {
                if (this._scrollBar.visible)
                {
                    this.showScrollBar();
                }
            }
        }
    }
}
