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
        private var _Str_12337:IItemListWindow;
        private var _Str_3397:IScrollbarWindow;
        private var _Str_5880:Boolean = true;

        public function ScrollableItemListWindow(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            this._Str_2734.scrollable = this._Str_2338;
            if (((this._Str_2734.testStateFlag(WindowState.DISABLED)) && (this._Str_5880)))
            {
                this._Str_7763();
            }
        }

        override public function dispose():void
        {
            if (this._Str_3397)
            {
                this._Str_3397.removeEventListener(WindowEvent.WINDOW_EVENT_ENABLED, this._Str_6204);
                this._Str_3397.removeEventListener(WindowEvent.WINDOW_EVENT_DISABLED, this._Str_6204);
                this._Str_3397 = null;
            }
            if (this._Str_12337)
            {
                this._Str_12337 = null;
            }
            super.dispose();
        }

        protected function get _Str_2338():IItemListWindow
        {
            if (!this._Str_12337)
            {
                this._Str_12337 = (findChildByTag("_ITEMLIST") as IItemListWindow);
            }
            return this._Str_12337;
        }

        public function get scrollableWindow():IWindow
        {
            return this._Str_2338;
        }

        protected function get _Str_2734():IScrollbarWindow
        {
            if (!this._Str_3397)
            {
                this._Str_3397 = (findChildByTag("_SCROLLBAR") as IScrollbarWindow);
                if (this._Str_3397)
                {
                    this._Str_3397.addEventListener(WindowEvent.WINDOW_EVENT_ENABLED, this._Str_6204);
                    this._Str_3397.addEventListener(WindowEvent.WINDOW_EVENT_DISABLED, this._Str_6204);
                }
            }
            return this._Str_3397;
        }

        private function _Str_6204(k:WindowEvent):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_ENABLED)
            {
                this._Str_11231();
            }
            else
            {
                if (((k.type == WindowEvent.WINDOW_EVENT_DISABLED) && (this._Str_5880)))
                {
                    this._Str_7763();
                }
            }
        }

        private function _Str_7763():void
        {
            if (this._Str_2734.visible)
            {
                this._Str_2734.visible = false;
                this._Str_2338.width = _w;
            }
        }

        private function _Str_11231():void
        {
            if (!this._Str_2734.visible)
            {
                this._Str_2734.visible = true;
                this._Str_2338.width = (_w - this._Str_2734.width);
            }
        }

        private function _Str_17242(k:Boolean=false):void
        {
            if (this._Str_5880)
            {
                if (this._Str_2734.testStateFlag(WindowState.DISABLED))
                {
                    if (this._Str_2734.visible)
                    {
                        this._Str_7763();
                    }
                }
            }
            else
            {
                if (((k) || (this._Str_2734.visible)))
                {
                    this._Str_11231();
                }
            }
        }

        protected function _Str_17415():Boolean
        {
            return (this._Str_2338) && (this._Str_2734);
        }

        public function set _Str_6416(k:Boolean):void
        {
            this._Str_5880 = k;
            this._Str_17242(true);
        }

        public function get _Str_6416():Boolean
        {
            return this._Str_5880;
        }

        public function get iterator():IIterator
        {
            return (this._Str_17415()) ? this._Str_2338.iterator : null;
        }

        public function get scrollH():Number
        {
            return this._Str_2338.scrollH;
        }

        public function get scrollV():Number
        {
            return this._Str_2338.scrollV;
        }

        public function set scrollH(k:Number):void
        {
            this._Str_2338.scrollH = k;
        }

        public function set scrollV(k:Number):void
        {
            this._Str_2338.scrollV = k;
        }

        public function get maxScrollH():int
        {
            return this._Str_2338.maxScrollH;
        }

        public function get maxScrollV():int
        {
            return this._Str_2338.maxScrollV;
        }

        public function get _Str_3707():Rectangle
        {
            return this._Str_2338._Str_3707;
        }

        public function get visibleRegion():Rectangle
        {
            return this._Str_2338.visibleRegion;
        }

        public function get scrollStepH():Number
        {
            return this._Str_2338.scrollStepH;
        }

        public function get scrollStepV():Number
        {
            return this._Str_2338.scrollStepV;
        }

        public function set scrollStepH(k:Number):void
        {
            this._Str_2338.scrollStepH = k;
        }

        public function set scrollStepV(k:Number):void
        {
            this._Str_2338.scrollStepV = k;
        }

        public function get spacing():int
        {
            return this._Str_2338.spacing;
        }

        public function set spacing(k:int):void
        {
            this._Str_2338.spacing = k;
        }

        public function get _Str_3640():Boolean
        {
            return this._Str_2338._Str_3640;
        }

        public function set _Str_3640(k:Boolean):void
        {
            this._Str_2338._Str_3640 = k;
        }

        public function get autoArrangeItems():Boolean
        {
            return this._Str_2338.autoArrangeItems;
        }

        public function set autoArrangeItems(k:Boolean):void
        {
            this._Str_2338.autoArrangeItems = k;
        }

        public function set _Str_3583(k:Boolean):void
        {
            this._Str_2338._Str_3583 = k;
        }

        public function get _Str_3583():Boolean
        {
            return this._Str_2338._Str_3583;
        }

        public function get numListItems():int
        {
            return this._Str_2338.numListItems;
        }

        public function addListItem(k:IWindow):IWindow
        {
            return this._Str_2338.addListItem(k);
        }

        public function addListItemAt(k:IWindow, _arg_2:uint):IWindow
        {
            return this._Str_2338.addListItemAt(k, _arg_2);
        }

        public function getListItemAt(k:uint):IWindow
        {
            return this._Str_2338.getListItemAt(k);
        }

        public function getListItemByID(k:uint):IWindow
        {
            return this._Str_2338.getListItemByID(k);
        }

        public function getListItemByName(k:String):IWindow
        {
            return this._Str_2338.getListItemByName(k);
        }

        public function getListItemByTag(k:String):IWindow
        {
            return this._Str_2338.getListItemByTag(k);
        }

        public function getListItemIndex(k:IWindow):int
        {
            return this._Str_2338.getListItemIndex(k);
        }

        public function removeListItem(k:IWindow):IWindow
        {
            return this._Str_2338.removeListItem(k);
        }

        public function removeListItemAt(k:int):IWindow
        {
            return this._Str_2338.removeListItemAt(k);
        }

        public function setListItemIndex(k:IWindow, _arg_2:int):void
        {
            this._Str_2338.setListItemIndex(k, _arg_2);
        }

        public function swapListItems(k:IWindow, _arg_2:IWindow):void
        {
            this._Str_2338.swapListItems(k, _arg_2);
        }

        public function swapListItemsAt(k:int, _arg_2:int):void
        {
            this._Str_2338.swapListItemsAt(k, _arg_2);
        }

        public function groupListItemsWithID(k:uint, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._Str_2338.groupListItemsWithID(k, _arg_2, _arg_3);
        }

        public function groupListItemsWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            return this._Str_2338.groupListItemsWithTag(k, _arg_2, _arg_3);
        }

        public function removeListItems():void
        {
            this._Str_2338.removeListItems();
        }

        public function destroyListItems():void
        {
            this._Str_2338.destroyListItems();
        }

        public function arrangeListItems():void
        {
            this._Str_2338.arrangeListItems();
        }

        public function stopDragging():void
        {
            this._Str_2338.stopDragging();
        }

        public function set disableAutodrag(k:Boolean):void
        {
            this._Str_2338.disableAutodrag = k;
        }

        public function get _Str_8004():Boolean
        {
            return this._Str_2338._Str_8004;
        }

        public function set _Str_8004(k:Boolean):void
        {
            this._Str_2338.disableAutodrag = k;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.SPACING, this.spacing));
            k.push(createProperty(PropertyKeys.AUTO_ARRANGE_ITEMS, this.autoArrangeItems));
            k.push(createProperty(PropertyKeys.SCALE_TO_FIT_ITEMS, this._Str_3640));
            k.push(createProperty(PropertyKeys.RESIZE_ON_ITEM_UPDATE, this._Str_3583));
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
                        this.autoArrangeItems = (_local_2.value as Boolean);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
