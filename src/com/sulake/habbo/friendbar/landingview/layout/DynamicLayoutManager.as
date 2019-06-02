package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;
    import __AS3__.vec.*;

    public class DynamicLayoutManager implements IDisposable 
    {
        public static const PLACEHOLDER_DYNAMIC_WIDGET_SLOTS:String = "placeholder_dynamic_widget_slots";
        public static const _Str_16813:int = 230;
        private static const _Str_5206:int = 5;
        private static const _Str_16031:int = 6;
        private static const _Str_16857:int = 360;

        private var _layout:_Str_3695;
        private var _fromTop:IItemListWindow;
        private var _center:IItemListWindow;
        private var _leftPane:IItemListWindow;
        private var _centerContainer:IWindowContainer;
        private var _rightPane:IItemListWindow;
        private var _rightContainer:IWindowContainer;
        private var _slots:Vector.<IWindowContainer>;
        private var _leftDownSlotRoot:IItemListWindow;
        private var _rightDownSlotRoot:IItemListWindow;
        private var _scrollExtraSpace:IWindowContainer;
        private var _separatorTemplate:IWindow;
        private var _fromTopScrollbar:IScrollbarWindow;
        private var _window:IWindowContainer;
        private var _ignoreBottomRightSlot:Boolean = false;
        private var _commonWidgetSettings:_Str_3198;
        private var _minWhiteSpaceVerticalMiddle:int = 10;
        private var _maxWhiteSpaceVerticalMiddle:int = 50;
        private var _minWhiteSpaceVerticalTop:int = 10;
        private var _maxWhiteSpaceVerticalTop:int = 80;
        private var _minWhiteSpaceHorizontal:int = 10;
        private var _maxWhiteSpaceHorizontal:int = 60;
        private var _topItemListInitialHeight:int = -1;
        private var _topItemListInitialWidth:int = -1;
        private var _initialized:Boolean = false;
        private var _currentlyResizingWindow:IWindow = null;

        public function DynamicLayoutManager(k:_Str_3695, _arg_2:_Str_3198)
        {
            this._slots = new Vector.<IWindowContainer>(_Str_5206);
            super();
            this._layout = k;
            this._commonWidgetSettings = _arg_2;
            this._window = IWindowContainer(this._layout.landingView.getXmlWindow("dynamic_widget_grid"));
            var _local_3:IWindow = this._layout.window.findChildByName(PLACEHOLDER_DYNAMIC_WIDGET_SLOTS);
            var _local_4:IWindowContainer = IWindowContainer(_local_3.parent);
            _local_4.addChildAt(this._window, _local_4.getChildIndex(_local_3));
            _local_4.removeChild(_local_3);
            this._fromTop = IItemListWindow(this._window.findChildByName("widgetlist_fromtop"));
            this._centerContainer = IWindowContainer(this._window.findChildByName("center_slots_container"));
            this._center = IItemListWindow(this._window.findChildByName("widget_slots_center_scrollable"));
            this._leftPane = IItemListWindow(this._window.findChildByName("widget_slots_center_left"));
            this._rightPane = IItemListWindow(this._window.findChildByName("widget_slots_center_right"));
            this._rightContainer = IWindowContainer(this._window.findChildByName("widget_slots_right"));
            this._leftDownSlotRoot = IItemListWindow(this._window.findChildByName("widget_slot_4_root"));
            this._rightDownSlotRoot = IItemListWindow(this._window.findChildByName("widget_slot_5_root"));
            this._separatorTemplate = this._layout.landingView.getXmlWindow("dynamic_widget_grid_separator");
            var _local_5:int;
            while (_local_5 < 6)
            {
                this._slots[_local_5] = IWindowContainer(this._window.findChildByName(("widget_slot_" + (_local_5 + 1))));
                if (this._slots[_local_5] != null)
                {
                    this._slots[_local_5].addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_21981);
                }
                _local_5++;
            }
            this._fromTopScrollbar = IScrollbarWindow(this._window.findChildByName("center_container_scrollbar"));
            this._scrollExtraSpace = IWindowContainer(this._window.findChildByName("scroll_extra_space_container"));
            var _local_6:int = this._layout.landingView._Str_11168;
            var _local_7:int = this._layout.landingView._Str_9931;
            this._leftPane.width = _local_6;
            this._leftPane.limits.maxWidth = _local_6;
            this._leftDownSlotRoot.width = _local_6;
            this._rightPane.width = _local_7;
            this._rightContainer.width = _local_7;
            this._rightContainer.limits.maxWidth = _local_7;
            this._rightDownSlotRoot.width = _local_7;
            this._center.arrangeListItems();
        }

        public function dispose():void
        {
            var k:int;
            if (!this.disposed)
            {
                k = 0;
                while (k < 6)
                {
                    if (this._slots[k])
                    {
                        this._slots[k].dispose();
                    }
                    this._slots[k] = null;
                    k++;
                }
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
                this._layout = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._layout == null;
        }

        public function _Str_23980(k:int):IWindowContainer
        {
            return this._slots[k];
        }

        public function _Str_20363(k:int, _arg_2:String):void
        {
            var _local_3:IItemListWindow;
            var _local_4:ITextWindow;
            switch (k)
            {
                case 4:
                    _local_3 = this._leftDownSlotRoot;
                    break;
                case 5:
                    _local_3 = this._rightDownSlotRoot;
                    break;
                default:
                    _local_3 = null;
            }
            if (_local_3)
            {
                if (_local_3.numListItems < 2)
                {
                    _local_3.addListItemAt(this._separatorTemplate.clone(), 0);
                }
                _local_4 = ITextWindow(IItemListWindow(_local_3.getListItemAt(0)).getListItemByName("separator_title"));
                _local_4.caption = (("${" + _arg_2) + "}");
                if (this._commonWidgetSettings != null)
                {
                    if (this._commonWidgetSettings._Str_16938)
                    {
                        _local_4.textColor = this._commonWidgetSettings.textColor;
                    }
                    if (this._commonWidgetSettings._Str_16698)
                    {
                        _local_4.etchingColor = this._commonWidgetSettings.etchingColor;
                    }
                    if (this._commonWidgetSettings._Str_18420)
                    {
                        _local_4.etchingPosition = this._commonWidgetSettings.etchingPosition;
                    }
                }
            }
        }

        private function _Str_5410(k:int):Boolean
        {
            return this._slots[k].numChildren > 0;
        }

        public function _Str_24842(k:int, _arg_2:int):void
        {
            this._fromTop.height = Math.min(_arg_2, this._Str_19625);
            this._fromTop.height = Math.max(_Str_16857, this._fromTop.height);
            this._fromTop.width = Math.min(k, this._Str_19568);
            this._Str_20032();
        }

        public function set _Str_22592(k:int):void
        {
            var _local_2:int = this._layout.window.width;
            k = (Math.min(k, _local_2) - this._window.x);
            this._fromTopScrollbar.x = (k - this._fromTopScrollbar.width);
        }

        public function get _Str_19625():int
        {
            if (this._topItemListInitialHeight == -1)
            {
                this._topItemListInitialHeight = this._fromTop.height;
            }
            return this._topItemListInitialHeight;
        }

        public function get _Str_19568():int
        {
            if (this._topItemListInitialWidth == -1)
            {
                this._topItemListInitialWidth = this._fromTop.width;
            }
            return this._topItemListInitialWidth;
        }

        private function _Str_20032():void
        {
            var k:int;
            this._Str_24621();
            this._Str_23270();
            this._Str_25588();
            this._Str_23636();
            this._Str_23499((this._Str_17991 - this._fromTop.height));
            this._Str_21981();
            this._Str_25872();
            this._Str_24686();
            if (!this._initialized)
            {
                k = 0;
                while (k < 6)
                {
                    if (this._slots[k] != null)
                    {
                        this._slots[k].addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_6199);
                    }
                    k++;
                }
            }
            this._initialized = true;
            this._currentlyResizingWindow = null;
        }

        private function _Str_6199(k:WindowEvent=null):void
        {
            if (this._currentlyResizingWindow == null)
            {
                this._currentlyResizingWindow = k.window;
                this._Str_20032();
            }
        }

        private function _Str_24621():void
        {
            if (!this._Str_5410(0))
            {
                this._slots[0].height = 0;
            }
            var k:int = 1;
            while (k <= 4)
            {
                if (!this._Str_5410(k))
                {
                    this._slots[k].height = 1;
                }
                k++;
            }
        }

        private function _Str_25588():void
        {
            var k:int;
            if (((this._Str_5410(3)) || (this._Str_5410(4))))
            {
                k = Math.max(this._slots[3].height, this._slots[4].height);
                this._slots[3].height = k;
                this._slots[4].height = k;
                if (this._Str_5410(3))
                {
                    this._slots[3].getChildAt(0).y = 0;
                    this._slots[3].width = this._layout.landingView._Str_11168;
                }
                if (this._Str_5410(4))
                {
                    this._slots[4].getChildAt(0).y = 0;
                    this._slots[4].width = this._layout.landingView._Str_9931;
                }
            }
        }

        private function _Str_23270():int
        {
            var k:int;
            if (((this._Str_5410(1)) || (this._Str_5410(2))))
            {
                if (!this._ignoreBottomRightSlot)
                {
                    k = Math.max(this._slots[1].height, this._slots[2].height);
                    this._slots[1].height = k;
                    this._slots[2].height = k;
                }
                if (this._Str_5410(1))
                {
                    this._slots[1].getChildAt(0).y = 0;
                    this._slots[1].width = this._layout.landingView._Str_11168;
                }
                if (this._Str_5410(2))
                {
                    this._slots[2].getChildAt(0).y = 0;
                    this._slots[2].width = this._layout.landingView._Str_9931;
                }
            }
            return k;
        }

        private function _Str_24686():void
        {
            var k:int = (this._topItemListInitialWidth - this._fromTop.width);
            if (k > (this._maxWhiteSpaceHorizontal - this._minWhiteSpaceHorizontal))
            {
                this._center.spacing = this._minWhiteSpaceHorizontal;
            }
            else
            {
                this._center.spacing = Math.min(this._maxWhiteSpaceHorizontal, (this._maxWhiteSpaceHorizontal - k));
            }
        }

        private function _Str_23499(k:int):void
        {
            var _local_2:int = (this._maxWhiteSpaceVerticalMiddle - this._minWhiteSpaceVerticalMiddle);
            var _local_3:int = (this._maxWhiteSpaceVerticalTop - this._minWhiteSpaceVerticalTop);
            k = (k + (this._minWhiteSpaceVerticalMiddle + this._minWhiteSpaceVerticalTop));
            if (k <= 0)
            {
                this._fromTop.spacing = this._minWhiteSpaceVerticalTop;
                this._leftPane.spacing = this._maxWhiteSpaceVerticalMiddle;
                this._rightPane.spacing = this._maxWhiteSpaceVerticalMiddle;
            }
            else
            {
                if (k < _local_2)
                {
                    this._fromTop.spacing = this._minWhiteSpaceVerticalTop;
                    this._leftPane.spacing = (this._maxWhiteSpaceVerticalMiddle - k);
                    this._rightPane.spacing = (this._maxWhiteSpaceVerticalMiddle - k);
                }
                else
                {
                    if (k < (_local_2 + _local_3))
                    {
                        this._fromTop.spacing = this._minWhiteSpaceVerticalTop;
                        this._leftPane.spacing = this._minWhiteSpaceVerticalMiddle;
                        this._rightPane.spacing = this._minWhiteSpaceVerticalMiddle;
                    }
                    else
                    {
                        this._fromTop.spacing = this._minWhiteSpaceVerticalTop;
                        this._leftPane.spacing = this._minWhiteSpaceVerticalMiddle;
                        this._rightPane.spacing = this._minWhiteSpaceVerticalMiddle;
                    }
                }
            }
        }

        private function _Str_25872():void
        {
            this._fromTop.invalidate();
            if (this._fromTop.height < (this._Str_17991 - _Str_16031))
            {
                this._fromTopScrollbar.y = this._fromTop.y;
                this._fromTopScrollbar.height = this._fromTop.height;
                this._fromTopScrollbar.visible = true;
                this._fromTopScrollbar.scrollV = 0;
                this._scrollExtraSpace.y = this._Str_17991;
                this._scrollExtraSpace.height = 25;
                this._layout.landingView._Str_17047 = true;
            }
            else
            {
                this._scrollExtraSpace.y = 0;
                this._scrollExtraSpace.height = 1;
                this._layout.landingView._Str_17047 = false;
            }
        }

        private function _Str_23636():void
        {
            this._center.spacing = this._maxWhiteSpaceHorizontal;
            this._leftPane.spacing = this._maxWhiteSpaceVerticalMiddle;
            this._rightPane.spacing = this._maxWhiteSpaceVerticalMiddle;
            this._fromTop.spacing = this._maxWhiteSpaceVerticalTop;
            this._fromTopScrollbar.visible = false;
            this._leftPane.invalidate();
            this._rightPane.invalidate();
            this._center.invalidate();
            this._fromTop.invalidate();
            this._centerContainer.invalidate();
        }

        private function get _Str_17991():int
        {
            var _local_3:int;
            var k:int;
            var _local_2:int;
            while (_local_2 < this._fromTop.numListItems)
            {
                _local_3 = this._fromTop.getListItemAt(_local_2).height;
                k = (k + _local_3);
                if (_local_2 > 0)
                {
                    k = (k + this._fromTop.spacing);
                }
                _local_2++;
            }
            return k;
        }

        private function _Str_21981(k:WindowEvent=null):void
        {
            if (((!(k == null)) && (!(this._initialized))))
            {
                return;
            }
            this._leftPane.invalidate();
            this._rightPane.invalidate();
            this._center.height = Math.max(this._leftPane.height, this._rightPane.height);
            this._centerContainer.height = Math.max(this._leftPane.height, this._rightPane.height);
        }

        public function set _Str_24583(k:Boolean):void
        {
            this._ignoreBottomRightSlot = k;
        }

        private function _Str_25885():void
        {
            Logger.log("***** Final positions *****");
            var k:Rectangle = new Rectangle();
            this._window.getGlobalRectangle(k);
            Logger.log(("Window rect\t\t\t\t\t\t: " + k));
            this._fromTop.getGlobalRectangle(k);
            Logger.log(("All items list rect\t\t\t\t: " + k));
            this._centerContainer.getGlobalRectangle(k);
            Logger.log(("Center container itemlist rect\t: " + k));
            this._center.getGlobalRectangle(k);
            Logger.log(("Center itemlist rect\t\t\t: " + k));
            this._leftPane.getGlobalRectangle(k);
            Logger.log(("Left pane itemlist rect\t\t\t: " + k));
            this._rightPane.getGlobalRectangle(k);
            Logger.log(("Right pane itemlist rect\t\t: " + k));
            this._rightContainer.getGlobalRectangle(k);
            Logger.log(("Right pane container rect\t\t: " + k));
            var _local_2:int;
            while (_local_2 < 5)
            {
                this._slots[_local_2].getGlobalRectangle(k);
                Logger.log(((("Slot " + _local_2) + " rect\t\t\t    : ") + k));
                _local_2++;
            }
        }
    }
}
