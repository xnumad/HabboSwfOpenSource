package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
    import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
    import com.sulake.core.window.IWindowContainer;

    public class ExtraInfoBonusAchievementItem extends ExtraInfoListItem 
    {
        public function ExtraInfoBonusAchievementItem(k:int, _arg_2:ExtraInfoItemData)
        {
            super(null, k, _arg_2, ExtraInfoListItem.ALIGN_TOP);
        }

        override public function getRenderedWindow():IWindowContainer
        {
            return null;
        }
    }
}
