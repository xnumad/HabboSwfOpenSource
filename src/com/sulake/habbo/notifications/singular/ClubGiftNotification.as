package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IIconWindow;

    public class ClubGiftNotification 
    {
        private static const CLUB_GIFT_NOTIFICATION:String = "club_gift_notification";
        private static const _Str_4086:uint = 0xFFFFFF;
        private static const _Str_4030:uint = 12247545;
        private static const _Str_5044:int = 13;
        private static const _Str_3830:int = 14;

        private var _window:IBorderWindow;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _linkText:ITextWindow;

        public function ClubGiftNotification(k:int, _arg_2:IAssetLibrary, _arg_3:IHabboWindowManager, _arg_4:IHabboCatalog, _arg_5:IHabboToolbar)
        {
            if ((((!(_arg_2)) || (!(_arg_3))) || (!(_arg_4))))
            {
                return;
            }
            this._catalog = _arg_4;
            this._toolbar = _arg_5;
            var _local_6:XmlAsset = (_arg_2.getAssetByName("club_gift_notification_xml") as XmlAsset);
            if (_local_6 == null)
            {
                return;
            }
            this._window = (_arg_3.buildFromXML((_local_6.content as XML)) as IBorderWindow);
            if (this._window == null)
            {
                return;
            }
            this._window.procedure = this.eventHandler;
            this._toolbar.extensionView.attachExtension(CLUB_GIFT_NOTIFICATION, this._window);
            this._linkText = (this._window.findChildByName("cancel_link") as ITextWindow);
            var _local_7:IRegionWindow = (this._window.findChildByName("cancel_link_region") as IRegionWindow);
            if (_local_7)
            {
                _local_7.addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
                _local_7.addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
            }
            if (this._catalog.getPurse().isVIP)
            {
                this._Str_5997(_Str_3830);
            }
            else
            {
                this._Str_5997(_Str_5044);
            }
        }

        public function get visible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function dispose():void
        {
            if (this._toolbar)
            {
                this._toolbar.extensionView.detachExtension(CLUB_GIFT_NOTIFICATION);
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._catalog = null;
        }

        private function _Str_3523(k:String, _arg_2:BitmapData):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(k) as IBitmapWrapperWindow);
            if (_local_3 == null)
            {
                return;
            }
            var _local_4:BitmapData = new BitmapData(_local_3.width, _local_3.height, true, 0);
            var _local_5:int = ((_local_4.width * 0.5) - _arg_2.width);
            var _local_6:int = ((_local_4.height * 0.5) - _arg_2.height);
            _local_4.draw(_arg_2, new Matrix(2, 0, 0, 2, _local_5, _local_6));
            _local_3.bitmap = _local_4;
        }

        private function eventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "open_catalog_button":
                    if (this._catalog)
                    {
                        this._catalog.openCatalogPage(CatalogPageName.CLUB_GIFTS);
                    }
                    this.dispose();
                    return;
                case "cancel_link_region":
                case "cancel_link":
                    this.dispose();
                    return;
            }
        }

        private function onMouseOver(k:WindowMouseEvent):void
        {
            this._linkText.textColor = _Str_4030;
        }

        private function onMouseOut(k:WindowMouseEvent):void
        {
            this._linkText.textColor = _Str_4086;
        }

        private function _Str_5997(k:int):void
        {
            var _local_2:IIconWindow;
            if (this._window)
            {
                _local_2 = (this._window.findChildByName("club_icon") as IIconWindow);
                if (_local_2)
                {
                    _local_2.style = k;
                    _local_2.invalidate();
                }
            }
        }
    }
}
