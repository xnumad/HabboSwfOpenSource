package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.window.utils.LimitedItemOverlayNumberBitmapGenerator;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class RarityItemOverlayGridWidget implements _Str_3083 
    {
        public static const RARITY_ITEM_OVERLAY_GRID:String = "rarity_item_overlay_grid";

        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _disposed:Boolean;
        private var _Str_2302:IWindowContainer;
        private var _rarityLevel:int;
        private var _Str_26422:IStaticBitmapWrapperWindow;

        public function RarityItemOverlayGridWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._Str_2302 = IWindowContainer(this._habboWindowManagerComponent.buildFromXML(XML(this._habboWindowManagerComponent.assets.getAssetByName("rarity_item_overlay_griditem_xml").content)));
            this._Str_2326._Str_2429 = this._Str_2302;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set rarityLevel(k:int):void
        {
            this._rarityLevel = k;
            var _local_2:IBitmapWrapperWindow = IBitmapWrapperWindow(this._Str_2302.findChildByName("rarity_item_overlay_plaque_number_bitmap"));
            _local_2.bitmap = LimitedItemOverlayNumberBitmapGenerator._Str_14181(this._habboWindowManagerComponent.assets, this.rarityLevel, _local_2.width, _local_2.height);
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
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
                if (this._Str_2326 != null)
                {
                    this._Str_2326._Str_2429 = null;
                    this._Str_2326 = null;
                }
                if (this._Str_2302 != null)
                {
                    this._Str_2302.dispose();
                    this._Str_2302 = null;
                }
                this._habboWindowManagerComponent = null;
                this._disposed = true;
            }
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }
    }
}


