package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;

    public class ExtraInfoBonusBadgeItem extends ExtraInfoListItem implements IGetImageListener 
    {
        private var _catalog:HabboCatalog;

        public function ExtraInfoBonusBadgeItem(k:int, _arg_2:ExtraInfoItemData, _arg_3:HabboCatalog)
        {
            super(null, k, _arg_2, ExtraInfoListItem.ALIGN_TOP);
            this._catalog = _arg_3;
        }

        override public function getRenderedWindow():IWindowContainer
        {
            return null;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
        }

        public function imageFailed(k:int):void
        {
        }
    }
}
