package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;

    public class SpecialInfoCatalogWidget extends CatalogWidget
    {
        public function SpecialInfoCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _Str_2819(CatalogWidgetEnum.SPECIAL_INFO);
            _window.findChildByName("ctlg_special_txt").caption = "";
            events.addEventListener(CatalogWidgetEvent.SELECT_PRODUCT, this._Str_4806);
            return true;
        }

        private function _Str_4806(k:SelectProductEvent):void
        {
            if (k == null)
            {
                return;
            }
            _window.visible = false;
        }
    }
}
