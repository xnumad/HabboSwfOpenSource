package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.iterators.SelectorIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.WindowController;

    public class SelectorController extends InteractiveController implements ISelectorWindow, IIterable 
    {
        private var _Str_1007:ISelectableWindow;
        protected var _Str_16599:Boolean = true;

        public function SelectorController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get iterator():IIterator
        {
            return new SelectorIterator(this);
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_CHILD_ACTIVATED)
            {
                if ((k is ISelectableWindow))
                {
                    this._Str_2520((k as ISelectableWindow));
                }
            }
            return super.update(k, _arg_2);
        }

        public function get _Str_6010():uint
        {
            return numChildren;
        }

        public function _Str_2657():ISelectableWindow
        {
            return this._Str_1007 as ISelectableWindow;
        }

        public function _Str_2520(k:ISelectableWindow):void
        {
            var _local_2:ISelectableWindow;
            if (k != null)
            {
                if (k != this._Str_1007)
                {
                    if (this._Str_1007 != null)
                    {
                        if (!this._Str_1007._Str_2205())
                        {
                            return;
                        }
                    }
                    _local_2 = this._Str_1007;
                    this._Str_1007 = k;
                    if (this._Str_1007.select())
                    {
                        if (getChildIndex(k) > -1)
                        {
                            if (this._Str_16599)
                            {
                                if (getChildIndex(k) != (numChildren - 1))
                                {
                                    setChildIndex(k, (numChildren - 1));
                                }
                            }
                        }
                    }
                    else
                    {
                        this._Str_1007 = _local_2;
                        if (this._Str_1007 != null)
                        {
                            this._Str_1007.select();
                        }
                    }
                }
            }
        }

        public function _Str_13279(k:ISelectableWindow):ISelectableWindow
        {
            var _local_2:ISelectableWindow = ISelectableWindow(addChild(k));
            return _local_2;
        }

        public function _Str_16835(k:ISelectableWindow, _arg_2:int):ISelectableWindow
        {
            var _local_3:ISelectableWindow = ISelectableWindow(addChildAt(k, _arg_2));
            return _local_3;
        }

        public function _Str_5066(k:int):ISelectableWindow
        {
            return getChildAt(k) as ISelectableWindow;
        }

        public function _Str_21373(k:uint):ISelectableWindow
        {
            return getChildByID(k) as ISelectableWindow;
        }

        public function _Str_24764(k:String):ISelectableWindow
        {
            return _Str_6316(k) as ISelectableWindow;
        }

        public function _Str_5050(k:String):ISelectableWindow
        {
            return getChildByName(k) as ISelectableWindow;
        }

        public function _Str_8283(k:ISelectableWindow):int
        {
            return getChildIndex(k);
        }

        public function _Str_10845(k:ISelectableWindow):ISelectableWindow
        {
            var _local_2:int = getChildIndex(k);
            if (_local_2 > -1)
            {
                if (k == this._Str_1007)
                {
                    if (this._Str_6010 > 1)
                    {
                        this._Str_2520(this._Str_5066(((_local_2 == 0) ? 1 : 0)));
                    }
                    else
                    {
                        this._Str_1007 = null;
                    }
                }
                return ISelectableWindow(removeChild(k));
            }
            return null;
        }
    }
}
