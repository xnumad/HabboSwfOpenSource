package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.window.widgets.IBadgeImageWidget;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class AddOnBadgeViewCatalogWidget extends CatalogWidget
    {
        public function AddOnBadgeViewCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                events.removeEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this.onSelectProduct);
                super.dispose();
            }
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.ADD_ON_BADGE_VIEW);
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this.onSelectProduct);
            return true;
        }

        private function onSelectProduct(k:SelectProductEvent):void
        {
            var _local_2:IBadgeImageWidget;
            if (((!(disposed)) && (k.offer.badgeCode)))
            {
                _local_2 = (IWidgetWindow(_window.findChildByName("badge")).widget as IBadgeImageWidget);
                if (_local_2 != null)
                {
                    _local_2.badgeId = k.offer.badgeCode;
                }
            }
        }
    }
}
