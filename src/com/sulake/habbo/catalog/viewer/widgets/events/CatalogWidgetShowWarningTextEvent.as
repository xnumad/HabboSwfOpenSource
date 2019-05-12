package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetShowWarningTextEvent extends Event 
    {
        private var _text:String;

        public function CatalogWidgetShowWarningTextEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.SHOW_WARNING_TEXT, _arg_2, _arg_3);
            this._text = k;
        }

        public function get text():String
        {
            return this._text;
        }
    }
}
