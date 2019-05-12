package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetShowWarningTextEvent;

    public class WarningCatalogWidget extends CatalogWidget
    {
        public function WarningCatalogWidget(k:IWindowContainer)
        {
            super(k);
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            _window.findChildByName("warning_text").caption = "";
            events.addEventListener(CatalogWidgetEvent.SHOW_WARNING_TEXT, this._Str_22701);
            return true;
        }

        private function _Str_22701(k:CatalogWidgetShowWarningTextEvent):void
        {
            _window.findChildByName("warning_text").caption = k.text;
        }
    }
}
