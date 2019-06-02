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
                    this.setSelected((k as ISelectableWindow));
                }
            }
            return super.update(k, _arg_2);
        }

        public function get numSelectables():uint
        {
            return numChildren;
        }

        public function getSelected():ISelectableWindow
        {
            return this._Str_1007 as ISelectableWindow;
        }

        public function setSelected(k:ISelectableWindow):void
        {
            var _local_2:ISelectableWindow;
            if (k != null)
            {
                if (k != this._Str_1007)
                {
                    if (this._Str_1007 != null)
                    {
                        if (!this._Str_1007.unselect())
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

        public function addSelectable(k:ISelectableWindow):ISelectableWindow
        {
            var _local_2:ISelectableWindow = ISelectableWindow(addChild(k));
            return _local_2;
        }

        public function addSelectableAt(k:ISelectableWindow, _arg_2:int):ISelectableWindow
        {
            var _local_3:ISelectableWindow = ISelectableWindow(addChildAt(k, _arg_2));
            return _local_3;
        }

        public function getSelectableAt(k:int):ISelectableWindow
        {
            return getChildAt(k) as ISelectableWindow;
        }

        public function getSelectableByID(k:uint):ISelectableWindow
        {
            return getChildByID(k) as ISelectableWindow;
        }

        public function getSelectableByTag(k:String):ISelectableWindow
        {
            return getChildByTag(k) as ISelectableWindow;
        }

        public function getSelectableByName(k:String):ISelectableWindow
        {
            return getChildByName(k) as ISelectableWindow;
        }

        public function getSelectableIndex(k:ISelectableWindow):int
        {
            return getChildIndex(k);
        }

        public function removeSelectable(k:ISelectableWindow):ISelectableWindow
        {
            var _local_2:int = getChildIndex(k);
            if (_local_2 > -1)
            {
                if (k == this._Str_1007)
                {
                    if (this.numSelectables > 1)
                    {
                        this.setSelected(this.getSelectableAt(((_local_2 == 0) ? 1 : 0)));
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
