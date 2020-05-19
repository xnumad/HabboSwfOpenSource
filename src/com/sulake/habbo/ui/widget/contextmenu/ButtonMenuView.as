package com.sulake.habbo.ui.widget.contextmenu
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class ButtonMenuView extends ContextInfoView 
    {
        protected static const ICON_MARGIN:int = 8;
        protected static const LINK_COLOR_MODERATE_DEFAULT:uint = 16744755;
        protected static const LINK_COLOR_MODERATE_HOVER:uint = 16756591;
        protected static const ICON_VIP:String = "icon_vip";
        protected static const ARROW_LEFT:String = "arrow_left";
        protected static const ARROW_RIGHT:String = "arrow_right";

        protected var _buttons:IItemListWindow;

        public function ButtonMenuView(k:IContextMenuParentWidget)
        {
            super(k);
        }

        override public function dispose():void
        {
            this._buttons = null;
            super.dispose();
        }

        protected function showButtonGrid(k:String, _arg_2:Boolean=true):void
        {
            var _local_6:int;
            var _local_7:IWindowContainer;
            var _local_8:IBitmapWrapperWindow;
            if (!this._buttons)
            {
                return;
            }
            var _local_3:IItemGridWindow = (this._buttons.getListItemByName(k) as IItemGridWindow);
            if (!_local_3)
            {
                return;
            }
            _local_3.visible = _arg_2;
            var _local_4:IIterator = _local_3.iterator;
            var _local_5:int = _local_4.length;
            if (_local_5 > 0)
            {
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    _local_7 = (_local_4[_local_6] as IWindowContainer);
                    _local_8 = (_local_7.findChildByTag("icon") as IBitmapWrapperWindow);
                    if (_local_8)
                    {
                        _Str_16818(_local_8, _local_8.name, true);
                    }
                    _local_6++;
                }
            }
        }

        protected function showButton(k:String, _arg_2:Boolean=true, _arg_3:Boolean=true, _arg_4:Boolean=false):void
        {
            if (!this._buttons)
            {
                return;
            }
            var _local_5:IWindowContainer = (this._buttons.getListItemByName(k) as IWindowContainer);
            if (!_local_5)
            {
                return;
            }
            _local_5.visible = _arg_2;
            var _local_6:IWindowContainer = (_local_5.getChildByName("button") as IWindowContainer);
            _arg_3 = ((_arg_3) || (_arg_4));
            if (_arg_3)
            {
                _local_6.enable();
            }
            else
            {
                _local_6.disable();
            }
            var _local_7:ITextWindow = (_local_6.getChildByName("label") as ITextWindow);
            _local_7.textColor = (((_arg_3) && (!(_arg_4))) ? _Str_17354 : _Str_17165);
            var _local_8:IIconWindow = (_local_6.getChildByName("icon") as IIconWindow);
            if (_local_8)
            {
                _local_8.color = ((_arg_3) ? _Str_16357 : _Str_17248);
                if (_local_8.tags.indexOf(ARROW_LEFT) != -1)
                {
                    _local_8.x = (((_local_7.x + ((_local_7.width - _local_7.textWidth) / 2)) - _local_8.width) - ICON_MARGIN);
                }
                if (_local_8.tags.indexOf(ARROW_RIGHT) != -1)
                {
                    _local_8.x = ((_local_7.x + ((_local_7.width + _local_7.textWidth) / 2)) + ICON_MARGIN);
                }
                _local_8.visible = ((_local_8.visible) && (!(_arg_4)));
            }
            var _local_9:IIconWindow = (_local_6.getChildByName(ICON_VIP) as IIconWindow);
            if (_local_9)
            {
                _local_9.visible = _arg_4;
            }
        }

        protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            if (disposed)
            {
                return;
            }
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                if (_arg_2.name == "button")
                {
                    _arg_2.color = ((_arg_2.tags.indexOf("moderate") > -1) ? _Str_18586 : _Str_13825);
                }
                else
                {
                    if (_arg_2.tags.indexOf("link") > -1)
                    {
                        if (_arg_2.tags.indexOf("actions") > -1)
                        {
                            ITextWindow(IWindowContainer(_arg_2).getChildAt(0)).textColor = _Str_6801;
                        }
                        else
                        {
                            if (_arg_2.tags.indexOf("moderate") > -1)
                            {
                                ITextWindow(IWindowContainer(_arg_2).getChildAt(0)).textColor = LINK_COLOR_MODERATE_HOVER;
                            }
                        }
                    }
                }
                if (_arg_2.name == "profile_link")
                {
                    ITextWindow(IWindowContainer(_arg_2).findChildByName("name")).textColor = _Str_6801;
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    if (_arg_2.name == "button")
                    {
                        _arg_2.color = _Str_16565;
                    }
                    else
                    {
                        if (_arg_2.tags.indexOf("link") > -1)
                        {
                            if (_arg_2.tags.indexOf("actions") > -1)
                            {
                                ITextWindow(IWindowContainer(_arg_2).getChildAt(0)).textColor = _Str_6292;
                            }
                            else
                            {
                                if (_arg_2.tags.indexOf("moderate") > -1)
                                {
                                    ITextWindow(IWindowContainer(_arg_2).getChildAt(0)).textColor = LINK_COLOR_MODERATE_DEFAULT;
                                }
                            }
                        }
                    }
                    if (_arg_2.name == "profile_link")
                    {
                        ITextWindow(IWindowContainer(_arg_2).findChildByName("name")).textColor = _Str_6292;
                    }
                }
            }
        }
    }
}


