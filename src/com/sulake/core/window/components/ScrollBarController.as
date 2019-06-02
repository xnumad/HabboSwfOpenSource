package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowTouchEvent;
    import com.sulake.core.window.IWindowContainer;

    public class ScrollBarController extends InteractiveController implements IScrollbarWindow, ITouchAwareWindow 
    {
        private static const INCREMENT:String = "increment";
        private static const DECREMENT:String = "decrement";
        private static const SLIDER_TRACK:String = "slider_track";
        private static const SLIDER_BAR:String = "slider_bar";

        protected var _Str_588:Number = 0;
        protected var _Str_6248:Number = 0.1;
        protected var _Str_2566:IScrollableWindow;
        private var _horizontal:Boolean;
        private var _Str_9086:String;
        private var _Str_12228:Boolean = false;

        public function ScrollBarController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0, _arg_12:IScrollableWindow=null)
        {
            var _local_14:IWindow;
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _Str_3781 = false;
            this._Str_2566 = _arg_12;
            this._horizontal = (_arg_2 == WindowType.WINDOW_TYPE_SCROLLBAR_HORIZONTAL);
            var _local_13:Array = new Array();
            groupChildrenWithTag(TAG_INTERNAL, _local_13, -1);
            for each (_local_14 in _local_13)
            {
                _local_14.procedure = this._Str_24088;
            }
            this._Str_6685();
        }

        public function get scrollH():Number
        {
            return (this._horizontal) ? this._Str_588 : 0;
        }

        public function get scrollV():Number
        {
            return (this._horizontal) ? 0 : this._Str_588;
        }

        public function get scrollable():IScrollableWindow
        {
            return this._Str_2566;
        }

        public function set scrollH(k:Number):void
        {
            if (this._horizontal)
            {
                if (this._Str_10345(k))
                {
                    this._Str_6685();
                }
            }
        }

        public function set scrollV(k:Number):void
        {
            if (!this._horizontal)
            {
                if (this._Str_10345(k))
                {
                    this._Str_6685();
                }
            }
        }

        public function set scrollable(k:IScrollableWindow):void
        {
            if (((!(this._Str_2566 == null)) && (!(this._Str_2566.disposed))))
            {
                this._Str_2566.removeEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_20343);
                this._Str_2566.removeEventListener(WindowEvent.WINDOW_EVENT_SCROLL, this._Str_19899);
            }
            this._Str_2566 = k;
            if (((!(this._Str_2566 == null)) && (!(this._Str_2566.disposed))))
            {
                this._Str_2566.addEventListener(WindowEvent.WINDOW_EVENT_RESIZED, this._Str_20343);
                this._Str_2566.addEventListener(WindowEvent.WINDOW_EVENT_SCROLL, this._Str_19899);
                this._Str_6685();
            }
        }

        public function get horizontal():Boolean
        {
            return this._horizontal;
        }

        public function get vertical():Boolean
        {
            return !(this._horizontal);
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            var _local_2:String;
            if ((this._Str_2566 is IWindow))
            {
                _local_2 = IWindow(this._Str_2566).name;
            }
            else
            {
                if (this._Str_9086 != null)
                {
                    _local_2 = this._Str_9086;
                }
            }
            if (_local_2 == null)
            {
                k.push(getDefaultProperty(PropertyKeys.SCROLLABLE));
            }
            else
            {
                k.push(createProperty(PropertyKeys.SCROLLABLE, _local_2));
            }
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.SCROLLABLE:
                        this._Str_9086 = (_local_2.value as String);
                        this._Str_2566 = null;
                        break;
                }
            }
            super.properties = k;
        }

        protected function get track():WindowController
        {
            return findChildByName(SLIDER_TRACK) as WindowController;
        }

        protected function get _Str_24726():WindowController
        {
            return this.track.findChildByName(SLIDER_BAR) as WindowController;
        }

        override public function dispose():void
        {
            this.scrollable = null;
            super.dispose();
        }

        override public function enable():Boolean
        {
            var k:Array;
            var _local_2:uint;
            if (super.enable())
            {
                k = new Array();
                groupChildrenWithTag(TAG_INTERNAL, k, -1);
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    IWindow(k[_local_2]).enable();
                    _local_2++;
                }
                return true;
            }
            return false;
        }

        override public function disable():Boolean
        {
            var k:Array;
            var _local_2:uint;
            if (super.disable())
            {
                k = new Array();
                groupChildrenWithTag(TAG_INTERNAL, k, -1);
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    IWindow(k[_local_2]).disable();
                    _local_2++;
                }
                return true;
            }
            return false;
        }

        protected function _Str_10345(k:Number):Boolean
        {
            var _local_2:Boolean;
            if (((this._Str_2566 == null) || (this._Str_2566.disposed)))
            {
                if (!this._Str_16407())
                {
                    return false;
                }
            }
            if (k < 0)
            {
                k = 0;
            }
            if (k > 1)
            {
                k = 1;
            }
            this._Str_588 = k;
            if (this._horizontal)
            {
                _local_2 = (!(this._Str_2566.scrollH == this._Str_588));
                if (_local_2)
                {
                    this._Str_2566.scrollH = this._Str_588;
                }
            }
            else
            {
                _local_2 = (!(this._Str_2566.scrollV == this._Str_588));
                if (_local_2)
                {
                    this._Str_2566.scrollV = this._Str_588;
                }
            }
            return _local_2;
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            switch (k.name)
            {
                case ScrollBarController.SLIDER_BAR:
                    if (_arg_2.type == WindowEvent.WINDOW_EVENT_CHILD_RELOCATED)
                    {
                        if (!this._Str_12228)
                        {
                            if (this._horizontal)
                            {
                                this._Str_10345(DragBarController(k)._Str_14866);
                            }
                            else
                            {
                                this._Str_10345(DragBarController(k)._Str_15234);
                            }
                        }
                    }
                    break;
            }
            var _local_3:Boolean = super.update(k, _arg_2);
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_PARENT_ADDED)
            {
                if (this._Str_2566 == null)
                {
                    this._Str_16407();
                }
            }
            if (k == this)
            {
                if (_arg_2.type == WindowEvent.WINDOW_EVENT_RESIZED)
                {
                    this._Str_6685();
                }
                else
                {
                    if (_arg_2.type == WindowMouseEvent.WHEEL)
                    {
                        if (WindowMouseEvent(_arg_2).delta > 0)
                        {
                            if (this._horizontal)
                            {
                                this.scrollH = (this.scrollH - this._Str_6248);
                            }
                            else
                            {
                                this.scrollV = (this.scrollV - this._Str_6248);
                            }
                        }
                        else
                        {
                            if (this._horizontal)
                            {
                                this.scrollH = (this.scrollH + this._Str_6248);
                            }
                            else
                            {
                                this.scrollV = (this.scrollV + this._Str_6248);
                            }
                        }
                        _local_3 = true;
                    }
                }
            }
            return _local_3;
        }

        private function _Str_6685():void
        {
            var k:Number;
            var _local_4:int;
            if (((this._Str_2566 == null) || (this._Str_2566.disposed)))
            {
                if (((_disposed) || (!(this._Str_16407()))))
                {
                    return;
                }
            }
            var _local_2:WindowController = this.track;
            var _local_3:WindowController = this._Str_24726;
            if (_local_3 != null)
            {
                if (this._horizontal)
                {
                    k = (this._Str_2566._Str_3707.width / this._Str_2566.visibleRegion.width);
                    if (k > 1)
                    {
                        k = 1;
                    }
                    _local_4 = (k * _local_2.width);
                    _local_3.width = _local_4;
                    _local_3.x = Math.round((this._Str_2566.scrollH * (_local_2.width - _local_4)));
                }
                else
                {
                    k = (this._Str_2566._Str_3707.height / this._Str_2566.visibleRegion.height);
                    if (k > 1)
                    {
                        k = 1;
                    }
                    _local_4 = (k * _local_2.height);
                    _local_3.height = _local_4;
                    _local_3.y = Math.round((this._Str_2566.scrollV * (_local_2.height - _local_3.height)));
                }
            }
            if (k == 1)
            {
                this.disable();
            }
            else
            {
                this.enable();
            }
        }

        private function _Str_20825(k:WindowEvent, _arg_2:IWindow):void
        {
        }

        private function _Str_24088(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:IWindow;
            var _local_3:Boolean;
            if (((k.type == WindowMouseEvent.DOWN) || (k.type == WindowTouchEvent.WTE_TAP)))
            {
                if (_arg_2.name == INCREMENT)
                {
                    if (this._Str_2566)
                    {
                        this._Str_12228 = true;
                        if (this._horizontal)
                        {
                            this.scrollH = (this.scrollH + (this._Str_2566.scrollStepH / this._Str_2566.maxScrollH));
                        }
                        else
                        {
                            this.scrollV = (this.scrollV + (this._Str_2566.scrollStepV / this._Str_2566.maxScrollV));
                        }
                        this._Str_12228 = false;
                    }
                }
                else
                {
                    if (_arg_2.name == DECREMENT)
                    {
                        if (this._Str_2566)
                        {
                            this._Str_12228 = true;
                            if (this._horizontal)
                            {
                                this.scrollH = (this.scrollH - (this._Str_2566.scrollStepH / this._Str_2566.maxScrollH));
                            }
                            else
                            {
                                this.scrollV = (this.scrollV - (this._Str_2566.scrollStepV / this._Str_2566.maxScrollV));
                            }
                            this._Str_12228 = false;
                        }
                    }
                    else
                    {
                        if (_arg_2.name == SLIDER_TRACK)
                        {
                            if ((k is WindowMouseEvent))
                            {
                                _local_4 = WindowMouseEvent(k).localX;
                                _local_5 = WindowMouseEvent(k).localY;
                            }
                            else
                            {
                                if ((k is WindowTouchEvent))
                                {
                                    _local_4 = WindowTouchEvent(k).localX;
                                    _local_5 = WindowTouchEvent(k).localY;
                                }
                            }
                            _local_6 = WindowController(_arg_2).getChildByName(ScrollBarController.SLIDER_BAR);
                            if (this._horizontal)
                            {
                                if (_local_4 < _local_6.x)
                                {
                                    this.scrollH = (this.scrollH - ((this._Str_2566._Str_3707.width - this._Str_2566.scrollStepH) / this._Str_2566.maxScrollH));
                                }
                                else
                                {
                                    if (_local_4 > _local_6.right)
                                    {
                                        this.scrollH = (this.scrollH + ((this._Str_2566._Str_3707.width - this._Str_2566.scrollStepH) / this._Str_2566.maxScrollH));
                                    }
                                }
                            }
                            else
                            {
                                if (_local_5 < _local_6.y)
                                {
                                    this.scrollV = (this.scrollV - ((this._Str_2566._Str_3707.height - this._Str_2566.scrollStepV) / this._Str_2566.maxScrollV));
                                }
                                else
                                {
                                    if (_local_5 > _local_6.bottom)
                                    {
                                        this.scrollV = (this.scrollV + ((this._Str_2566._Str_3707.height - this._Str_2566.scrollStepV) / this._Str_2566.maxScrollV));
                                    }
                                }
                            }
                            _local_3 = true;
                        }
                    }
                }
            }
            if (k.type == WindowMouseEvent.WHEEL)
            {
                if (WindowMouseEvent(k).delta > 0)
                {
                    if (this._horizontal)
                    {
                        this.scrollH = (this.scrollH - this._Str_6248);
                    }
                    else
                    {
                        this.scrollV = (this.scrollV - this._Str_6248);
                    }
                }
                else
                {
                    if (this._horizontal)
                    {
                        this.scrollH = (this.scrollH + this._Str_6248);
                    }
                    else
                    {
                        this.scrollV = (this.scrollV + this._Str_6248);
                    }
                }
                _local_3 = true;
            }
            if (_local_3)
            {
                this._Str_6685();
            }
        }

        private function _Str_16407():Boolean
        {
            var k:IScrollableWindow;
            var _local_2:uint;
            var _local_3:IScrollableWindow;
            var _local_4:uint;
            if (this._Str_2566 != null)
            {
                if (!this._Str_2566.disposed)
                {
                    return true;
                }
            }
            if (this._Str_9086 != null)
            {
                k = (findParentByName(this._Str_9086) as IScrollableWindow);
                if ((((k == null) && (_parent is IWindowContainer)) && (!(_parent is IDesktopWindow))))
                {
                    k = (IWindowContainer(_parent).findChildByName(this._Str_9086) as IScrollableWindow);
                    if (k)
                    {
                        this.scrollable = k;
                        return true;
                    }
                }
            }
            if ((_parent is IScrollableWindow))
            {
                this.scrollable = IScrollableWindow(_parent);
                return true;
            }
            if (((_parent is IWindowContainer) && (!(_parent is IDesktopWindow))))
            {
                _local_2 = IWindowContainer(_parent).numChildren;
                _local_4 = 0;
                while (_local_4 < _local_2)
                {
                    _local_3 = (IWindowContainer(_parent).getChildAt(_local_4) as IScrollableWindow);
                    if (_local_3)
                    {
                        this.scrollable = _local_3;
                        return true;
                    }
                    _local_4++;
                }
            }
            return false;
        }

        private function _Str_20343(k:WindowEvent):void
        {
            this._Str_6685();
            this._Str_10345(this._Str_588);
        }

        private function _Str_19899(k:WindowEvent):void
        {
            this._Str_6685();
        }
    }
}
