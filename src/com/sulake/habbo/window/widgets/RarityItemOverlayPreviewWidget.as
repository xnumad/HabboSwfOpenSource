package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class RarityItemOverlayPreviewWidget implements _Str_4520 
    {
        public static const RARITY_ITEM_OVERLAY_PREVIEW:String = "rarity_item_overlay_preview";
        private static const _Str_13342:String = (RARITY_ITEM_OVERLAY_PREVIEW + ":level");
        private static const _Str_18738:PropertyStruct = new PropertyStruct(_Str_13342, 0, PropertyStruct.INT);

        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _Str_2302:IWindowContainer;
        private var _rarityLevel:int;
        private var _disposed:Boolean;
        private var _Str_19285:ITextWindow;

        public function RarityItemOverlayPreviewWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._Str_2302 = IWindowContainer(this._habboWindowManagerComponent.buildFromXML(XML(this._habboWindowManagerComponent.assets.getAssetByName("rarity_item_overlay_preview_xml").content)));
            this._Str_19285 = (this._Str_2302.findChildByName("level") as ITextWindow);
            this._Str_2326._Str_2429 = this._Str_2302;
        }

        public function set rarityLevel(k:int):void
        {
            this._rarityLevel = k;
            this._Str_19285.caption = k.toString();
        }

        public function get rarityLevel():int
        {
            return this._rarityLevel;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_18738.withValue(this.rarityLevel));
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_13342:
                        this.rarityLevel = int(_local_2.value);
                        break;
                }
            }
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._Str_2302 != null)
                {
                    this._Str_2302.dispose();
                    this._Str_2302 = null;
                }
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }
    }
}

