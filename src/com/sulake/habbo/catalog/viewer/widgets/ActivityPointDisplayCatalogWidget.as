package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
    import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.IPurchasableOffer;

    public class ActivityPointDisplayCatalogWidget extends CatalogWidget 
    {
        public function ActivityPointDisplayCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            var k:HabboCatalog = HabboCatalog(page.viewer.catalog);
            k.events.removeEventListener(PurseUpdateEvent.CATALOG_PURSE_UPDATE, this._Str_14817);
            super.dispose();
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.ACTIVITY_POINT_DISPLAY);
            _window.findChildByName("activity_points_txt").caption = "";
            var k:HabboCatalog = HabboCatalog(page.viewer.catalog);
            k.events.addEventListener(PurseUpdateEvent.CATALOG_PURSE_UPDATE, this._Str_14817);
            return this._Str_19249();
        }

        private function _Str_19249():Boolean
        {
            if (disposed)
            {
                return false;
            }
            if (_window == null)
            {
                return false;
            }
            var k:int = this._Str_13323();
            if (((k < 1) || (!(ActivityPointTypeEnum.isVisible(k)))))
            {
                _window.visible = false;
                return false;
            }
            var _local_2:HabboCatalog = HabboCatalog(page.viewer.catalog);
            var _local_3:String = ("catalog.purchase.youractivitypoints." + k);
            _local_2.localization.registerParameter(_local_3, "activitypoints", ("" + _local_2.getPurse().getActivityPointsForType(k)));
            _window.findChildByName("activity_points_txt").caption = _local_2.localization.getLocalization(_local_3);
            var _local_4:IWindow = _window.findChildByName("activity_point_icon");
            _local_4.style = ActivityPointTypeEnum._Str_5251(k, _local_2, true);
            _window.visible = true;
            return true;
        }

        private function _Str_14817(k:PurseUpdateEvent):void
        {
            this._Str_19249();
        }

        private function _Str_13323():int
        {
            var k:IPurchasableOffer;
            if (((page == null) || (page.offers == null)))
            {
                return 0;
            }
            for each (k in page.offers)
            {
                if (k.activityPointType > 0)
                {
                    return k.activityPointType;
                }
            }
            return 0;
        }
    }
}
