package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
    import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoCatalogWidget;
    import com.sulake.core.window.IWindowContainer;

    public class ExtraInfoListItem implements IDisposable 
    {
        public static const ALIGN_TOP:int = 0;
        public static const ALIGN_BOTTOM:int = 1;
        public static const ALIGN_OVERLAY:int = 2;

        private var _id:int;
        private var _data:ExtraInfoItemData;
        private var _alignment:int;
        private var _alwaysOnTop:Boolean;
        private var _disposed:Boolean = false;
        private var _creationSeconds:Number;
        private var _removalSeconds:Number;
        private var _isItemRemoved:Boolean = false;

        public function ExtraInfoListItem(k:BundlePurchaseExtraInfoCatalogWidget, _arg_2:int, _arg_3:ExtraInfoItemData, _arg_4:int=0, _arg_5:Boolean=false)
        {
            this._id = _arg_2;
            this._data = _arg_3;
            this._alignment = _arg_4;
            this._alwaysOnTop = _arg_5;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this._data = null;
            this._disposed = true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function get data():ExtraInfoItemData
        {
            return this._data;
        }

        public function set data(k:ExtraInfoItemData):void
        {
            this._data = k;
        }

        public function get alignment():int
        {
            return this._alignment;
        }

        public function get _Str_22324():Boolean
        {
            return this._alwaysOnTop;
        }

        public function get _Str_13645():Number
        {
            return this._creationSeconds;
        }

        public function set _Str_13645(k:Number):void
        {
            this._creationSeconds = k;
        }

        public function get _Str_24857():Boolean
        {
            return this._isItemRemoved;
        }

        public function get _Str_14104():Number
        {
            return this._removalSeconds;
        }

        public function set _Str_14104(k:Number):void
        {
            this._removalSeconds = k;
            this._isItemRemoved = true;
        }

        public function getRenderedWindow():IWindowContainer
        {
            return null;
        }
    }
}
