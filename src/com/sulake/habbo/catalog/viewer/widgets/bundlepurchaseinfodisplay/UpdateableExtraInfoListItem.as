package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
	import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
	import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoCatalogWidget;

    public class UpdateableExtraInfoListItem extends ExtraInfoListItem 
    {
        public function UpdateableExtraInfoListItem(k:BundlePurchaseExtraInfoCatalogWidget, _arg_2:int, _arg_3:ExtraInfoItemData, _arg_4:int=0, _arg_5:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function update(k:ExtraInfoItemData):void
        {
            data = k;
        }
    }
}
