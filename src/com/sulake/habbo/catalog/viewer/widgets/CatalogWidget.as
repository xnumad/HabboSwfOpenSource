package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;

    public class CatalogWidget 
    {
        protected var _window:IWindowContainer;
        protected var _events:IEventDispatcher;
        private var _page:ICatalogPage;
        private var _disposed:Boolean;
        protected var _embedded:Boolean = false;

        public function CatalogWidget(k:IWindowContainer)
        {
            this._window = k;
            this._embedded = (k.tags.indexOf("EMBEDDED") > -1);
        }

        public function set page(k:ICatalogPage):void
        {
            this._page = k;
        }

        public function set events(k:IEventDispatcher):void
        {
            this._events = k;
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get events():IEventDispatcher
        {
            return this._events;
        }

        public function get page():ICatalogPage
        {
            return this._page;
        }

        public function dispose():void
        {
            this._events = null;
            this._page = null;
            this._window = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function init():Boolean
        {
            return true;
        }

        public function closed():void
        {
        }

        protected function getAssetXML(k:String):XML
        {
            if (((((!(this.page)) || (!(this.page.viewer))) || (!(this.page.viewer.catalog))) || (!(this.page.viewer.catalog.assets))))
            {
                return null;
            }
            var _local_2:XmlAsset = (this.page.viewer.catalog.assets.getAssetByName(k) as XmlAsset);
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.content as XML;
        }

        protected function _Str_2819(k:String):void
        {
            if (this._embedded)
            {
                return;
            }
            var _local_2:XML = this.getAssetXML(k);
            if (_local_2 == null)
            {
                return;
            }
            this.window.removeChildAt(0);
            if (((((!(this.window)) || (!(this.page))) || (!(this.page.viewer))) || (!(this.page.viewer.catalog))))
            {
                return;
            }
            this.window.addChild(this.page.viewer.catalog.windowManager.buildFromXML(_local_2));
        }

        protected function _Str_21202(k:String):BitmapData
        {
            var _local_2:BitmapDataAsset = (this.page.viewer.catalog.assets.getAssetByName(k) as BitmapDataAsset);
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.content as BitmapData;
        }
    }
}
