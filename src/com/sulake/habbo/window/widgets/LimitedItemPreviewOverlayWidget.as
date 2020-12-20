package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.window.utils.LimitedItemOverlayNumberBitmapGenerator;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class LimitedItemPreviewOverlayWidget implements ILimitedItemPreviewOverlayWidget
    {
        public static const LIMITED_ITEM_OVERLAY_PREVIEW:String = "limited_item_overlay_preview";

        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _serialNumber:int;
        private var _Str_11520:int;

        public function LimitedItemPreviewOverlayWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._root = IWindowContainer(this._habboWindowManagerComponent.buildFromXML(XML(this._habboWindowManagerComponent.assets.getAssetByName("unique_item_overlay_preview_xml").content)));
            this._Str_2326.rootWindow = this._root;
        }

        public function set serialNumber(k:int):void
        {
            this._serialNumber = k;
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._root.findChildByName("unique_item_serial_number_bitmap"));
            _local_2.bitmap = LimitedItemOverlayNumberBitmapGenerator._Str_14181(this._habboWindowManagerComponent.assets, this.serialNumber, _local_2.width, _local_2.height);
        }

        public function set seriesSize(k:int):void
        {
            this._Str_11520 = k;
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._root.findChildByName("unique_item_edition_size_bitmap"));
            _local_2.bitmap = LimitedItemOverlayNumberBitmapGenerator._Str_14181(this._habboWindowManagerComponent.assets, k, _local_2.width, _local_2.height);
        }

        public function get serialNumber():int
        {
            return this._serialNumber;
        }

        public function get seriesSize():int
        {
            return this._Str_11520;
        }

        public function get properties():Array
        {
            return [];
        }

        public function set properties(k:Array):void
        {
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._root == null;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }
    }
}


