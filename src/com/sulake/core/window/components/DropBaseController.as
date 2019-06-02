package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.events.WindowTouchEvent;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;
    import __AS3__.vec.*;

    public class DropBaseController extends InteractiveController implements ITouchAwareWindow 
    {
        protected static const _Str_5734:Number = 0.5;
        protected static const _DROPLIST_TITLETEXT:String = "_DROPLIST_TITLETEXT";
        protected static const _DROPLIST_ITEMLIST:String = "_DROPLIST_ITEMLIST";
        protected static const _DROPLIST_REGION:String = "_DROPLIST_REGION";
        private static const _Str_9883:int = 30;

        private var _Str_16910:Boolean = false;
        private var _Str_14725:Boolean = false;
        protected var _Str_3139:Vector.<IWindow>;
        protected var _Str_3371:int = -1;
        protected var _Str_3943:Boolean = false;
        protected var _Str_3565:DropBaseController;

        public function DropBaseController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_3139 = new Vector.<IWindow>();
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            this._Str_3679().addEventListener(WindowMouseEvent.DOWN, this._Str_22124);
        }

        public function get selection():int
        {
            return this._Str_3371;
        }

        public function set selection(k:int):void
        {
            if (k > (this.numMenuItems - 1))
            {
                throw (new Error("Menu selection index out of range!"));
            }
            var _local_2:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_SELECT, this, null, true);
            this.update(this, _local_2);
            if (!_local_2.isWindowOperationPrevented())
            {
                _local_2.recycle();
                this._Str_3371 = k;
                this.closeExpandedMenuView();
                _local_2 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_SELECTED, this, null);
                this.update(this, _local_2);
            }
            _local_2.recycle();
        }

        override public function set caption(k:String):void
        {
            super.caption = k;
            var _local_2:ILabelWindow = this._Str_9315();
            if (_local_2)
            {
                _local_2.text = k;
            }
        }

        override public function dispose():void
        {
            var k:IWindow;
            this._Str_3679().removeEventListener(WindowMouseEvent.DOWN, this._Str_22124);
            if (((!(this._Str_3565 == null)) && (!(this._Str_3565.disposed))))
            {
                this._Str_3565.destroy();
                this._Str_3565 = null;
            }
            for each (k in this._Str_3139)
            {
                k.dispose();
            }
            this._Str_3139 = null;
            super.dispose();
        }

        override public function activate():Boolean
        {
            if (this._Str_3943)
            {
                return true;
            }
            return super.activate();
        }

        public function _Str_9315():ILabelWindow
        {
            return getChildByName(_DROPLIST_TITLETEXT) as ILabelWindow;
        }

        public function _Str_8828():IItemListWindow
        {
            return getChildByName(_DROPLIST_ITEMLIST) as IItemListWindow;
        }

        public function _Str_3679():IRegionWindow
        {
            return getChildByName(_DROPLIST_REGION) as IRegionWindow;
        }

        override public function populate(k:Array):void
        {
            var _local_2:IWindow;
            this._Str_3943 = true;
            this.closeExpandedMenuView();
            this._Str_3371 = -1;
            while (this._Str_3139.length > 0)
            {
                _local_2 = this._Str_3139.pop();
                if (k.indexOf(_local_2) == -1)
                {
                    _local_2.dispose();
                }
            }
            var _local_3:uint;
            while (_local_3 < k.length)
            {
                this._Str_3139.push(k[_local_3]);
                _local_3++;
            }
        }

        protected function _Str_9561():void
        {
            if (!this._Str_3943)
            {
                if (this.open())
                {
                    if (this.numMenuItems > 0)
                    {
                        this._Str_3943 = true;
                        this.populateExpandedMenu(this._Str_3139, this._Str_25760(), this._Str_26470);
                    }
                }
            }
        }

        protected function closeExpandedMenuView():void
        {
            var k:IDropListItemWindow;
            var _local_2:IWindow;
            var _local_3:IItemListWindow;
            var _local_4:int;
            var _local_5:ILabelWindow;
            if (this.close())
            {
                if (this._Str_3565 != null)
                {
                    _local_3 = this._Str_3565._Str_8828();
                    _local_3.autoArrangeItems = false;
                    _local_4 = 0;
                    while (_local_4 < _local_3.numListItems)
                    {
                        k = (_local_3.getListItemAt(_local_4) as IDropListItemWindow);
                        if (k)
                        {
                            _local_2 = k.value;
                            if (this._Str_3139.indexOf(_local_2) > -1)
                            {
                                k.value = null;
                                _local_2.setParamFlag(WindowParam.WINDOW_PARAM_ROUTE_INPUT_EVENTS_TO_PARENT, false);
                            }
                        }
                        _local_4++;
                    }
                    this._Str_3565.destroy();
                    this._Str_3565 = null;
                }
                this._Str_3943 = false;
                if (!disposed)
                {
                    _local_5 = this._Str_9315();
                    _local_3 = this._Str_8828();
                    if (_local_3)
                    {
                        while (_local_3.numListItems > 0)
                        {
                            _local_3.removeListItemAt(0);
                        }
                        if (((this._Str_3371 < this.numMenuItems) && (this._Str_3371 > -1)))
                        {
                            _local_2 = this._Str_3139[this._Str_3371];
                            _local_2.x = 0;
                            _local_2.y = 0;
                            _local_3.addListItem(_local_2);
                            _local_3.height = _local_2.height;
                            _local_5.visible = false;
                        }
                        else
                        {
                            _local_5.visible = true;
                        }
                    }
                }
            }
        }

        private function _Str_25760():DropBaseController
        {
            var k:Rectangle = new Rectangle();
            getGlobalRectangle(k);
            if (((this._Str_3565 == null) || (this._Str_3565.disposed)))
            {
                this._Str_3565 = (context.create((name + "::subMenu"), "", type, _style, ((WindowParam.WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN | uint(((this._Str_16910) ? WindowParam.WINDOW_PARAM_ON_RESIZE_ALIGN_BOTTOM : 0))) | WindowParam.WINDOW_PARAM_NULL), k, this._Str_26470, null, 0, null, "", [WindowController.TAG_EXCLUDE]) as DropBaseController);
            }
            else
            {
                this._Str_3565.setGlobalRectangle(k);
            }
            this._Str_3565.activate();
            return this._Str_3565;
        }

        protected function populateExpandedMenu(k:Vector.<IWindow>, _arg_2:DropBaseController, _arg_3:Function):void
        {
            var _local_6:IDropListItemWindow;
            var _local_12:IWindow;
            var _local_4:IItemListWindow = _arg_2._Str_8828();
            _local_4.autoArrangeItems = false;
            _arg_2._Str_3679().visible = false;
            var _local_5:uint = k.length;
            var _local_7:int = _local_4.width;
            var _local_8:int = _local_7;
            var _local_9:int;
            var _local_10:uint;
            while (_local_10 < _local_5)
            {
                _local_12 = k[_local_10];
                _local_6 = (context.create((((name + "::menuItem[") + _local_10) + "]"), _local_12.caption, WindowType.WINDOW_TYPE_DROPLIST_ITEM, _style, ((((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED) | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR) | WindowParam.WINDOW_PARAM_NULL), null, _arg_3, null, _local_10, null, "", [WindowController.TAG_EXCLUDE]) as DropListItemController);
                _local_12.x = 0;
                _local_12.y = 0;
                _local_12.setParamFlag(WindowParam.WINDOW_PARAM_ROUTE_INPUT_EVENTS_TO_PARENT, true);
                _local_6.value = _local_12;
                _local_6.width = _local_6.value.width;
                _local_6.height = _local_6.value.height;
                _local_6.limits.minWidth = _local_7;
                _local_8 = Math.max(_local_8, _local_6.width);
                _local_9 = (_local_9 + _local_6.height);
                _local_4.addListItem(_local_6);
                _local_10++;
            }
            if (_local_8 > _local_7)
            {
                _arg_2.width = (_arg_2.width + (_local_8 - _local_4.width));
                _local_10 = 0;
                while (_local_10 < _local_5)
                {
                    _local_4.getListItemAt(_local_10).limits.minWidth = _local_8;
                    _local_10++;
                }
            }
            var _local_11:IWindow = context.create((name + "::padding"), "", WindowType.WINDOW_TYPE_CONTAINER, _style, (((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_FIXED | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_FIXED) | WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT) | WindowParam.WINDOW_PARAM_NULL), new Rectangle(0, 0, 1, 3), null, null, 0, null, "", [WindowController.TAG_EXCLUDE]);
            _local_4.addListItem(_local_11);
            _local_4.autoArrangeItems = true;
            _local_9 = (_local_9 + _local_11.height);
            _local_9 = (_local_9 + (_local_4.spacing * _local_4.numListItems));
            _arg_2.height = Math.max(_arg_2.height, (_local_9 + 4));
            if ((param & WindowParam.WINDOW_PARAM_BOUND_TO_PARENT_RECT))
            {
                this._Str_22994(_arg_2);
            }
            else
            {
                this._Str_18287(_arg_2);
            }
            _arg_2.activate();
            _local_4.height = Math.max(_local_4.height, (_arg_2.height - 4));
            if (((this._Str_3371 > -1) && (_local_5)))
            {
                _local_4.getListItemAt(this._Str_3371).setStateFlag(WindowState.SELECTED, true);
            }
        }

        protected function _Str_22994(k:IWindow):void
        {
            var _local_2:Rectangle = new Rectangle();
            k.getGlobalRectangle(_local_2);
            var _local_3:Rectangle = new Rectangle();
            parent.getGlobalRectangle(_local_3);
            if (_local_2.height > _local_3.height)
            {
                k.offset(0, (_local_3.top - _local_2.top));
                k.scale(0, (_local_3.height - _local_2.height));
                k.getGlobalRectangle(_local_2);
            }
            if (_local_2.bottom > _local_3.bottom)
            {
                k.offset(0, (_local_3.bottom - _local_2.bottom));
            }
            else
            {
                if (_local_2.top < _local_3.top)
                {
                    k.offset(0, (_local_2.top - _local_3.top));
                }
            }
            if (_local_2.left < _local_3.left)
            {
                k.offset((_local_2.left - _local_3.left), 0);
            }
            else
            {
                if (_local_2.right > _local_3.right)
                {
                    k.offset((_local_3.right - _local_2.right), 0);
                }
            }
        }

        protected function _Str_18287(k:IWindow):void
        {
            var _local_2:Rectangle = new Rectangle();
            k.getGlobalRectangle(_local_2);
            if (_local_2.bottom > desktop.bottom)
            {
                k.offset(0, (desktop.bottom - _local_2.bottom));
            }
            else
            {
                if (_local_2.top < desktop.top)
                {
                    k.offset(0, (_local_2.top - desktop.top));
                }
            }
            if (_local_2.left < desktop.left)
            {
                k.offset((_local_2.left - desktop.left), 0);
            }
            else
            {
                if (_local_2.right > desktop.right)
                {
                    k.offset((desktop.right - _local_2.right), 0);
                }
            }
            if (_local_2.height > (desktop.height - _Str_9883))
            {
                k.height = (desktop.height - _Str_9883);
                k.y = _Str_9883;
            }
        }

        private function _Str_22124(k:WindowEvent):void
        {
            if (getStateFlag(WindowState.DISABLED))
            {
                return;
            }
            if (((k.type == WindowMouseEvent.DOWN) || (k.type == WindowTouchEvent.WTE_TAP)))
            {
                if (!this._Str_3943)
                {
                    this._Str_9561();
                }
            }
        }

        protected function _Str_26470(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowTouchEvent.WTE_END:
                case WindowMouseEvent.UP:
                    if ((_arg_2 is IDropListItemWindow))
                    {
                        if (_arg_2.testStateFlag(WindowState.HOVERING))
                        {
                            this.selection = this._Str_21900(_arg_2);
                        }
                    }
                    return;
                case WindowTouchEvent.WTE_BEGIN:
                case WindowMouseEvent.DOWN:
                    this.selection = this._Str_21900(_arg_2);
                    return;
                case WindowEvent.WINDOW_EVENT_DEACTIVATED:
                    if (_arg_2 == this._Str_3565)
                    {
                        if (((this._Str_14725) && (this._Str_3943)))
                        {
                            return;
                        }
                        this.closeExpandedMenuView();
                    }
                    return;
            }
        }

        protected function _Str_21900(k:IWindow):int
        {
            var _local_2:int = this._Str_3139.indexOf(k);
            if (_local_2 == -1)
            {
                if ((k is IDropListItemWindow))
                {
                    _local_2 = this._Str_3139.indexOf(IDropListItemWindow(k).value);
                }
            }
            if (_local_2 == -1)
            {
                return this._Str_3371;
            }
            return _local_2;
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            switch (_arg_2.type)
            {
                case WindowTouchEvent.WTE_BEGIN:
                case WindowMouseEvent.DOWN:
                    if (this._Str_3943)
                    {
                        if (this._Str_14725)
                        {
                            this.closeExpandedMenuView();
                        }
                    }
                    else
                    {
                        this._Str_9561();
                    }
                    break;
                case WindowEvent.WINDOW_EVENT_ENABLED:
                    try
                    {
                        getChildByName(_DROPLIST_REGION).visible = true;
                        getChildByName(_DROPLIST_TITLETEXT).blend = (getChildByName(_DROPLIST_TITLETEXT).blend + _Str_5734);
                    }
                    catch(e:Error)
                    {
                    }
                    break;
                case WindowEvent.WINDOW_EVENT_DISABLED:
                    try
                    {
                        getChildByName(_DROPLIST_REGION).visible = false;
                        getChildByName(_DROPLIST_TITLETEXT).blend = (getChildByName(_DROPLIST_TITLETEXT).blend - _Str_5734);
                    }
                    catch(e:Error)
                    {
                    }
                    break;
            }
            return super.update(k, _arg_2);
        }

        public function open():Boolean
        {
            if (getStateFlag(WindowState.DEFAULT))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_OPEN, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            visible = true;
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_OPENED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function close():Boolean
        {
            if (!getStateFlag(WindowState.DEFAULT))
            {
                return true;
            }
            var k:WindowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CLOSE, this, null);
            this.update(this, k);
            if (k.isDefaultPrevented())
            {
                k.recycle();
                return false;
            }
            k.recycle();
            visible = false;
            k = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CLOSED, this, null);
            this.update(this, k);
            k.recycle();
            return true;
        }

        public function get numMenuItems():int
        {
            return this._Str_3139.length;
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.OPEN_UPWARD, this._Str_16910));
            k.push(createProperty(PropertyKeys.KEEP_OPEN_ON_DEACTIVATE, this._Str_14725));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.OPEN_UPWARD:
                        this._Str_16910 = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.KEEP_OPEN_ON_DEACTIVATE:
                        this._Str_14725 = Boolean(_local_2.value);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
