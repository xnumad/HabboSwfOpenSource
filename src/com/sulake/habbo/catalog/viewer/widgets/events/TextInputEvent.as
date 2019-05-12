package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class TextInputEvent extends Event 
    {
        private var _text:String;

        public function TextInputEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.TEXT_INPUT, _arg_2, _arg_3);
            this._text = k;
        }

        public function get text():String
        {
            return this._text;
        }
    }
}
