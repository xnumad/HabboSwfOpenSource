package com.sulake.core.window.components
{
    import com.sulake.core.window.utils.IIterable;
    import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.iterators.DropListIterator;
    import com.sulake.core.window.utils.IIterator;

    public class DropListController extends DropBaseController implements IDropListWindow, IIterable, ITouchAwareWindow 
    {
        public function DropListController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public function get iterator():IIterator
        {
            return new DropListIterator(this);
        }

        public function addMenuItem(k:IWindow):IWindow
        {
            return this.addMenuItemAt(k, _Str_3139.length);
        }

        public function addMenuItemAt(k:IWindow, _arg_2:int):IWindow
        {
            if (((k) && (_Str_3139.indexOf(k) == -1)))
            {
                if (!_Str_9315())
                {
                    if ((k is ILabelWindow))
                    {
                        if (k.name == DropBaseController._DROPLIST_TITLETEXT)
                        {
                            return addChild(k);
                        }
                    }
                }
                if (!_Str_8828())
                {
                    if ((k is IItemListWindow))
                    {
                        if (k.name == DropBaseController._DROPLIST_ITEMLIST)
                        {
                            return addChild(k);
                        }
                    }
                }
                if (!_Str_3679())
                {
                    if ((k is IRegionWindow))
                    {
                        if (k.name == DropBaseController._DROPLIST_REGION)
                        {
                            return addChild(k);
                        }
                    }
                }
                if (_Str_3943)
                {
                    closeExpandedMenuView();
                    _Str_3139.push(k);
                    _Str_9561();
                }
                else
                {
                    _Str_3139.push(k);
                }
                return k;
            }
            return null;
        }

        public function getMenuItemAt(k:int):IWindow
        {
            return (((!(_Str_3139 == null)) && (k > -1)) && (k < _Str_3139.length)) ? _Str_3139[k] : null;
        }

        public function removeMenuItem(k:IWindow):IWindow
        {
            var _local_2:int = _Str_3139.indexOf(k);
            if (_local_2 > -1)
            {
                if (_local_2 == _Str_3371)
                {
                    _Str_3371 = -1;
                }
                _Str_3139.splice(_local_2, 1);
                if (_Str_3943)
                {
                    closeExpandedMenuView();
                    _Str_9561();
                }
                return k;
            }
            return null;
        }

        public function removeMenuItemAt(k:int):IWindow
        {
            var _local_2:IWindow = _Str_3139[k];
            return (_local_2) ? this.removeMenuItem(_local_2) : null;
        }

        public function getMenuItemIndex(k:IWindow):int
        {
            return _Str_3139.indexOf(k);
        }
    }
}
