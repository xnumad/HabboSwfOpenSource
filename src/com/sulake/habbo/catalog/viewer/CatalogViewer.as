package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.catalog.navigation.CatalogNavigator;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import flash.events.Event;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import __AS3__.vec.*;

    public class CatalogViewer implements ICatalogViewer 
    {
        private var _catalog:HabboCatalog;
        private var _container:IWindowContainer;
        private var _page:ICatalogPage;
        private var _forceRefresh:Boolean;
        private var _previousPageId:int;

        public function CatalogViewer(k:HabboCatalog, _arg_2:IWindowContainer)
        {
            this._catalog = k;
            this._container = _arg_2;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._catalog.roomEngine;
        }

        public function dispose():void
        {
            if (this._page)
            {
                this._page.dispose();
                this._page = null;
            }
            this._catalog = null;
            this._container = null;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function _Str_19388(k:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<IPurchasableOffer>, _arg_5:int, _arg_6:Boolean):void
        {
            Logger.log(("[Catalog Viewer] Show Catalog Page: " + [k, _arg_2, _arg_4.length, _arg_5]));
            if (this._page != null)
            {
                if (((!(this._forceRefresh)) && (this._page.pageId == k)))
                {
                    if (_arg_5 > -1)
                    {
                        this._page.selectOffer(_arg_5);
                    }
                    return;
                }
                this._Str_23905();
            }
            var _local_7:ICatalogPage = new CatalogPage(this, k, _arg_2, _arg_3, _arg_4, this._catalog, _arg_6);
            this._page = _local_7;
            this._previousPageId = ((k > CatalogNavigator._Str_5778) ? k : this._previousPageId);
            if (_local_7.window != null)
            {
                this._container.addChild(_local_7.window);
                _local_7.window.height = this._container.height;
                this._container.width = _local_7.window.width;
                this._container.x = ((this._container.parent.width - this._container.width) - 8);
                if (this._container.x < 130)
                {
                    this._catalog._Str_6496(false);
                }
                else
                {
                    this._catalog._Str_6496(true);
                }
            }
            else
            {
                Logger.log(("[CatalogViewer] No window for page: " + _arg_2));
            }
            this._container.visible = true;
            this._forceRefresh = false;
            _local_7.selectOffer(_arg_5);
        }

        public function _Str_23905():void
        {
            if (this._page != null)
            {
                this._container.removeChild(this._page.window);
                this._page.dispose();
                this._container.invalidate();
            }
        }

        public function _Str_20980():void
        {
            if (this._page != null)
            {
                this._page.closed();
            }
        }

        public function dispatchWidgetEvent(k:Event):Boolean
        {
            return this._page.dispatchWidgetEvent(k);
        }

        public function _Str_9089():String
        {
            if (this._page == null)
            {
                return "";
            }
            return this._page.layoutCode;
        }

        public function get _Str_3854():ICatalogPage
        {
            return this._page;
        }

        public function _Str_22433(k:Vector.<IFurnitureData>):void
        {
            var _local_3:IFurnitureData;
            var _local_4:ICatalogPage;
            var _local_5:IPurchasableOffer;
            if (this._page != null)
            {
                this._container.removeChild(this._page.window);
                this._page.dispose();
            }
            var _local_2:Vector.<IPurchasableOffer> = new Vector.<IPurchasableOffer>(0);
            for each (_local_3 in k)
            {
                _local_5 = new FurnitureOffer(_local_3, this._catalog);
                _local_2.push(_local_5);
            }
            _local_4 = new CatalogPage(this, -1, "default_3x3", new PageLocalization(["catalog_header_roombuilder", "credits_v3_teaser"], ["${catalog.search.results}"]), _local_2, this._catalog, false, CatalogPage._Str_7035);
            this._page = _local_4;
            if (_local_4.window != null)
            {
                this._container.addChild(_local_4.window);
                _local_4.window.width = this._container.width;
                _local_4.window.height = this._container.height;
            }
            else
            {
                Logger.log(("[CatalogViewer] No window for page: " + "<SEARCH>"));
            }
            this._container.visible = true;
        }

        public function get _Str_20991():Array
        {
            return (this._container) ? this._container.tags : [];
        }

        public function _Str_21608():void
        {
            this._forceRefresh = true;
        }

        public function get _Str_20548():int
        {
            return this._previousPageId;
        }
    }
}
