package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class ScrollableItemListWindow extends WindowController implements IScrollableListWindow 
    {
        private var _cachedItemList:IItemListWindow;
        private var _cachedScrollBar:IScrollbarWindow;
        private var _autoHideScrollBar:Boolean = true;

        public function ScrollableItemListWindow(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            this._scrollBar.scrollable = this._itemList;
            if (((this._scrollBar.testStateFlag(WindowState.DISABLED)) && (this._autoHideScrollBar)))
            {
                this.hideScrollBar();
            }
        }

        override public function dispose():void
        {
            if (this._cachedScrollBar)
            {
                this._cachedScrollBar.removeEventListener(WindowEvent.WINDOW_EVENT_ENABLED, this.scrollBarEventProc);
                this._cachedScrollBar.removeEventListener(WindowEvent.WINDOW_EVENT_DISABLED, this.scrollBarEventProc);
                this._cachedScrollBar = null;
            }
            if (this._cachedItemList)
            {
                this._cachedItemList = null;
            }
            super.dispose();
        }

        protected function get _itemList():IItemListWindow
        {
            if (!this._cachedItemList)
            {
                this._cachedItemList = (findChildByTag("_ITEMLIST") as IItemListWindow);
            }
            return this._cachedItemList;
        }

        public function get scrollableWindow():IWindow
        {
            return this._itemList;
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

        private function scrollBarEventProc(k:WindowEvent):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_ENABLED)
            {
                this.showScrollBar();
            }
            else
            {
                if (((k.type == WindowEvent.WINDOW_EVENT_DISABLED) && (this._autoHideScrollBar)))
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
                this._itemList.width = _w;
            }
        }

        private function showScrollBar():void
        {
            if (!this._scrollBar.visible)
            {
                this._scrollBar.visible = true;
                this._itemList.width = (_w - this._scrollBar.width);
            }
        }

        private function updateScrollBarVisibility(k:Boolean=false):void
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
                if (((k) || (this._scrollBar.visible)))
                {
                    this.showScrollBar();
                }
            }
        }

        protected function isConstructionReady():Boolean
        {
            return (this._itemList) && (this._scrollBar);
        }

        public function set autoHideScrollBar(k:Boolean):void
        {
            this._autoHideScrollBar = k;
            this.updateScrollBarVisibility(true);
        }

        public function get autoHideScrollBar():Boolean
        {
            return this._autoHideScrollBar;
        }

        public function get iterator():IIterator
        {
            return (this.isConstructionReady()) ? this._itemList.iterator : null;
        }

        public function get scrollH():Number
        {
            return this._itemList.scrollH;
        }

        public function get scrollV():Number
        {
            return this._itemList.scrollV;
        }

        public function set scrollH(k:Number):void
        {
            this._itemList.scrollH = k;
        }

        public function set scrollV(k:Number):void
        {
            this._itemList.scrollV = k;
        }

        public function get maxScrollH():int
        {
            return this._itemList.maxScrollH;
        }

        public function get maxScrollV():int
        {
            return this._itemList.maxScrollV;
        }

        public function get visibleRegion():Rectangle
        {
            return this._itemList.visibleRegion;
        }

        public function get scrollableRegion():Rectangle
        {
            return this._itemList.scrollableRegion;
        }

        public function get scrollStepH():Number
        {
            return this._itemList.scrollStepH;
        }

        public function get scrollStepV():Number
        {
            return this._itemList.scrollStepV;
        }

        public function set scrollStepH(k:Number):void
        {
            this._itemList.scrollStepH = k;
        }

        public function set scrollStepV(k:Number):void
        {
            this._itemList.scrollStepV = k;
        }

        public function get spacing():int
        {
            return this._itemList.spacing;
        }

        public function set spacing(k:int):void
        {
            this._itemList.spacing = k;
        }

        public function get scaleToFitItems():Boolean
        {
            return this._itemList.scaleToFitItems;
        }

        public function set scaleToFitItems(k:Boolean):void
        {
            this._itemList.scaleToFitItems = k;
        }

        public function get autoArrangeItems():Boolean
        {
            return this._itemList.autoArrangeItems;
        }

        public function set autoArrangeItems(k:Boolean):void
        {
            this._itemList.autoArrangeItems = k;
        }

        public function set resizeOnItemUpdate(k:Boolean):void
        {
            this._itemList.resizeOnItemUpdate = k;
        }

        public function get resizeOnItemUpdate():Boolean
        {
            return this._itemList.resizeOnItemUpdate;
        }

        public function get numListItems():int
        {
            return this._itemList.numListItems;
        }

        public function addListItem(k:IWindow):IWindow
        {
            return this._itemList.addListItem(k);
        }

        public function addListItemAt(k:IWindow, _arg_2:uint):IWindow
        {
            return this._itemList.addListItemAt(k, _arg_2);
        }

        public function getListItemAt(k:uint):IWindow
        {
            return this._itemList.getListItemAt(k);
        }

        public function getListItemByID(k:uint):IWindow
        {
            return this._itemList.getListItemByID(k);
        }

        public function getListItemByName(k:String):IWindow
        {
            return this._itemList.getListItemByName(k);
        }

        public function getListItemByTag(k:String):IWindow
        {
            return this._itemList.getListItemByTag(k);
        }

        public function getListItemIndex(k:IWindow):int
        {
            return this._itemList.getListItemIndex(k);
        }

        public function removeListItem(k:IWindow):IWindow
        {
            return this._itemList.removeListItem(k);
        }

        public function removeListItemAt(k:int):IWindow
        {
            return this._itemList.removeListItemAt(k);
        }

        public function setListItemIndex(k:IWindow, _arg_2:int):void
        {
            this._itemList.setListItemIndex(k, _arg_2);
        }

        public function swapListItems(k:IWindow, _arg_2:IWindow):void
        {
            this._itemList.swapListItems(k, _arg_2);
        }

        public function swapListItemsAt(k:int, _arg_2:int):void
        {
            this._itemList.swapListItemsAt(k, _arg_2);
        }

        public function groupListItemsWithID(k:uint, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._itemList.groupListItemsWithID(k, _arg_2, _arg_3);
        }

        public function groupListItemsWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._itemList.groupListItemsWithTag(k, _arg_2, _arg_3);
        }

        public function removeListItems():void
        {
            this._itemList.removeListItems();
        }

        public function destroyListItems():void
        {
            this._itemList.destroyListItems();
        }

        public function arrangeListItems():void
        {
            this._itemList.arrangeListItems();
        }

        public function stopDragging():void
        {
            this._itemList.stopDragging();
        }

        public function set disableAutodrag(k:Boolean):void
        {
            this._itemList.disableAutodrag = k;
        }

        public function get isPartOfGridWindow():Boolean
        {
            return this._itemList.isPartOfGridWindow;
        }

        public function set isPartOfGridWindow(k:Boolean):void
        {
            this._itemList.disableAutodrag = k;
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
    }
}
