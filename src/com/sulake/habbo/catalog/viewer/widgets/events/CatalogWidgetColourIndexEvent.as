package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetColourIndexEvent extends Event 
    {
        private var _index:int = 0;

        public function CatalogWidgetColourIndexEvent(k:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(CatalogWidgetEvent.COLOUR_INDEX, _arg_2, _arg_3);
            this._index = k;
        }

        public function get index():int
        {
            return this._index;
        }
    }
}
