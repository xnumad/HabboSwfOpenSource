package com.sulake.habbo.catalog.viewer.widgets
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.catalog.enum.CatalogPageName;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient._Str_5079;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.habbo.catalog.viewer.PageLocalization;
    import com.sulake.core.window.components.IHTMLTextWindow;
    import com.sulake.core.window.events.WindowLinkEvent;
    import com.sulake.habbo.catalog.navigation.ICatalogNode;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.catalog.viewer.CatalogPage;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Point;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.text.StyleSheet;
    import com.sulake.core.window.components.ITextWindow;

    public class LocalizationCatalogWidget extends CatalogWidget
    {
        private var _imageElementMap:Dictionary;
        private var _catalog:HabboCatalog;

        public function LocalizationCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._imageElementMap = new Dictionary();
            this._catalog = _arg_2;
        }

        override public function dispose():void
        {
            super.dispose();
            this._catalog = null;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._Str_22511();
            this._Str_25677();
            this._Str_7955();
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_25040);
            return true;
        }

        private function _Str_25040(k:SelectProductEvent):void
        {
            if (k == null)
            {
                return;
            }
        }

        private function _Str_7955():void
        {
            var k:String;
            var _local_2:IWindow;
            if (page.hasLinks)
            {
                for each (k in page.links)
                {
                    _local_2 = _window.findChildByName(k);
                    if (_local_2 != null)
                    {
                        _local_2.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
                        _local_2.mouseThreshold = 0;
                        _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_18285);
                    }
                }
            }
        }

        private function _Str_18285(k:WindowMouseEvent):void
        {
            var _local_6:String;
            var _local_2:IHabboLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
            var _local_3:IHabboConfigurationManager = (page.viewer.catalog as HabboCatalog);
            var _local_4:String = IWindow(k.target).name;
            var _local_5:String = "";
            switch (page.layoutCode)
            {
                case "frontpage3":
                    switch (_local_4)
                    {
                        case "ctlg_txt3":
                            if (IWindow(k.target).caption != "")
                            {
                                _local_5 = page.localization.getTextElementContent(6);
                                page.viewer.catalog.openCatalogPage(_local_5);
                            }
                            break;
                        case "ctlg_txt7":
                            if (IWindow(k.target).caption != "")
                            {
                                _local_5 = page.localization.getTextElementContent(10);
                                if (_local_5.indexOf("http") >= 0)
                                {
                                    this.openExternalLink(_local_5);
                                }
                                else
                                {
                                    if (_local_5 == CatalogPageName.CREDITS)
                                    {
                                        HabboWebTools.openWebPageAndMinimizeClient(this._catalog.getProperty(_Str_5079.WEB_SHOP_RELATIVEURL));
                                    }
                                    else
                                    {
                                        page.viewer.catalog.openCatalogPage(_local_5);
                                    }
                                }
                            }
                            break;
                    }
                    return;
                case "info_pixels":
                    switch (_local_4)
                    {
                        case "ctlg_text_5":
                            this._catalog.questEngine.showAchievements();
                            break;
                        case "ctlg_text_7":
                            _local_5 = page.localization.getTextElementContent(7);
                            page.viewer.catalog.openCatalogPage(_local_5);
                            break;
                    }
                    return;
                case "info_credits":
                    switch (_local_4)
                    {
                        case "ctlg_text_5":
                            HabboWebTools.openWebPageAndMinimizeClient(this._catalog.getProperty(_Str_5079.WEB_SHOP_RELATIVEURL));
                            break;
                        case "ctlg_text_7":
                            _local_5 = page.localization.getTextElementContent(7);
                            page.viewer.catalog.openCatalogPage(_local_5);
                            break;
                    }
                    return;
                case "collectibles":
                    switch (_local_4)
                    {
                        case "ctlg_collectibles_link":
                            _local_5 = _local_3.getProperty("link.format.collectibles");
                            this.openExternalLink(_local_5);
                            break;
                    }
                    return;
                case "club1":
                    switch (_local_4)
                    {
                        case "ctlg_text_5":
                            page.viewer.catalog.openCatalogPage(CatalogPageName.HC_MEMBERSHIP);
                            break;
                    }
                    return;
                case "club_buy":
                    switch (_local_4)
                    {
                        case "club_link":
                            _local_5 = _local_3.getProperty("link.format.club");
                            this.openExternalLink(_local_5);
                            break;
                    }
                    return;
                case "mad_money":
                    switch (_local_4)
                    {
                        case "ctlg_madmoney_button":
                            _local_5 = _local_3.getProperty("link.format.madmoney");
                            this.openExternalLink(_local_5);
                            break;
                    }
                    return;
                case "monkey":
                    switch (_local_4)
                    {
                        case "ctlg_teaserimg_1_region":
                        case "ctlg_special_img_region":
                            _local_5 = _local_2.getLocalization("link.format.monkey", "http://store.apple.com/");
                            this.openExternalLink(_local_5);
                            break;
                    }
                    return;
                case "niko":
                    switch (_local_4)
                    {
                        case "ctlg_teaserimg_1_region":
                        case "ctlg_special_img_region":
                            _local_5 = _local_2.getLocalization("link.format.niko", "http://itunes.apple.com/us/app/niko/id481670205?mt=8");
                            this.openExternalLink(_local_5);
                            break;
                    }
                    return;
                default:
                    Logger.log(("[LocalizationCatalogWidget] Unhandled link clicked" + [page.layoutCode, _local_4]));
            }
        }

        private function openExternalLink(k:String):void
        {
            if (k != "")
            {
                page.viewer.catalog.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, this._Str_7790);
                HabboWebTools.navigateToURL(k, "habboMain");
            }
        }

        private function _Str_7790(k:_Str_2418, _arg_2:WindowEvent):void
        {
            k.dispose();
        }

        private function _Str_25677():void
        {
            var _local_2:IWindow;
            var _local_3:String;
            var _local_4:String;
            var k:Array = [];
            _window.groupChildrenWithTag("STATIC_IMAGE", k, 10);
            for each (_local_2 in k)
            {
                if ((_local_2 is IBitmapWrapperWindow))
                {
                    _local_3 = _local_2.name;
                    _local_4 = _local_2.name;
                    this._imageElementMap[_local_4] = _local_3;
                    if (page.viewer.catalog.assets.hasAsset(_local_4))
                    {
                        this._Str_2972(_local_3, _local_4);
                    }
                    else
                    {
                        this._Str_21848(_local_4);
                    }
                }
            }
        }

        protected function _Str_22511():void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_7:IWindow;
            var _local_8:BitmapData;
            var _local_9:String;
            var k:int;
            this._imageElementMap = new Dictionary();
            this._catalog.mainContainer.findChildByName(PageLocalization.CATALOG_HEADER_DESCRIPTION).caption = "";
            k = 0;
            while (k < page.localization.textCount)
            {
                _local_2 = page.localization.getTextElementName(k, page.layoutCode);
                _local_3 = page.localization.getTextElementContent(k);
                if (_local_2 == PageLocalization.CATALOG_HEADER_DESCRIPTION)
                {
                    _local_7 = this._catalog.mainContainer.findChildByName(_local_2);
                }
                else
                {
                    if (_window != null)
                    {
                        _local_7 = _window.findChildByName(_local_2);
                    }
                }
                if (_local_7 != null)
                {
                    _local_3 = _local_3.replace(/\r\n/g, "\n");
                    _local_7.caption = _local_3;
                    if ((_local_7 is IHTMLTextWindow))
                    {
                        _local_7.addEventListener(WindowLinkEvent.WINDOW_EVENT_LINK, this._Str_25438);
                        this._Str_10740((_local_7 as IHTMLTextWindow));
                    }
                }
                else
                {
                    Logger.log(((("[LocalizationCatalogWidget] Could not place text in layout:  element: " + _local_2) + ", content: ") + _local_3));
                }
                k++;
            }
            k = 0;
            while (k < page.localization.imageCount)
            {
                _local_2 = page.localization.getImageElementName(k, page.layoutCode);
                _local_3 = page.localization.getImageElementContent(k);
                if (_local_2 == "")
                {
                }
                else
                {
                    if (_local_3 == "")
                    {
                    }
                    else
                    {
                        _local_9 = _local_3;
                        this._imageElementMap[_local_9] = _local_2;
                        if (page.viewer.catalog.assets.hasAsset(_local_9))
                        {
                            this._Str_2972(_local_2, _local_9);
                        }
                        else
                        {
                            this._Str_21848(_local_9);
                        }
                    }
                }
                k++;
            }
            var _local_4:ICatalogNode = this._catalog._Str_3361.getNodeById(page.pageId);
            var _local_5:IWindow = this._catalog.mainContainer.findChildByName(PageLocalization.CATALOG_HEADER_TITLE);
            var _local_6:IStaticBitmapWrapperWindow = (this._catalog.mainContainer.findChildByName(PageLocalization.CATALOG_HEADER_ICON) as IStaticBitmapWrapperWindow);
            if (_local_5 != null)
            {
                _local_5.caption = ((_local_4 != null) ? _local_4.localization : ((page.mode == CatalogPage._Str_7035) ? "${catalog.search.header}" : "${catalog.header}"));
            }
            if (((!(_local_6 == null)) && (!(_local_4 == null))))
            {
                _local_6.assetUri = ((page.mode == CatalogPage._Str_7035) ? "common_small_pen" : ((this._catalog.catalogType == CatalogType.BUILDER) ? (this._catalog.imageGalleryHost + "icon_193.png") : ((this._catalog.imageGalleryHost + _local_4._Str_4856) + ".png")));
            }
        }

        private function _Str_25438(k:WindowEvent):void
        {
            var _local_2:WindowLinkEvent = (k as WindowLinkEvent);
            if (_local_2 != null)
            {
                Logger.log(("=============== HTML LINK: " + _local_2.link));
            }
            else
            {
                Logger.log(("=============== BAD HTML LINK: " + k.target));
            }
        }

        private function _Str_2972(k:String, _arg_2:String):void
        {
            var _local_3:IWindow;
            var _local_4:BitmapDataAsset;
            var _local_5:BitmapData;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            Logger.log(("[LocalizationCatalogWidget] Set Element Image: " + [k, _arg_2]));
            if (_window == null)
            {
                Logger.log(("[LocalizationCatalogWidget] Window is null! " + [k, _arg_2]));
                return;
            }
            if (_window.disposed)
            {
                Logger.log(("[LocalizationCatalogWidget] Window is disposed! " + [k, _arg_2, _window.name]));
                return;
            }
            if (k == PageLocalization.CATALOG_HEADER_IMAGE)
            {
                _local_3 = this._catalog.mainContainer.findChildByName(k);
            }
            else
            {
                _local_3 = _window.findChildByName(k);
            }
            if ((_local_3 is IBitmapWrapperWindow))
            {
                _local_4 = (page.viewer.catalog.assets.getAssetByName(_arg_2) as BitmapDataAsset);
                if (_local_4 == null)
                {
                    Logger.log(("[LocalizationCatalogWidget] Asset does not exist (Bitmap window): " + [k, _arg_2]));
                    return;
                }
                _local_5 = (_local_4.content as BitmapData);
                if ((_local_3 as IBitmapWrapperWindow).bitmap == null)
                {
                    (_local_3 as IBitmapWrapperWindow).bitmap = new BitmapData(_local_3.width, _local_3.height, true, 0xFFFFFF);
                }
                (_local_3 as IBitmapWrapperWindow).bitmap.fillRect((_local_3 as IBitmapWrapperWindow).bitmap.rect, 0xFFFFFF);
                _local_6 = ((_local_3.width - _local_5.width) / 2);
                _local_7 = ((_local_3.height - _local_5.height) / 2);
                (_local_3 as IBitmapWrapperWindow).bitmap.copyPixels(_local_5, _local_5.rect, new Point(_local_6, _local_7), null, null, true);
            }
            else
            {
                if ((_local_3 is IStaticBitmapWrapperWindow))
                {
                    _local_8 = this._catalog.getProperty("image.library.catalogue.url");
                    _local_9 = ((_local_8 + _arg_2) + ".gif");
                    Logger.log(("[LocalizationCatalogWidget] Static Image: " + _local_9));
                    (_local_3 as IStaticBitmapWrapperWindow).assetUri = _local_9;
                }
                else
                {
                    Logger.log(("[LocalizationCatalogWidget] Could not find element: " + k));
                }
            }
        }

        private function _Str_21848(k:String):void
        {
            var _local_2:String;
            var _local_6:IWindow;
            var _local_3:String = (page.viewer.catalog as HabboCatalog).getProperty("image.library.catalogue.url");
            var _local_4:* = ((page.viewer.catalog as HabboCatalog).getProperty("image.library.url") + "Top_Story_Images/");
            var _local_5:String = this._imageElementMap[k];
            if (_local_5 == PageLocalization.CATALOG_HEADER_IMAGE)
            {
                _local_6 = this._catalog.mainContainer.findChildByName(_local_5);
            }
            else
            {
                _local_6 = _window.findChildByName(_local_5);
            }
            if (((_local_6) && (_local_6.tags.indexOf("TOP_STORY") > -1)))
            {
                _local_2 = _local_4;
            }
            else
            {
                _local_2 = _local_3;
            }
            var _local_7:* = ((_local_2 + k) + ".gif");
            Logger.log(("[LocalizationCatalogWidget]  : " + _local_7));
            var _local_8:URLRequest = new URLRequest(_local_7);
            var _local_9:AssetLoaderStruct = page.viewer.catalog.assets.loadAssetFromFile(k, _local_8, "image/gif");
            _local_9.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_24097);
        }

        private function _Str_24097(k:AssetLoaderEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                _local_3 = _local_2.assetName;
                _local_4 = this._imageElementMap[_local_3];
                this._Str_2972(_local_4, _local_3);
            }
        }

        private function _Str_10740(k:ITextWindow):void
        {
            if (!k)
            {
                return;
            }
            var _local_2:StyleSheet = new StyleSheet();
            var _local_3:Object = new Object();
            _local_3.color = "#336a95";
            var _local_4:Object = new Object();
            _local_4.textDecoration = "underline";
            _local_4.color = "#333333";
            var _local_5:Object = new Object();
            _local_5.color = "#41b7d9";
            var _local_6:Object = new Object();
            _local_6.textDecoration = "underline";
            _local_2.setStyle("a:link", _local_4);
            _local_2.setStyle("a:hover", _local_3);
            _local_2.setStyle("a:active", _local_5);
            _local_2.setStyle(".visited", _local_6);
            k.styleSheet = _local_2;
        }
    }
}
