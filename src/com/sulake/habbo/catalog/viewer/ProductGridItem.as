package com.sulake.habbo.catalog.viewer
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.window.enum.HabboWindowStyle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.enum.MouseCursorType;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.habbo.avatar.IAvatarImageListener;

    public class ProductGridItem implements IGridItem 
    {
        public static const BG:String = "bg";

        protected var _view:IWindowContainer;
        private var _grid:_Str_4311;
        protected var _icon:IBitmapWrapperWindow;
        private var _disposed:Boolean = false;
        private var _Str_3737:Object;
        private var _habboCatalog:HabboCatalog;

        public function ProductGridItem(k:HabboCatalog)
        {
            this._habboCatalog = k;
            super();
        }

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function set grid(k:_Str_4311):void
        {
            this._grid = k;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._grid = null;
            this._icon = null;
            this._habboCatalog = null;
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        protected function get catalog():HabboCatalog
        {
            return this._habboCatalog;
        }

        public function activate():void
        {
            if (!this._view)
            {
                return;
            }
            if (this._view.findChildByTag("ITEM_HILIGHT"))
            {
                this._view.findChildByTag("ITEM_HILIGHT").visible = true;
            }
            else
            {
                this._view.getChildByName(BG).style = HabboWindowStyle.DEFAULT;
            }
        }

        public function deactivate():void
        {
            if (!this._view)
            {
                return;
            }
            if (this._view.findChildByTag("ITEM_HILIGHT"))
            {
                this._view.findChildByTag("ITEM_HILIGHT").visible = false;
            }
            else
            {
                this._view.getChildByName(BG).style = 3;
            }
        }

        public function set view(k:IWindowContainer):void
        {
            if (!k)
            {
                return;
            }
            this._view = k;
            this._view.procedure = this._Str_5162;
            this._icon = (this._view.findChildByName("image") as IBitmapWrapperWindow);
            if (this._view.findChildByTag("ITEM_HILIGHT"))
            {
                this._view.findChildByTag("ITEM_HILIGHT").visible = false;
            }
            var _local_2:IWindow = this._view.findChildByName("multiContainer");
            if (_local_2)
            {
                _local_2.visible = false;
            }
        }

        public function _Str_16497(k:Boolean):void
        {
            if (((this._view as IInteractiveWindow) && (k)))
            {
                (this._view as IInteractiveWindow).setMouseCursorForState(WindowState.HOVERING, MouseCursorType.DRAG);
                (this._view as IInteractiveWindow).setMouseCursorForState((WindowState.HOVERING | WindowState.ACTIVE), MouseCursorType.DRAG);
            }
        }

        private function _Str_5162(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.UP)
            {
                this._Str_3737 = null;
            }
            else
            {
                if (k.type == WindowMouseEvent.DOWN)
                {
                    if (_arg_2 == null)
                    {
                        return;
                    }
                    this._grid.select(this, true);
                    this._Str_3737 = _arg_2;
                }
                else
                {
                    if ((((k.type == WindowMouseEvent.OUT) && (!(this._Str_3737 == null))) && (this._Str_3737 == _arg_2)))
                    {
                        _local_3 = this._grid._Str_9974(this);
                        if (_local_3)
                        {
                            this._Str_3737 = null;
                        }
                    }
                    else
                    {
                        if (k.type == WindowMouseEvent.UP)
                        {
                            this._Str_3737 = null;
                        }
                        else
                        {
                            if (k.type == WindowMouseEvent.CLICK)
                            {
                                this._Str_3737 = null;
                            }
                            else
                            {
                                if (k.type == WindowMouseEvent.DOUBLE_CLICK)
                                {
                                    this._Str_3737 = null;
                                }
                            }
                        }
                    }
                }
            }
        }

        public function setIconImage(k:BitmapData, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:int;
            if (k == null)
            {
                return;
            }
            if (((!(this._icon == null)) && (!(this._icon.disposed))))
            {
                _local_3 = ((this._icon.width - k.width) / 2);
                _local_4 = ((this._icon.height - k.height) / 2);
                if (this._icon.bitmap == null)
                {
                    this._icon.bitmap = new BitmapData(this._icon.width, this._icon.height, true, 0xFFFFFF);
                }
                else
                {
                    this._icon.bitmap.fillRect(this._icon.bitmap.rect, 0xFFFFFF);
                }
                this._icon.bitmap.copyPixels(k, k.rect, new Point(_local_3, _local_4), null, null, false);
                this._icon.invalidate();
            }
            if (_arg_2)
            {
                k.dispose();
            }
        }

        protected function _Str_12672(k:String, _arg_2:IAvatarImageListener):BitmapData
        {
            var _local_3:IAvatarImage = this._habboCatalog.avatarRenderManager.createAvatarImage(k, AvatarScaleType.LARGE, null, _arg_2);
            var _local_4:BitmapData = _local_3._Str_818(AvatarSetType.HEAD, 0.5);
            _local_3.dispose();
            return _local_4;
        }
    }
}
