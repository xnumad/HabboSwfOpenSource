package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class LimitedItemOverlaySupplyWidget implements _Str_9620 
    {
        public static const LIMITED_ITEM_OVERLAY_SUPPLY:String = "limited_item_overlay_supply";

        private var _Str_2326:IWidgetWindow;
        private var _habboWindowManagerComponent:HabboWindowManagerComponent;
        private var _Str_2302:IWindowContainer;
        private var _Str_19162:int;
        private var _Str_11520:int;

        public function LimitedItemOverlaySupplyWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._Str_2326 = k;
            this._habboWindowManagerComponent = _arg_2;
            this._Str_2302 = IWindowContainer(this._habboWindowManagerComponent.buildFromXML(XML(this._habboWindowManagerComponent.assets.getAssetByName("unique_item_overlay_supply_xml").content)));
            this._Str_2326._Str_2429 = this._Str_2302;
        }

        public function set _Str_13963(k:int):void
        {
            this._Str_19162 = k;
            var _local_2:ITextWindow = (this._Str_2302.findChildByName("items_left_count") as ITextWindow);
            _local_2.text = k.toString();
            var _local_3:Boolean;
            this._Str_2302.findChildByName("unique_item_sold_out_bitmap").visible = _local_3;
        }

        public function get _Str_13963():int
        {
            return this._Str_19162;
        }

        public function set _Str_3442(k:int):void
        {
        }

        public function set _Str_4345(k:int):void
        {
            this._Str_11520 = k;
            var _local_2:ITextWindow = (this._Str_2302.findChildByName("items_total_count") as ITextWindow);
            _local_2.text = k.toString();
        }

        public function get _Str_3442():int
        {
            return 0;
        }

        public function get _Str_4345():int
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
                if (this._Str_2302 != null)
                {
                    this._Str_2302.dispose();
                    this._Str_2302 = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._Str_2302 == null;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }
    }
}


