package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;

    public class CatalogWidgetBundleDisplayExtraInfoEvent extends Event 
    {
        public static const CWPPEIE_RESET:String = "CWPPEIE_RESET";
        public static const CWPPEIE_HIDE:String = "CWPPEIE_HIDE";
        public static const CWPPEIE_ITEM_CLICKED:String = "CWPPEIE_ITEM_CLICKED";

        private var _id:int;
        private var _data:ExtraInfoItemData;

        public function CatalogWidgetBundleDisplayExtraInfoEvent(k:String, _arg_2:ExtraInfoItemData=null, _arg_3:int=-1)
        {
            super(k);
            this._id = _arg_3;
            this._data = _arg_2;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get data():ExtraInfoItemData
        {
            return this._data;
        }
    }
}
